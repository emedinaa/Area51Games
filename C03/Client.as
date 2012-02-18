package  {
import flash.events.KeyboardEvent;
import flash.events.Event;
import flash.display.Sprite 

	public class Client extends Sprite{
		
	const L:uint=37
	const U:uint=38
	const R:uint=39
	const D:uint=40
	const S:uint=32

	var LEFT:Boolean =false
	var UP:Boolean =false
	var DOWN:Boolean =false
	var RIGTH:Boolean =false
	var SPACE:Boolean=false
	
	var vx:int=10
	var vy:int=10

	public function Client()
	{
		// constructor code
		trace("client ");
		stage.addEventListener(KeyboardEvent.KEY_DOWN,KEY_DOWN_handler)
		stage.addEventListener(KeyboardEvent.KEY_UP ,KEY_UP_handler)
		this.addEventListener(Event.ENTER_FRAME,ENTER_FRAME_handler)
	}
		
	function KEY_UP_handler(e:KeyboardEvent):void
	{
		//trace("key ",e.keyCode)//código de la tecla utilizada
		switch(e.keyCode)
		{
			case L:
				LEFT =false
				break
			case U:
				break
			case R:
				RIGTH =false
				break
			case D:
				break
			case S:
				SPACE=false
				break
		}
	}
	function KEY_DOWN_handler(e:KeyboardEvent):void
	{
		//trace("key ",e.keyCode)//código de la tecla utilizada
		switch(e.keyCode)
		{
			case L:
				LEFT =true
				RIGTH =false
				break
			case U:
				mc.y-=vy
				break
			case R:
				LEFT =false
				RIGTH =true
				break
			case D:
				mc.y+=vy
				break
			case S:
				SPACE=true
				generateBall()
				break
		}
	}

	function ENTER_FRAME_handler(e:Event):void
	{
		if(LEFT ){mc.x-=vx}
		else if(RIGTH ){mc.x+=vx}
		mc['mcbar'].rotation=(180/Math.PI)*getAngle(mc.x,mc.y,this.mouseX ,this.mouseY)
		
	}

	function generateBall():void
	{
		var b:BallView=new BallView()
		this.addChild(b)
		b.x=mc.x
		b.y=mc.y
		
		b.move(10,0)
	}

	//elimina el objeto por nombre
	function dead(_name:String ):void
	{
		var obj:BallView =BallView(this.getChildByName(_name))
		if(obj!=null)
		{
			this.removeChild(obj)
		}
	}
	
	//utils 
	function getAngle(x1:int,y1:int,x2:int,y2:int):Number
	{
		var dx:int=x2-x1
		var dy:int=y2-y1
		//trace("dx ",dx," dy ",dy," ", (180/Math.PI)*Math.atan2(dy,dx))
		
		//return (180/Math.PI)*Math.atan2(dy,dx)
		return Math.atan2(dy,dx)
	}

	}
	
}
