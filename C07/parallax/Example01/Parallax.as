package  {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class Parallax extends Sprite {
		
		private var tank:Tank;
		private var floor:Floor;
		private var floor1:FloorB;
		
		private var W_FLOOR=600;
		
		public function Parallax() {
			// constructor code
			
			trace("Parallax");
			
			//crear objetos ----
			tank=new Tank();
			floor=new Floor();
			floor1=new FloorB();
			
			tank.x=stage.stageWidth/2;
			tank.y=stage.stageHeight/2;
			
			floor.x=0;
			floor.y=stage.stageHeight/2+30;
			
			floor1.x=floor.x+600;
			floor1.y=floor.y;
			
			addChild(floor);
			addChild(floor1);
			addChild(tank);
			
			addEventListener(Event.ENTER_FRAME,ENTER_FRAME_handler);
		}
		
		function ENTER_FRAME_handler(e:Event):void
		{
			tank.x+=2;
			floor.x-=4;
			floor1.x-=4;
		}
	}
	
}
