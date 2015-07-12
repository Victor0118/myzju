/**
 * Created by ele on 6/27/15.
 */

var role=null;
var role2=null;
var text1=null;
var Ball = cc.Sprite.extend({
    z:0,w:0,
    ctor:function(x,y,z,w){

        this.z=z;this.w=w;
        this._super(res.Ball_png);

        Ball.ballId ++;
        this.ballId = Ball.ballId;
        console.log("Create Ball, id = "+this.ballId);

        //this.x = Math.random()*400 +100;
        this.x = x;
        this.y = y;
        this.setScale(0.2);

        if(w ==1)
        this.setColor(cc.color("#000000"));
        else
            this.setColor(cc.color("#ffffff"));
        this.scheduleUpdate();
    },

    update: function () {
        //console.log("this.z"+this.z);
        if(this.z==0)
            this.y+=10;
        else if(this.z==1)
            this.y-=10;
        else if(this.z==2)
            this.x-=10;
        else if(this.z==3)
            this.x+=10;

        if(this.w==1){
            var distance = cc.pDistance(this.getPosition(), role2.getPosition());
            var radiusSum = this.width + role2.width;
            if(distance < 40){
                //发生碰撞

                text1.setVisible(true);
                text1.setString("You Win");
                this.unscheduleUpdate();
                this.removeFromParent();
                cc.pool.putInPool(this);
                console.log("Remove ball, id ="+this.ballId);
            }
        }
        else if(this.w==2){
            var distance = cc.pDistance(this.getPosition(), role.getPosition());
            var radiusSum = this.width + role.width;
            if(distance < 40){
                //发生碰撞

                text1.setVisible(true);
                text1.setString("You Lose");
                this.unscheduleUpdate();
                this.removeFromParent();
                cc.pool.putInPool(this);
                console.log("Remove ball, id ="+this.ballId);
            }
        }


        //cc.log(role.x+' '+role.y);
        if(this.y>cc.winSize.height|this.y<0|this.x<0|this.x>cc.winSize.width){
            this.unscheduleUpdate();
            this.removeFromParent();
            cc.pool.putInPool(this);
            console.log("Remove ball, id ="+this.ballId);
        }
    },

    reuse:function(x,y,z,w){

        if(w ==1)
            this.setColor(cc.color("#000000"));
        else
            this.setColor(cc.color("#ffffff"));
        this.z=z;
        this.w=w;
        this.x=x;
        this.y = y;
        this.scheduleUpdate();
    }


});

Ball.ballId = 0;

Ball.reCreate = function (x, y, z,w) {
    if(cc.pool.hasObject(Ball)){
        return cc.pool.getFromPool(Ball,x,y,z,w);

    }
    else{
        return new Ball(x,y,z,w);
    }
}

var  PlayLayer= cc.LayerColor.extend({
    sprite:null,
    ctor:function () {

        this._super(cc.color("#ffffff"));
        var size = cc.winSize;

        var background = new cc.Sprite(res.Back2_jpg);
        background.setScale(size.width/background.width,size.height/background.height);
        background.setAnchorPoint(cc.p(0,0));
        this.addChild(background);
        background.setPosition(0,0);

        ////background
        //var background = new cc.Sprite(res.Back2_jpg);
        //background.setScale(size.width/background.width,size.height/background.height);
        //background.setAnchorPoint(cc.p(0,0));
        //this.addChild(background);
        //background.setPosition(0,0);

        //role
        role = new cc.Sprite(res.Black_png);
        role.setScale(0.3);
        role.x=150;role.y=150;
        this.addChild(role);

        role2 = new cc.Sprite(res.White_png);
        role2.setScale(0.3);
        role2.x=size.width-150;role2.y=size.height-150;
        this.addChild(role2);


        text1 = new cc.LabelTTF("You Win","Consolas",20);

        text1.x = size.width/2;text1.y = size.height/2-100;
        this.addChild(text1);
        text1.setVisible(false);

        var listener2 = cc.EventListener.create({
            event:cc.EventListener.TOUCH_ONE_BY_ONE,
            onTouchBegan:function(touch,event) {
                if(cc.rectContainsPoint(event.getCurrentTarget().getBoundingBox(),touch.getLocation())){
                    console.log(">>>");
                    cc.director.runScene(new SelectScene());
                    //cc.eventManager.removeListener(listener);
                    //text1.attachWithIME();
                }else{
                    //text1.detachWithIME();
                }
            }
        },text1);
        cc.eventManager.addListener(listener2, text1);


        //this.schedule(function(){
        //    var distance = cc.pDistance(role.getPosition(), role2.getPosition());
        //    var radiusSum = role.width + role2.width;
        //    //cc.log(role.width);
        //    //cc.log("distance:" + distance + "; radius:" + radiusSum);
        //    if(distance < 40){
        //        //发生碰撞
        //        text1.setVisible(true);
        //    }
        //},0.1);
        var i=20;var j=0.5;
        var act1 = new cc.MoveBy(j, cc.p(i,0));
        var act2 = new cc.MoveBy(j, cc.p(-i,0));
        var act3 = new cc.MoveBy(j, cc.p(0,i));
        var act4 = new cc.MoveBy(j,cc.p(0,-i));

        var listener3 = cc.EventListener.create({
            event:cc.EventListener.KEYBOARD,
            onKeyPressed:function(keyCode,event) {
                if(keyCode == cc.KEY.l) {
                    role2.runAction(act1);//new cc.MoveBy(j, cc.p(i,0)));
                }
                if(keyCode == cc.KEY.j){
                    role2.runAction(act2);//new cc.MoveBy(j, cc.p(-i,0)));
                }
                if(keyCode == cc.KEY.i){
                    role2.runAction(act3);//new cc.MoveBy(j, cc.p(0,i)));
                }
                if(keyCode == cc.KEY.k){
                    role2.runAction(act4);//new cc.MoveBy(j, cc.p(0,-i)));
                }
                if(keyCode == cc.KEY.h){
                    this.addChild((new Ball.reCreate(role2.x,role2.y,0,2)));
                }
                else if(keyCode == cc.KEY.n){
                    this.addChild((new Ball.reCreate(role2.x,role2.y,1,2)));
                }
                else if(keyCode == cc.KEY.b){
                    this.addChild((new Ball.reCreate(role2.x,role2.y,2,2)));
                }
                else if(keyCode == cc.KEY.m){
                    this.addChild((new Ball.reCreate(role2.x,role2.y,3,2)));
                }
            }.bind(this),
        });
        cc.eventManager.addListener(listener3, role2);

        var listener1 = cc.EventListener.create({
            event:cc.EventListener.KEYBOARD,
            onKeyPressed:function(keyCode,event) {
                if(keyCode == cc.KEY.d) {
                    role.runAction(act1);//new cc.MoveBy(j, cc.p(i,0)));
                }
                if(keyCode == cc.KEY.a){
                    role.runAction(act2);//new cc.MoveBy(j, cc.p(-i,0)));
                }
                if(keyCode == cc.KEY.w){
                    role.runAction(act3);//new cc.MoveBy(j, cc.p(0,i)));
                }
                if(keyCode == cc.KEY.s){
                    role.runAction(act4);//new cc.MoveBy(j, cc.p(0,-i)));
                }
                if(keyCode == cc.KEY.up){
                    this.addChild((new Ball.reCreate(role.x,role.y,0,1)));
                }
                else if(keyCode == cc.KEY.down){
                    this.addChild((new Ball.reCreate(role.x,role.y,1,1)));
                }
                else if(keyCode == cc.KEY.left){
                    this.addChild((new Ball.reCreate(role.x,role.y,2,1)));
                }
                else if(keyCode == cc.KEY.right){
                    this.addChild((new Ball.reCreate(role.x,role.y,3,1)));
                }
            }.bind(this),
        });
        cc.eventManager.addListener(listener1, role);

        return true;
    }
});

var PlayScene = cc.Scene.extend({
    onEnter:function () {
        this._super();
        var layer = new PlayLayer();
        this.addChild(layer);
    }
});