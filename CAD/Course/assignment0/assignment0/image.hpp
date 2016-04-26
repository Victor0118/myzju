//
//  image.hpp
//  assignment0
//
//  Created by ele on 3/28/16.
//  Copyright © 2016 ele. All rights reserved.
//

#ifndef image_hpp
#define image_hpp

#include <stdio.h>
#include <assert.h>
#include "vectors.h"

class Image {
public:
    // ========================
    // CONSTRUCTOR & DESTRUCTOR
    Image(int w, int h) {
        width = w;
        height = h;
        data = new Vec3f[width*height]; }
//    Image(const Image& img){
//        width = img.width;
//        height = img.height;
//        data = new Vec3f[width*height];
//        for (int i=0; i<width*height ; i++) {
//            data[i] = img.data[i];
//        }
//    }
    ~Image() {
        if(data != NULL)
            delete [] data;
        data=NULL;
    }
    
    // =========
    // ACCESSORS
    int Width() const { return width; }
    int Height() const { return height; }
    const Vec3f& GetPixel(int x, int y) const {
        assert(x >= 0 && x < width);
        assert(y >= 0 && y < height);
        return data[y*width + x]; }
    
    // =========
    // MODIFIERS
    void SetAllPixels(const Vec3f &color) {
        for (int i = 0; i < width*height; i++) {
            data[i] = color; } }
    void SetPixel(int x, int y, const Vec3f &color) {
        assert(x >= 0 && x < width);
        assert(y >= 0 && y < height);
        data[y*width + x] = color; }
    
    // ===========
    // LOAD & SAVE
    static Image* LoadPPM(const char *filename);
    void SavePPM(const char *filename) const;
    static Image* LoadTGA(const char *filename);
    void SaveTGA(const char *filename) const;
    
    // extension for image comparison
    static Image* Compare(Image* img1, Image* img2);
    
private:
    
    // ==============
    // REPRESENTATION
    int width;
    int height;
    Vec3f *data;
};

#endif /* image_hpp */
