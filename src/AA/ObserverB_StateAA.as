package AA
{
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	import AA.observe.Flicker_StateAA;
	import AA.observe.ObserverB_alert_StateAA;
	import AA.observe.SwipeIcon_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.window.Key;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ImageAA;
	import Lv_2.display.NodeAA;
	import Lv_2.display.StateAA;
	import Lv_2.display.effects.TintEffectAA;
	
	import utils.ViewConfig;
	
public class ObserverB_StateAA extends StateAA
{
	public function ObserverB_StateAA( hasAlert:Boolean, startIconCoord:Point = null  )
	{
		m_startIconCoord = startIconCoord;
		_hasAlert = hasAlert;
	}
	
	override public function onEnter():void {
		var img:ImageAA;
		var node:NodeAA;
		var 
		
		img = new ImageAA;
		img.textureId = "bg/bg_A.png";
		this.getFusion().addNode(img);
		
		
//		img = new ImageAA;
//		img.textureId = "observe/text_1.png";
//		this.getFusion().addNode(img);
//		img.x = (this.getWindow().windowWidth - img.getSourceWidth())/2;
//		img.y = 1550;
		
		if(_hasAlert){
			node = this.getMorph().createSubMorph(new ObserverB_alert_StateAA).getNode();
			this.getFusion().addNode(node);
			
		}
		
//		img = new ImageAA;
//		img.textureId = "connected/img_A.png";
//		this.getFusion().addNode(img);
//		img.pivotX = img.getSourceWidth() / 2;
//		img.pivotY = img.getSourceHeight() / 2;
//		img.x = ViewConfig.SETTING_X;
//		img.y = ViewConfig.SETTING_Y;
		
		m_iconState = new SwipeIcon_StateAA(m_startIconCoord);
		m_icon = this.getMorph().createSubMorph(m_iconState).getNode();
		this.getFusion().addNode(m_icon);
		m_icon.eventClick().addListener(onSettingB);
		
		
		
		img = new ImageAA;
		img.textureId = "connected/shot.png";
		this.getFusion().addNode(img);
		img.x = (this.getWindow().windowWidth - img.getSourceWidth()) / 2 + 13;
		img.y = 1684;
//		img.effect = new TintEffectAA(0x3333dd);
		img.visible = false;
		
		img.eventClick().addListener(onFlicker);
	}
	
	
//	override public function onKeyboard(k:Key):Boolean {
//		if(k.getKeyCode() == Keyboard.BACK) {
//			AAFacade.getInstance().getRoot().switchTo(new Scan_StateAA);
//		}
//		return true;
//	}
	
	
	
	
	
	private var m_photo:ImageAA;
	private var m_icon:NodeAA;
	private var m_iconState:SwipeIcon_StateAA;
	private var m_startIconCoord:Point;
	
	private var _hasAlert:Boolean;
	
	
	
	
	private function onSettingB(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new SettingB_StateAA(m_icon.x, m_icon.y, m_iconState.isLeft()));
	}
	
	
	private function onFlicker(e:AEvent):void{
		this.getFusion().addNode(this.getMorph().createSubMorph(new Flicker_StateAA()).getNode());
		
		this.____doAddPhoto();
	}
	
	private function ____doAddPhoto() : void {
		if(!m_photo){
			m_photo = new ImageAA;
			m_photo.textureId = "connected/photo.png";
			this.getFusion().addNode(m_photo);
			m_photo.pivotX = m_photo.getSourceWidth()/ 2;
			m_photo.pivotY = m_photo.getSourceHeight()/2;
			m_photo.x = ViewConfig.PHOTO_X;
			m_photo.y = ViewConfig.PHOTO_Y;
			m_photo.eventClick().addListener(onAlbum);
		}
	}
	
	private function onAlbum(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new Album_StateAA(false));
	}
	
}
}