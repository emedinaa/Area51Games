package  {
	
	import flash.display.Sprite;
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	import flash.events.Event;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	//import Box2D
	
	
	public class HolaMundo extends Sprite 
	{
		//importar librería
		//world
		//gravedad
		//límites
		//elementos
		//debug 
		private var worldAABB:b2AABB;
		private var gravity:b2Vec2;
		private var doSleep:Boolean;
		private var world:b2World;
		
		public var m_iterations:int = 10;
		public var m_timeStep:Number = 1.0/30.0;
		
		private var _tm:Timer;
		
		public function HolaMundo() 
		{
			// constructor code
			//definir los parámetros del mundo
			worldAABB=new b2AABB();
			worldAABB.lowerBound.Set(-100,-100);
			worldAABB.upperBound.Set(100,100);
			
			//gravedad
			gravity=new b2Vec2(0,10);//gravedad vertical
			world=new b2World(worldAABB,gravity,doSleep);
			
			//debuger 
			var dbgDraw:b2DebugDraw = new b2DebugDraw();
			var dbgSprite:Sprite = new Sprite();//contenedor
			addChild(dbgSprite);
			dbgDraw.m_sprite = dbgSprite;
			dbgDraw.m_drawScale = 30.0;
			dbgDraw.m_fillAlpha = 0.0;
			dbgDraw.m_lineThickness = 1.0;
			dbgDraw.m_drawFlags = 0xFFFFFFFF;
			
			world.SetDebugDraw(dbgDraw);
		
		
		//crear piso ---------------------------
			var final_body:b2Body;
			
			var the_body:b2BodyDef;
			var the_box:b2PolygonDef;
			
			the_body = new b2BodyDef();
			the_body.position.Set(8.5, 13);
			
			the_box = new b2PolygonDef();
			the_box.SetAsBox(10, 0.8);
			the_box.friction=0.3;
			the_box.density=0;
			
			final_body=world.CreateBody(the_body);
			final_body.CreateShape(the_box);
			final_body.SetMassFromShapes();
			
			//elementos ----
			//createBox(9,0,1.5,0.9);
			//createBox(8.5,0,1.5,0.9);
			_tm=new Timer(500,0);
			_tm.addEventListener(TimerEvent.TIMER,TIMER_handler);
			_tm.start();
	
			
			
			addEventListener(Event.ENTER_FRAME,ENTER_FRAME_handler);
		}
		function createBox(_x:Number,_y:Number,_w:Number,_h:Number):void
		{
			var final_body1:b2Body;
			
			var the_body1:b2BodyDef;
			var the_box1:b2PolygonDef;
			
			the_body1 = new b2BodyDef();
			the_body1.position.Set(_x, _y);//9,0
			
			the_box1 = new b2PolygonDef();
			the_box1.SetAsBox(_w, _h);//1.5,0.9
			the_box1.friction=0.3;
			the_box1.density=1;
			the_box1.restitution=0.5;
			
			final_body1=world.CreateBody(the_body1);
			final_body1.CreateShape(the_box1);
			final_body1.SetMassFromShapes();
		}
		function TIMER_handler(e:TimerEvent):void
		{
			createBox(9,0,0.6,0.4);
		}
		function ENTER_FRAME_handler(e:Event):void
		{
			//world.update();
			world.Step(m_timeStep,m_iterations);
		}
	}

	
}
