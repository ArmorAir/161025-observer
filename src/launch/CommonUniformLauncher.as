package launch {
	import flash.ui.Keyboard;
	
	import AA.Entry_StateAA;
	import AA.Res_StateAA;
	
	import Lv_0.events.AEvent;
	
	import Lv_1.Axime;
	import Lv_1.cross.IUniformLauncher;
	import Lv_1.cross.LaunchConfiguration;
	import Lv_1.resource.AssetMachine;
	
	import Lv_2.display.AAFacade;
	import Lv_2.resource.converters.AtfAssetConvert;
	import Lv_2.resource.converters.AtlasAssetConvert;
	import Lv_2.utils.Stats;
	
	import Lv_3.resource.converters.SwfClassAssetConverter;
	
public class CommonUniformLauncher implements IUniformLauncher {
	
	public function config() : LaunchConfiguration {
		return LaunchConfiguration.create(1080, 1920, false);
	}
	
	public function onLaunch() : void {
//		Axime.getInstance().getWindow().getStage().addChild(new Stats());
		
		Axime.getInstance().getTick().registerTickGroups(new <String>["tickA"]);
		Axime.getInstance().getTick().getTickGroup("tickA").timeScale = 1.5;
		
		Axime.getInstance().getKeyboard().getKey(Keyboard.BACK).setPreventDefault(true);
		//Axime.getTouch().autoUnbindingWhenLeaving = true;
		
		AssetMachine.activate(SwfClassAssetConverter);
		AssetMachine.activate(AtlasAssetConvert);
		AssetMachine.activate(AtfAssetConvert);
		
		//AAFacade.requestRoot(true);
		(new AAFacade(new Res_StateAA(new Entry_StateAA))).eventContextReset().addListener(____onContextReset);
	}
	
	
	
	private function ____onContextReset(evt:AEvent):void{
		var am:AssetMachine;
		var RLid:uint;
		
		am = Axime.getInstance().getAsset();
		RLid = am.eventComplete().addListener(function(e:AEvent):void{
			am.eventComplete().removeListener(RLid);
			AAFacade.getInstance().getRoot().getNode().visible = true;
			Axime.getInstance().getTick().timeScale = 1.0;
		});
		am.restartAll();
		AAFacade.getInstance().getRoot().getNode().visible = false;
		Axime.getInstance().getTick().timeScale = 0.0;
	}
}
}