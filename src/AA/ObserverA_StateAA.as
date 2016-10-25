package AA
{
	import flash.ui.Keyboard;
	
	import AA.observe.Flicker_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.window.Key;
	
	import Lv_2.display.AAFacade;
	import Lv_2.display.ImageAA;
	import Lv_2.display.StateAA;
	import Lv_2.display.effects.TintEffectAA;
	
	import utils.ViewConfig;
	
public class ObserverA_StateAA extends StateAA
{
//	public function ObserverA_StateAA( hasPhoto:Boolean )
//	{
//		super();
//		
//		if(hasPhoto){
//			this.____doAddPhoto();
//		}
//	}
	
	public static const STARY_Y:int = 120;
	
	
	override public function onEnter():void {
		var img:ImageAA;
		
		img = new ImageAA;
		img.textureId = "bg/bg_A.png";
		this.getFusion().addNode(img);
		
		img = new ImageAA;
		img.textureId = "connected/color.png";
		this.getFusion().addNode(img);
		img.y = STARY_Y;
		
		img = new ImageAA;
		img.textureId = "connected/text_A.png";
		this.getFusion().addNode(img);
		img.x = (this.getWindow().windowWidth - img.getSourceWidth())/2;
		img.y = STARY_Y + 18;
		
		img = new ImageAA;
		img.textureId = "connected/img_A.png";
		this.getFusion().addNode(img);
		img.pivotX = img.getSourceWidth() / 2;
		img.pivotY = img.getSourceHeight() / 2;
		img.x = ViewConfig.SETTING_X;
		img.y = ViewConfig.SETTING_Y;
		img.eventClick().addListener(onSettingA);
		
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
//			AAFacade.getInstance().getRoot().switchTo(new QRcode_StateAA);
//		}
//		return true;
//	}
	
	
	
	private var m_photo:ImageAA;
	
	
	
	private function onSettingA(e:AEvent):void{
		AAFacade.getInstance().getRoot().switchTo(new SettingA_StateAA);
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
		AAFacade.getInstance().getRoot().switchTo(new Album_StateAA(true));
	}
}
}