
GameLayer = cc.LayerColor.extend({

	ctor: function() {
		this._super(cc.color.GREEN);


        if(!cc.sys.isNative){
            cc.log("CAN ONLY RUN IN Native");
            return true;
        }
        this._db = new sql.SQLiteWrapper();
        this._dbPath = this._db.initializing("data.db","res","");

        this._isOpen = this._db.open(this._dbPath);

        cc.log("数据库打开结果:" + this._isOpen?"已打开...":"未打开...");

        if(this._isOpen){
            var st = this._db.statement("select * from equip");

            var ary = [];
            while(st.nextRow()){
                var equipVO = new CEquipVO();
                equipVO.wid = parseInt(st.valueString(0));
                equipVO.name = st.valueString(1);
                equipVO.desc = st.valueString(2);
                equipVO.level = st.valueString(3);
                equipVO.icon = st.valueString(4);
                equipVO.quality = st.valueString(5);
                ary.push(equipVO);
            }

            for(var vo in ary){
                cc.log("equipData:" + ary[vo].toString());
            }
        }

        var size = cc.winSize;
        console.log(size.width+' '+size.height);
        size=2*size;
        var background = new cc.Sprite(res.Back_jpg);
        background.setAnchorPoint(cc.p(0,0));
        this.addChild(background);
        background.setPosition(0,0);

        var button = new ccui.ImageView("res/Heiti10.png", ccui.Widget.LOCAL_TEXTURE);
        button.setName("_button");
        this.addChild(button);

		sz.uiloader.widgetFromJsonFile(this, "res/DemoLogin.ExportJson", {eventPerfix:"_on", memberPrefix:"_"} );
        this.rootNode.setPosition(this.width /2 , this.height /2);
        this.rootNode.setAnchorPoint(0.5, 0.5);
		cc.assert(this._loginButton.name === "_loginButton");
		cc.assert(this._closeButton.name === "_closeButton");
        cc.assert(this._button.name === "_button");

        this.testRegisterTouchEvent();
	},

    testRegisterTouchEvent: function() {
        //为当前layer注册触摸
        sz.uiloader.registerTouchEvent(this, this);

        //创建一个sprite
        var spriteButton = new cc.Sprite("#button.png");
        spriteButton.setName("_spriteButton");
        spriteButton.x = this.width - spriteButton.width * 0.5;
        spriteButton.y = spriteButton.height * 0.5;
        this.addChild(spriteButton);
        sz.uiloader.registerTouchEvent(spriteButton, this);
    },

    _onSpriteButtonTouchBegan: function() {
        cc.log('_onSpriteButtonTouchBegan');
        return true;
    },


    _onTouchBegan: function(sender, touch) {
        cc.log("GameLayer onTouchBegan" + JSON.stringify(touch.getLocation()));
        return true;
    },

    _onTouchMoved: function(sender, touch) {
        cc.log("GameLayer onTouchMoved" + JSON.stringify(touch.getLocation()));
    },

    _onTouchEnded: function(sender, touch) {
        cc.log("GameLayer onTouchEnded" + JSON.stringify(touch.getLocation()));
    },

    _onButtonTouchBegan: function() {
        cc.log("_onButtonTouchBegan");
    },

    _onButtonTouchLong: function() {
        cc.log("_onButtonTouchLong");
    },

	_onLoginButtonEvent: function(sender, type) {
		switch (type) {
			case 0:
				cc.log("_onLoginButtonEvent: began");
				break;
			case 1:
				cc.log("_onLoginButtonEvent: move");
				break;
            case 2:
				cc.log("_onLoginButtonEvent: end");
                //加载cocostudio2.1编辑器生成的UI
                cc.loader.load(g_cocos, function() {
                    //var scene = InventoryLayer.scene();
                    //cc.director.runScene(scene);
                    cc.director.runScene(new SelectScene());
                });
				break;
		}
	},

    //_onLoginButtonTouchBegan: function() {
    //    cc.log("_onLoginButtonTouchBegan");
    //},

    _onLoginButtonTouchLong: function(sender, type) {
        cc.log("_onLoginButtonTouchLong");
    },

    //_onLoginButtonTouchEnded: function(sender) {
    //    cc.log("_onLoginButtonTouchEnded");
    //    this._nameTextField.string = "userName";
    //},

	_onCloseButtonTouchBegan: function(sender) {
		cc.log("_onCloseButtonTouchBegan");
	},

	_onCloseButtonTouchEnded: function(sender) {
		cc.log("_onCloseButtonTouchEnded");
	},

	_onNameTextFieldInsertText: function(sender) {
		cc.log(sender.string);
	},

	_onAgreeCheckBoxSelected: function(sender) {
		cc.log("_onAgreeCheckBoxSelected");
	},

	_onAgreeCheckBoxUnselected: function(sender) {
		cc.log("_onAgreeCheckBoxUnselected");
	},

	_onNameLabelTouchBegan: function() {
		cc.log("_onNameLabelTouchBegan");
	},

    _onNameLabelTouchLong: function() {
        cc.log("_onNameLabelTouchLong");
    }
});
