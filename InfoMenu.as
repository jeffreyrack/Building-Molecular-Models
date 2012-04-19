package 
{
	import flash.text.TextField;
	import flash.text.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.text.StyleSheet;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.Bitmap;



	public class InfoMenu extends Sprite
	{
		private var ldr:Loader = new Loader();
		var Title:TextField=new TextField();
		public function InfoMenu(symb:String)
		{
			this.graphics.lineStyle(1, 0x000000);
			this.graphics.moveTo(120, 50);
			this.graphics.lineTo(120, 750);
			this.graphics.lineTo(750, 750);
			this.graphics.lineTo(750, 50);
			this.graphics.lineTo(120, 50);
			this.graphics.beginFill(Color.BLUE, .95);
			this.graphics.drawRect(120, 50, 750, 750);
			addChild(Title);
			Title.visible = true;
			changeTitleProperties(Title,this.x+this.width/2-Title.width/2, y+75,"Hydrogen");
			var info:TextField=new TextField();
			info.multiline = true;
			info.wordWrap = true;
			info.width = 625;
			var infoString:String = "Hydrogen is the first element on the periodic table, having only 1 electron, and 1 proton.  Hydrogen is commonly known for it's uses in Water, H2O, and hydrogen peroxide, H2O2.";
			changeTitleProperties(info, 245, Title.y+100, infoString);
			info.visible = true;
			addChild(info);
			loadImage();
		}


		public function loadImage()
		{
			ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, ldr_complete);
			ldr.load(new URLRequest("/images/elements/hydrogen_1.png"));
		}

		function ldr_complete(evt:Event):void
		{
			var bmp:Bitmap = ldr.content as Bitmap;
			bmp.x = 125;
			bmp.y = 225;
			bmp.visible = true;
			trace("visible");
			addChild(bmp);
			bmp.scaleX = .35;
			bmp.scaleY = .35;
		}


		private function changeTitleProperties(Title:TextField, newx:Number, newy:Number,newname:String, color:uint=Color.RED, size:Number=35)
		{
			var format:TextFormat = new TextFormat();
			format.font = "Arial";
			format.color = color;
			format.size = size;
			Title.text = newname;
			Title.setTextFormat(format);
			Title.width = Title.textWidth;
			Title.height = Title.textHeight;
			// Set Title.x to be the center of this, minus half of Titles width.
			Title.x = newx;
			Title.y = newy;
		}

	}

}