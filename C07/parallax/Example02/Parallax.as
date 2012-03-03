package  {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class Parallax extends Sprite {
		
		private var tank:Tank;
		private var floor:Floor;
		private var floor1:FloorB;
		
		private var bg1:Bg1;//cerros 
		private var bg2:Bg1;
		
		private var bg3:Bg2;//cerros fondo
		private var bg4:Bg2;//cerros fondo
		
		private var W_FLOOR=600;
		private var W_BG1=650;
		
		private var containerFloor:Sprite;
		private var containerBg1:Sprite;
		private var containerBg2:Sprite;
		
		public function Parallax() {
			// constructor code
			
			trace("Parallax");
			//crear objetos ----
			containerFloor=new Sprite();
			containerBg1=new Sprite();
			containerBg2=new Sprite();
			
			tank=new Tank();
			floor=new Floor();
			floor1=new FloorB();
			bg1=new Bg1();
			bg2=new Bg1();
			
			bg3=new Bg2();
			bg4=new Bg2();
			
			tank.x=stage.stageWidth/2;
			tank.y=stage.stageHeight/2;
			
			floor.x=0;
			floor.y=stage.stageHeight/2+30;
			
			floor1.x=floor.x+600;
			floor1.y=floor.y;
			
			bg1.x=0;
			bg1.y=60;
			
			bg2.x=bg1.x+W_BG1;
			bg2.y=bg1.y;
			
			bg3.x=0;
			bg3.y=40;
			
			bg4.x=bg3.x+W_BG1;
			bg4.y=bg3.y;
			
			
			containerBg2.addChild(bg3);
			containerBg2.addChild(bg4);
			
			containerBg1.addChild(bg1);
			containerBg1.addChild(bg2);
			
			containerFloor.addChild(floor);
			containerFloor.addChild(floor1);
			containerFloor.addChild(tank);
			
			this.addChild(containerBg2);
			this.addChild(containerBg1);
			this.addChild(containerFloor);
			
			addEventListener(Event.ENTER_FRAME,ENTER_FRAME_handler);
		}
		
		function ENTER_FRAME_handler(e:Event):void
		{
			tank.x+=5;
			containerFloor.x-=5;
			containerBg1.x-=5*0.2;
			containerBg2.x-=5*0.05;
			//bg1.x-=5*0.2;
			//bg2.x-=5*0.2;
			
			//trace floor.x+ containerFloor.x
			if(floor.x+W_FLOOR+containerFloor.x<0)
			{
				trace("aqui floor")
				//floor.x=floor1.x+W_FLOOR;
				floor.x+=2*W_FLOOR;
			}
			if(floor1.x+W_FLOOR+containerFloor.x<0)
			{
				trace("aqui floor 1")
				//floor1.x=floor.x+W_FLOOR;
				floor1.x+=2*W_FLOOR;
			}
			if(bg1.x+W_BG1+containerBg1.x<0)
			{
				bg1.x+=2*W_BG1;
			}
			if(bg2.x+W_BG1+containerBg1.x<0)
			{
				bg2.x+=2*W_BG1;
			}
			
			if(bg3.x+W_BG1+containerBg2.x<0)
			{
				bg3.x+=2*W_BG1;
			}
			if(bg4.x+W_BG1+containerBg2.x<0)
			{
				bg4.x+=2*W_BG1;
			}
			//floor.x-=4;
			//floor1.x-=4;
		}
	}
	
}
