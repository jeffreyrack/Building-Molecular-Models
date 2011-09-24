package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFormat;


	
	public class SodiumChloride extends MovieClip implements IQuestion {
		
		function SodiumChloride(x:int, y:int){
			this.x=x;
			this.y=y;
		}
		//public function SodiumChloride() {
		//}
		private var hitSlot:Slot;
				
		public function isLegalDrop(dropObj:MovieClip):Boolean
		{
			var isLegal:Boolean = false;
			var fmt:TextFormat = new TextFormat();

			// Na CL 
			if(slot_Na.hitTestObject(dropObj))
			{
				if(!slot_Na.isAvailable())
					return false;
				else if((dropObj.symbol.text == "Na"))
				{
					hitSlot = slot_Na;
					slot_Na.setElectronVisible(false,false,true,false,false,false,false,false);
					slot_Na.setElectronColor(0xFF0000);
					slot_Na.setContent(dropObj);
					fmt.color = 0xFF0000; // red
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			
			else if(slot_Cl.hitTestObject(dropObj))
			{
				if(!slot_Cl.isAvailable())
					return false;
				else if((dropObj.symbol.text == "Cl"))
				{
					hitSlot = slot_Cl;
					slot_Cl.setElectronVisible(true,true,true,true,true,true,false,true);
					slot_Cl.setElectronColor(0x223077);
					slot_Cl.setContent(dropObj);
					fmt.color = 0x223077;
 					dropObj.symbol.setTextFormat(fmt);
					isFinish();
					return true;
				}
			}
			
			
			return false;
		
		}
		public function getHitSlot():Slot
		{
			return hitSlot;
		}
		
		public function clearAnswer():void
		{
			
			if(slot_Cl.getContent()!=null)slot_Cl.getContent().parent.removeChild(slot_Cl.getContent());
			if(slot_Na.getContent()!=null)slot_Na.getContent().parent.removeChild(slot_Na.getContent());
		}
		
		private function isFinish()
		{
			if(!slot_Na.isAvailable()&&!slot_Cl.isAvailable())
			{
				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));
			}
		}
	}
	
}

