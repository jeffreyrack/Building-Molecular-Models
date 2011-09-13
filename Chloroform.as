﻿package  {		import flash.display.MovieClip;	import flash.events.Event;		public class Chloroform extends MovieClip implements IQuestion {						private var hitSlot:Slot;				public function Chloroform() {		}				public function isLegalDrop(dropObj:MovieClip):Boolean		{			var isLegal:Boolean = false;			// C H Cl1 Cl2 Cl3			if(slot_C.hitTestObject(dropObj))			{				if(!slot_C.isAvailable())					return false;				else if((dropObj.symbol.text == "C"))				{					hitSlot = slot_C;					slot_C.setElectronVisible(true,false,true,false,false,true,false,true);					slot_C.setElectronColor(0xFF0000);					slot_C.setContent(dropObj);					isFinish();					return true;				}			}			else if(slot_Cl1.hitTestObject(dropObj))			{				if(!slot_Cl1.isAvailable())					return false;				else if((dropObj.symbol.text == "Cl"))				{					hitSlot = slot_Cl1;					slot_Cl1.setElectronVisible(true,true,true,true,false,true,true,true);					slot_Cl1.setElectronColor(0x770077);					slot_Cl1.setContent(dropObj);					isFinish();					return true;				}			}			else if(slot_Cl2.hitTestObject(dropObj))			{				if(!slot_Cl2.isAvailable())					return false;				else if((dropObj.symbol.text == "Cl"))				{					slot_Cl2.setElectronVisible(true,true,true,false,true,true,true,true);					slot_Cl2.setElectronColor(0x770077);					hitSlot = slot_Cl2;					slot_Cl2.setContent(dropObj);					isFinish();					return true;				}			}			else if(slot_Cl3.hitTestObject(dropObj))			{				if(!slot_Cl3.isAvailable())					return false;				else if((dropObj.symbol.text == "Cl"))				{					hitSlot = slot_Cl3;					slot_Cl3.setElectronVisible(true,false,true,true,true,true,true,true);					slot_Cl3.setElectronColor(0x770077);					slot_Cl3.setContent(dropObj);					isFinish();					return true;				}			}			else if(slot_H.hitTestObject(dropObj))			{				if(!slot_H.isAvailable())					return false;				else if((dropObj.symbol.text == "H"))				{					hitSlot = slot_H;					slot_H.setElectronVisible(false,false,false,false,false,false,false,true);					slot_H.setElectronColor(0x223077);					slot_H.setContent(dropObj);					isFinish();					return true;				}			}									return false;								}		public function getHitSlot():Slot		{			return hitSlot;		}				public function clearAnswer():void		{			if(slot_Cl1.getContent()!=null)slot_Cl1.getContent().parent.removeChild(slot_Cl1.getContent());			if(slot_Cl2.getContent()!=null)slot_Cl2.getContent().parent.removeChild(slot_Cl2.getContent());			if(slot_Cl3.getContent()!=null)slot_Cl3.getContent().parent.removeChild(slot_Cl3.getContent());			if(slot_H.getContent()!=null)slot_H.getContent().parent.removeChild(slot_H.getContent());			if(slot_C.getContent()!=null)slot_C.getContent().parent.removeChild(slot_C.getContent());		}				private function isFinish()		{			if(!slot_Cl1.isAvailable()&&!slot_Cl2.isAvailable()&&!slot_Cl3.isAvailable()&&!slot_C.isAvailable()&&!slot_H.isAvailable())			{				dispatchEvent(new Event("CORRECT_ANSWER_RECEIVED",true,false));			}		}	}	}