package  {
	
	import flash.display.MovieClip;
	
	
	public class Cell extends MovieClip {
		
		private var slotNumber:int;
		
		// FreeElectronsNumber does not appear to be used for anything,
		// as the program runs correctly with no noticable difference when all instances
		// of freeElectronsNumber is commented out.
//		private var freeElectronsNumber:int = 0;
		public function Cell() {
			slotNumber = 256;
		}
		
		public function setSlotNumber(num:int):void
		{
			this.slotNumber = num;
		}
		public function getSlotNumber():int
		{
			return slotNumber;
		}
		/*
		public function setFreeElectronNumber(num:int):void
		{
			this.freeElectronsNumber = num;
		}
		public function getFreeElectronNumber():int
		{
			return freeElectronsNumber;
		}
		*/
	}
	
}
