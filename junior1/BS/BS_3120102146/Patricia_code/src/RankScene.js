/**
 * Created by ele on 6/27/15.
 */
var  RankLayer= cc.LayerColor.extend({
    sprite:null,
    ctor:function () {
        //////////////////////////////
        // 1. super init first
        this._super(cc.color("#ffffff"));

        var size = cc.winSize;

        //background
        var background = new cc.Sprite(res.Back_jpg);
        background.setScale(size.width/background.width,size.height/background.height);
        background.setAnchorPoint(cc.p(0,0));
        this.addChild(background);
        background.setPosition(0,0);

        var paper = new cc.Sprite(res.Paper_png);
        //paper.setScale(size.width/background.width,size.height/background.height);
        paper.setScale(0.6);
        paper.setAnchorPoint(cc.p(0.5,0.5));
        this.addChild(paper);
        paper.setPosition(size.width/2,size.height/2);

        //title
        var blacktitle = new cc.LabelTTF("Rank","Consolas",50);
        //title.setScale(4);
        blacktitle.x = size.width/2;blacktitle.y = size.height/2+230;
        this.addChild(blacktitle);
        blacktitle.setColor(cc.color("#000000"));

        //Ele
        var blacktitle = new cc.LabelTTF("1. Ele Win "+5+", Lose 2","Consolas",30);
        //title.setScale(4);
        blacktitle.x = size.width/2;blacktitle.y = size.height/2+190;
        this.addChild(blacktitle);
        blacktitle.setColor(cc.color("#000000"));

        //Tom
        var blacktitle = new cc.LabelTTF("2. Tom Win 2, Lose "+5,"Consolas",30);
        //title.setScale(4);
        blacktitle.x = size.width/2;blacktitle.y = size.height/2+150;
        this.addChild(blacktitle);
        blacktitle.setColor(cc.color("#000000"));
        //Player1
        var blacktitle = new cc.LabelTTF("3. Player1 Win 1, Lose 0","Consolas",30);
        //title.setScale(4);
        blacktitle.x = size.width/2;blacktitle.y = size.height/2+110;
        this.addChild(blacktitle);
        blacktitle.setColor(cc.color("#000000"));
        //Player2
        var blacktitle = new cc.LabelTTF("4. Player2 Win 0, Lose 1","Consolas",30);
        //title.setScale(4);
        blacktitle.x = size.width/2;blacktitle.y = size.height/2+70;
        this.addChild(blacktitle);
        blacktitle.setColor(cc.color("#000000"));


        var back1 = new cc.Sprite(res.Back1_jpg);
        var back2 = new cc.Sprite(res.Back3_jpg);
        var back = new cc.MenuItemSprite(back1,back2);
        back.x=size.width/2;back.y=size.height/2-230;
        back.setOpacity(200);
        //begin.setScale(0.5);

        var listener5 = cc.EventListener.create({
            event:cc.EventListener.TOUCH_ONE_BY_ONE,
            onTouchBegan:function(touch,event) {
                if(cc.rectContainsPoint(event.getCurrentTarget().getBoundingBox(),touch.getLocation())){
                    console.log(">>>");
                    //cc.eventManager.removeListener(listener);
                    cc.director.runScene(new SelectScene());
                }
            }
        });
        cc.eventManager.addListener(listener5, back);

        var menu = new cc.Menu(back);
        menu.x=0;menu.y=0;
        this.addChild(menu);

        return true;
    }
});

var RankScene = cc.Scene.extend({
    onEnter:function () {
        this._super();
        var layer = new RankLayer();
        this.addChild(layer);
    }
});