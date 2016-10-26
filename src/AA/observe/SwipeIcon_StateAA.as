package AA.observe
{
	import flash.geom.Point;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.window.Touch;
	
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	
	import Lv_3.animate.ATween;
	import Lv_3.animate.TweenMachine;
	import Lv_3.animate.easing.Quad;
	import Lv_3.gesture.GestureMachine;
	import Lv_3.gesture.LongPressGesture;
	import Lv_3.gesture.SwipeGesture;
	
	import utils.ViewConfig;
	
public class SwipeIcon_StateAA extends StateAA
{
	public function SwipeIcon_StateAA(startIconCoord:Point = null)
	{
		super();
		
		m_startIconCoord = startIconCoord;
		
	}
	
	public function isLeft() : Boolean {
		return _isLeft;
	}
	
	
	override public function onEnter():void {
		var img:ImageAA;
		var sg:LongPressGesture;
		
		img = new ImageAA;
		img.textureId = "connected/img_A.png";
		this.getFusion().addNode(img);
		img.pivotX = img.getSourceWidth() / 2;
		img.pivotY = img.getSourceHeight() / 2;
		
		img = new ImageAA;
		img.textureId = "connected/img_B.png";
		this.getFusion().addNode(img);
		img.pivotX = img.getSourceWidth() / 2;
		img.pivotY = img.getSourceHeight() / 2;
		img.touchable = false;
		
		if(m_startIconCoord){
			this.getFusion().x = m_startIconCoord.x;
			this.getFusion().y = m_startIconCoord.y;
			
			if(this.getFusion().x >= this.getWindow().windowWidth / 2) {
				_isLeft = false;
			}
		}
		else {
			this.getFusion().x = ViewConfig.SETTING_X;
			this.getFusion().y = ViewConfig.SETTING_Y;
		}
		
		this.getFusion().eventPress().addListener(onPressIcon);
		
//		sg = new LongPressGesture;
//		sg.setDelay(0.3);
//		GestureMachine.getInstance().addGesture(this.getFusion(), sg);
//		sg.eventSuccess().addListener(onSwipe);
		
		
	}
	
	override public function onExit():void{
		TweenMachine.getInstance().stopAll();
//		GestureMachine.getInstance().stopAll();
	}
	
	
	
	private var _tween:ATween;
	private var _movingCount:int;
	private var _isLeft:Boolean = true;
	
	private var m_startIconCoord:Point;
	
//	private function onPressIcon(e:AEvent):void{
//		TweenMachine.getInstance().stopTarget(img);
//	}
	
	private function onPressIcon(e:AEvent):void{
		var sg:LongPressGesture;
		var touch:Touch;
		var list:Vector.<Touch>;
		
		touch = this.getFusion().eventPress().getTouch();
//		trace("sss");
		
//		sg = e.getTarget() as LongPressGesture;
//		list = sg.getTouchList();
//		touch = list[0];
//		touch.unbinding();
		
		touch.eventMove().addListener(onTouchMove);
		touch.eventRelease().addListener(onTouchRelease);
//		this.getFusion().touchable = false;
	}
	
	private function onTouchMove(e:AEvent):void{
		var touch:Touch;
		
		touch = e.getTarget() as Touch;
		if(++_movingCount==4) {
			this.getFusion().touchable = false;
			touch.unbinding();
		}
		if(_movingCount >= 4) {
			_tween = TweenMachine.to(this.getFusion(), 0.1, {x:touch.getX(), y:touch.getY()});
			_tween.easing = Quad.easeOut;
		}
		
//		this.getFusion().x = touch.getX();
//		this.getFusion().y = touch.getY();
	}
	
	private function onTouchRelease(e:AEvent):void{
		var node:NodeAA;
		
		node = this.getFusion();
		if(node.x < this.getWindow().windowWidth /2){
			_tween = TweenMachine.to(this.getFusion(), 0.15, {x:ViewConfig.SETTING_X});
			_tween.onComplete = onSwipeTweenComplete;
			_isLeft = true;
		}
		else if(node.x >= this.getWindow().windowWidth /2){
			_tween = TweenMachine.to(this.getFusion(), 0.15, {x:this.getWindow().windowWidth - ViewConfig.SETTING_X});
			_tween.onComplete = onSwipeTweenComplete;
			_isLeft = false;
		}
		if(node.y < ViewConfig.DRAG_OFFSET_Y){
			_tween = TweenMachine.to(this.getFusion(), 0.15, {y:ViewConfig.DRAG_OFFSET_Y});
		}
		else if(node.y >= this.getWindow().windowHeight - ViewConfig.DRAG_OFFSET_Y){
			_tween = TweenMachine.to(this.getFusion(), 0.15, {y:this.getWindow().windowHeight - ViewConfig.DRAG_OFFSET_Y});
		}
		_movingCount = 0;
	}
	
	private function onSwipeTweenComplete():void{
		this.getFusion().touchable = true;
	}
}
}