//
//  main.cpp
//  assignment1
//
//  Created by ele on 3/30/16.
//  Copyright © 2016 ele. All rights reserved.
//

#include <iostream>
#include <assert.h>
#include "scene_parser.hpp"
#include "image.hpp"

int main(int argc, const char * argv[]) {
    const char *input_file = NULL;
    int width = 100;
    int height = 100;
    const char *output_file = NULL;
    float depth_min = 0;
    float depth_max = 1;
    const char *depth_file = NULL;
    const char *normal_file = NULL;
    bool shade_back = false;
    
    // sample command line:
    // raytracer -input scene2_05_inside_sphere.txt -size 200 200 -output output2_05.tga -depth 9 11 depth2_05.tga -normals normals2_05.tga -shade_back
    
    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i],"-input")) {
            i++; assert (i < argc);
            input_file = argv[i];
        } else if (!strcmp(argv[i],"-size")) {
            i++; assert (i < argc);
            width = atoi(argv[i]);
            i++; assert (i < argc);
            height = atoi(argv[i]);
        } else if (!strcmp(argv[i],"-output")) {
            i++; assert (i < argc);
            output_file = argv[i];
        } else if (!strcmp(argv[i],"-depth")) {
            i++; assert (i < argc);
            depth_min = atof(argv[i]);
            i++; assert (i < argc);
            depth_max = atof(argv[i]);
            i++; assert (i < argc); 
            depth_file = argv[i];
        }else if (!strcmp(argv[i], "-normals")){
            i++; assert (i < argc);
            normal_file = argv[i];
        }
        else if (!strcmp(argv[i], "-shade_back")){
            i++; //assert (i < argc);
            shade_back = true;
        }
        else {
            printf ("whoops error with command line argument %d: '%s'\n",i,argv[i]);
            assert(0);
        }
    }
    
    Image im(width, height),im_nor(width, height),im_depth(width, height);

    SceneParser sp(input_file);
    Camera * cam = sp.getCamera();
    Material bgMaterial = Material(sp.getBackgroundColor());
    for (int i =0; i<height; i++) {
        for (int j = 0; j<width; j++) {
            Vec3f c_pixel;
            Ray ray=cam->generateRay(Vec2f(i*1.0/width, j*1.0/height ));
            Hit hit(numeric_limits<float>::max(), &bgMaterial, Vec3f(0, 0, 0));
            if(sp.getGroup()->intersect(ray, hit, cam->getTMin())){
                Vec3f c_object = hit.getMaterial()->getDiffuseColor();
                Vec3f c_ambient = sp.getAmbientLight();
                
                Vec3f::Mult(c_pixel, c_object, c_ambient);
                Vec3f h = hit.getNormal();
                for (int i = 0; i<sp.getNumLights(); i++) {
                    Vec3f dir,col,tmp;
                    
                    sp.getLight(i)->getIllumination(hit.getIntersectionPoint(), dir, col);
                    float clam = dir.Dot3(h);//clam
                    if (shade_back & (clam<0)) {
                        h=h*(-1.0);
                        clam = dir.Dot3(h);
                    }
                    Vec3f::Mult(tmp, col, c_object);
                    tmp*=clam;
                    c_pixel+=tmp;
                }
                im.SetPixel(i, j, c_pixel);
                
                im_nor.SetPixel(i, j, h);
            }
            else
                c_pixel =bgMaterial.getDiffuseColor();
            
            im.SetPixel(i, j, c_pixel);
            if (depth_file) {
                c_pixel.Clamp(depth_min,depth_max);
                im_depth.SetPixel(i, j, c_pixel);
            }
            
        }
    }
    if (normal_file) {
        im_nor.SaveTGA(normal_file);
    }
    if (depth_file) {
        im_depth.SaveTGA(depth_file);
    }
    im.SaveTGA(output_file);
    
    return 0;
}
