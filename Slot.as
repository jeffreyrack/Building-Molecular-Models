package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	
	public class Slot extends MovieClip {
				
		private var slotContent:MovieClip = null;
		var elementContained:String=null;
		var visibleElectrons:Array=null;
		
		public function Slot(x:int=0, y:int=0, elementName:String="NULL", Color:int=0, Electrons:Array=null, isDefaultConstructor:Boolean=true){
			clearElectronDisplay();
			if(isDefaultConstructor) return;
			this.x=x;
			this.y=y;
			this.elementContained=elementName;
			this.setElectronColor(Color);
			this.visibleElectrons=Electrons;
			this.visible=true;
		}
		
		private function clearElectronDisplay():void
		{
			electron_N_1_mc.alpha = 0;
			electron_N_2_mc.alpha = 0;
			
			electron_E_1_mc.alpha = 0;
			electron_E_2_mc.alpha = 0;

			electron_S_1_mc.alpha = 0;
			electron_S_2_mc.alpha = 0;

			electron_W_1_mc.alpha = 0;
			electron_W_2_mc.alpha = 0;
		}
		public function setElectronVisible(N1:Boolean,N2:Boolean,E1:Boolean,E2:Boolean,S1:Boolean,S2:Boolean,W1:Boolean,W2:Boolean):void
		{

			electron_N_1_mc.alpha = (N1)? 1 : 0;
			electron_N_2_mc.alpha = (N2)? 1 : 0;
			
			electron_E_1_mc.alpha = (E1)? 1 : 0;
			electron_E_2_mc.alpha = (E2)? 1 : 0;
			
			electron_S_1_mc.alpha = (S1)? 1 : 0;
			electron_S_2_mc.alpha = (S2)? 1 : 0;
			
			electron_W_1_mc.alpha = (W1)? 1 : 0;
			electron_W_2_mc.alpha = (W2)? 1 : 0;
		}
		public function makeElectronsVisible():void{
			electron_N_1_mc.alpha = (visibleElectrons[0]);
			electron_N_2_mc.alpha = (visibleElectrons[1]);
			
			electron_E_1_mc.alpha = (visibleElectrons[2]);
			electron_E_2_mc.alpha = (visibleElectrons[3]);
			
			electron_S_1_mc.alpha = (visibleElectrons[4]);
			electron_S_2_mc.alpha = (visibleElectrons[5]);
			
			electron_W_1_mc.alpha = (visibleElectrons[6]);
			electron_W_2_mc.alpha = (visibleElectrons[7]);
		}
		
		public function setElectronColor(rgbCode:uint):void
		{
			var myColor:ColorTransform;
			
			myColor = electron_N_1_mc.transform.colorTransform;
			myColor.color = rgbCode;
			electron_N_1_mc.transform.colorTransform = myColor;
			myColor = electron_N_2_mc.transform.colorTransform;
			myColor.color = rgbCode;
			electron_N_2_mc.transform.colorTransform = myColor;
			
			myColor = electron_E_1_mc.transform.colorTransform;
			myColor.color = rgbCode;
			electron_E_1_mc.transform.colorTransform = myColor;
			myColor = electron_E_2_mc.transform.colorTransform;
			myColor.color = rgbCode;
			electron_E_2_mc.transform.colorTransform = myColor;
			
			myColor = electron_S_1_mc.transform.colorTransform;
			myColor.color = rgbCode;
			electron_S_1_mc.transform.colorTransform = myColor;
			myColor = electron_S_2_mc.transform.colorTransform;
			myColor.color = rgbCode;
			electron_S_2_mc.transform.colorTransform = myColor;
			
			myColor = electron_W_1_mc.transform.colorTransform;
			myColor.color = rgbCode;
			electron_W_1_mc.transform.colorTransform = myColor;
			myColor = electron_W_2_mc.transform.colorTransform;
			myColor.color = rgbCode;
			electron_W_2_mc.transform.colorTransform = myColor;
		}
		
		public function isAvailable():Boolean
		{
			return (slotContent==null);
		}
		
		public function setContent(item:MovieClip)
		{
			slotContent = item;
		}
		
		public function getContent():MovieClip
		{
			return slotContent;
		}

		public function clearItem()
		{
			slotContent = null;
			clearElectronDisplay();
		}
	}
	
}
