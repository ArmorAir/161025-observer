package AA.observe
{
	import Lv_2.display.StateAA;
	
	import Lv_3.animate.ATween;
	import Lv_3.animate.TweenMachine;
	import Lv_3.animate.easing.Cubic;
	import Lv_3.animate.easing.Quad;
	import Lv_3.display.advanced.Scale9ImageAA;
	import Lv_3.media.SfxMachine;

	public class Flicker_StateAA extends StateAA
	{
		public function Flicker_StateAA(  )
		{
//			m_callback = callback;
		}
		
		override public function onEnter():void {
			var s9Img:Scale9ImageAA;
			var tween:ATween;
			
			s9Img = new Scale9ImageAA;
			s9Img.textureId = "photo/s9w.png";
			this.getFusion().addNode(s9Img);
			s9Img.width = this.getWindow().windowWidth;
			s9Img.height = this.getWindow().windowHeight;
			s9Img.alpha = 0.95;
			tween = TweenMachine.to(s9Img, 0.45, {alpha:0.0});
			tween.easing = Quad.easeIn;
			tween.onComplete = function() : void {
				getFusion().kill();
//				m_callback();
			}
				
				
			SfxMachine.getInstance().loadAndPlay("audio/4072.mp3");
		}
		
//		private var m_callback:Function;
	}
}