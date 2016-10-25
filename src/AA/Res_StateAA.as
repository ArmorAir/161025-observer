package AA {
	import Lv_0.events.AEvent;
	
	import Lv_1.Axime;
	import Lv_1.resource.AssetMachine;
	import Lv_1.resource.FilesBundle;
	
	import Lv_2.display.StateAA;
	import Lv_2.resource.handlers.TextureAA_BundleHandler;
	
public class Res_StateAA extends StateAA {
	
	
	public function Res_StateAA( nextState:StateAA ) :void{
		m_nextState = nextState;
		
	}
	
	override public function onEnter() : void {
		var AY:Vector.<String>;
		
		am = Axime.getInstance().getAsset();
		
		AY = new <String>["bg/bg_A.png", "bg/mask.png"];
		am.addBundle(new FilesBundle(AY),   new TextureAA_BundleHandler(1.0, false));
		
		AY = new <String>["entry/A.png", "entry/B.png", "entry/circle.png", "entry/img.png", "entry/text_A.png", "entry/text_B.png"];
		am.addBundle(new FilesBundle(AY),   new TextureAA_BundleHandler(1.0, false));
		
		AY = new <String>["QRcode/btn.png", "QRcode/img.png", "QRcode/img_B.png", "QRcode/text_A.png"];
		am.addBundle(new FilesBundle(AY),   new TextureAA_BundleHandler(1.0, false));
		
		AY = new <String>["scan/bg.png", "scan/btn.png", "scan/img_A.png", "scan/line.png", "scan/mask.png", "scan/text.png"];
		am.addBundle(new FilesBundle(AY),   new TextureAA_BundleHandler(1.0, false));
		
		AY = new <String>
			[	"connected/color.png", 
				"connected/img_A.png", 
				"connected/text_A.png",
				"connected/photo.png", 
				"connected/shot.png"];
		am.addBundle(new FilesBundle(AY),   new TextureAA_BundleHandler(1.0, false));
		
		AY = new <String>
			[	"setting/blurBg.png",
				"setting/btn_1.png", 
				"setting/btn_2.png",
				"setting/btn_3.png",
				"setting/img_1.png", 
				"setting/img_2.png",
				"setting/img_3.png",
				"setting/mask.png", 
				"setting/text_A.png",
				"setting/text_B.png"
			];
		am.addBundle(new FilesBundle(AY),   new TextureAA_BundleHandler(1.0, false));
		
		AY = new <String>
			[	"photo/photo_A.png", 
				"photo/s9w.png",
				"photo/s9b.png"
			];
		am.addBundle(new FilesBundle(AY),   new TextureAA_BundleHandler(1.0, false));
		
		_RLid = am.eventComplete().addListener(onComplete);
	}
	
	
	private var am:AssetMachine;
	private var m_nextState:StateAA;
	private var _RLid:uint;
	
	
	private function onComplete(e:AEvent):void {
		am.eventComplete().removeListener(_RLid);
		
		this.getMorph().switchTo(m_nextState);
	}
}
}