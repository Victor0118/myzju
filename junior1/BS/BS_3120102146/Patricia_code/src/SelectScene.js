/**
 * Created by ele on 6/27/15.
 */
var  SelectLayer= cc.LayerColor.extend({
    sprite:null,
    ctor:function (num) {
        //////////////////////////////
        // 1. super init first
        this._super(cc.color("#ffffff"));

        var size = cc.winSize;

        //background
        var background = new cc.Sprite(res.Back_jpg);
        //background.setScale(size.width/background.width,size.height/background.height);
        background.setAnchorPoint(cc.p(0,0));
        this.addChild(background);
        background.setPosition(0,0);


        //title
        var title = new cc.LabelTTF("Select","Consolas",50);
        //title.setScale(4);
        title.x = size.width/2;title.y = size.height/2+230;
        this.addChild(title);
        title.setColor(cc.color("#000000"));

        //title
        var blacktitle = new cc.LabelTTF("Black","Consolas",40);
        //title.setScale(4);
        blacktitle.x = size.width/2-300;blacktitle.y = size.height/2+150;
        this.addChild(blacktitle);
        blacktitle.setColor(cc.color("#000000"));

        var blackpng = new cc.Sprite(res.Black_png);
        blackpng.x = size.width/2-300;blackpng.y = size.height/2-20;
        this.addChild(blackpng);

        var listener1 = cc.EventListener.create({
            event:cc.EventListener.TOUCH_ONE_BY_ONE,
            onTouchBegan:function(touch,event) {
                if(cc.rectContainsPoint(event.getCurrentTarget().getBoundingBox(),touch.getLocation())){
                    //cc.eventManager.removeListener(listener);
                    blackpng.setOpacity(255);
                    whitepng.setOpacity(100);
                    blackpng.setScale(1);
                    whitepng.setScale(0.6);
                }
            }
        });
        cc.eventManager.addListener(listener1, blacktitle);

        var whitetitle = new cc.LabelTTF("White","Consolas",40);
        //title.setScale(4);
        whitetitle.x = size.width/2+300;whitetitle.y = size.height/2+150;
        this.addChild(whitetitle);

        var whitepng = new cc.Sprite(res.White_png);
        whitepng.x = size.width/2+300;whitepng.y = size.height/2-20;
        this.addChild(whitepng);whitepng.setOpacity(100);whitepng.setScale(0.6);

        var listener2 = cc.EventListener.create({
            event:cc.EventListener.TOUCH_ONE_BY_ONE,
            onTouchBegan:function(touch,event) {
                if(cc.rectContainsPoint(event.getCurrentTarget().getBoundingBox(),touch.getLocation())){
                    //cc.eventManager.removeListener(listener);
                    whitepng.setOpacity(255);
                    blackpng.setOpacity(100);
                    whitepng.setScale(1);
                    blackpng.setScale(0.6);
                }
            }
        });
        cc.eventManager.addListener(listener2, whitetitle);


        var begin1 = new cc.Sprite(res.Begin1_jpg);
        var begin2 = new cc.Sprite(res.Begin2_jpg);
        var begin = new cc.MenuItemSprite(begin1,begin2);
        begin.x=size.width/2;begin.y=size.height/2;
        //begin.setScale(0.5);

        var listener3 = cc.EventListener.create({
            event:cc.EventListener.TOUCH_ONE_BY_ONE,
            onTouchBegan:function(touch,event) {
                if(cc.rectContainsPoint(event.getCurrentTarget().getBoundingBox(),touch.getLocation())){
                    console.log(">>>");
                    //cc.eventManager.removeListener(listener);
                    //cc.director.runScene(new PlayScene());
                    cc.director.runScene(new PlayScene());

                }
            }
        });
        cc.eventManager.addListener(listener3, begin);

        var rank1 = new cc.Sprite(res.Rank1_jpg);
        var rank2 = new cc.Sprite(res.Rank2_jpg);
        var rank = new cc.MenuItemSprite(rank1,rank2);
        rank.x=size.width/2;rank.y=size.height/2-40;
        //begin.setScale(0.5);

        var listener4 = cc.EventListener.create({
            event:cc.EventListener.TOUCH_ONE_BY_ONE,
            onTouchBegan:function(touch,event) {
                if(cc.rectContainsPoint(event.getCurrentTarget().getBoundingBox(),touch.getLocation())){
                    console.log(">>>");
                    //cc.eventManager.removeListener(listener);
                    cc.director.runScene(new RankScene());
                    //var scene = new cc.Scene();
                    //scene.addChild(new GameLayer());
                    //cc.director.runScene(scene);

                }
            }
        });
        cc.eventManager.addListener(listener4, rank);


        var back1 = new cc.Sprite(res.Back1_jpg);
        var back2 = new cc.Sprite(res.Back3_jpg);
        var back = new cc.MenuItemSprite(back1,back2);
        back.x=size.width/2;back.y=size.height/2-80;
        //begin.setScale(0.5);

        var listener5 = cc.EventListener.create({
            event:cc.EventListener.TOUCH_ONE_BY_ONE,
            onTouchBegan:function(touch,event) {
                if(cc.rectContainsPoint(event.getCurrentTarget().getBoundingBox(),touch.getLocation())){
                    console.log(">>>");
                    //cc.eventManager.removeListener(listener);
                    //cc.director.runScene(new PlayScene());
                    var scene = new cc.Scene();
                    scene.addChild(new GameLayer());
                    cc.director.runScene(scene);

                }
            }
        });
        cc.eventManager.addListener(listener5, back);

        var menu = new cc.Menu(begin,rank,back);
        menu.x=0;menu.y=0;
        this.addChild(menu);

        return true;
    }
});

var SelectScene = cc.Scene.extend({
    onEnter:function () {
        this._super();
        var layer = new SelectLayer();
        this.addChild(layer);
    }
});