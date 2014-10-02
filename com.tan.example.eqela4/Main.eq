
/*
 * Main.eq
 * Generated by Eqela Studio 2.0b7.4
 */

public class Main : SEScene
{

	SESprite bg;
	SESprite fg;
	SESprite fg2;
	SESprite text;
	bool move_right=true;
	bool move_left  =false;
	bool move_up = true;
	bool move_down = false;
	int speed = 100;
	double rotation = 0; 
	String display;
	int bounce = 0;
		
	public void initialize(SEResourceCache rsc) 
	{
		base.initialize(rsc);
		/*
		bg = add_sprite_for_color(Color.instance("blue"),get_scene_width(),get_scene_height());
		bg.move(0,0);
		fg = add_sprite_for_color(Color.instance("white"),get_scene_width()*0.1,get_scene_height()*0.1);
		fg.move(100,100);
		*/
		rsc.prepare_image("myimage1","colorful",get_scene_width(),get_scene_height()); // myimage1 = colorful
		fg = add_sprite_for_image(SEImage.for_resource("myimage1"));
		fg.move(0,0);
		rsc.prepare_image("myimage","candy",get_scene_width()*0.1); // myimage = candy
		fg = add_sprite_for_image(SEImage.for_resource("myimage"));
		fg.move(100,100);
		rsc.prepare_font("myfont","Arial bold color=white",40);
		display = "BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
		text = add_sprite_for_text(display,"myfont");
		text.move(0,get_scene_height()-text.get_height());
	}

	public void update(TimeVal now, double delta)
	{
		base.update(now,delta);
		speed+=100;
		rotation+=MathConstant.M_PI_4/9.5;
		fg.set_rotation(rotation);
		if(move_right)
		{
			fg.move(fg.get_x()+delta*speed,fg.get_y()); 		//updates fg's x  to move right
			if(fg.get_x()+fg.get_width() > get_scene_width())
			{
				speed=50;
				++bounce;
				display = "BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(display);
				move_right=false;
				move_left=true;
			}	
		}
		if(move_up)
		{
			fg.move(fg.get_x(),fg.get_y()-delta*speed); 		//updates fg's y to move up
			if(fg.get_y()<0)
			{
				speed=50;
				++bounce;
				display = "BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(display);
				move_up=false;
				move_down=true;
			}	
		}
		if(move_down)
		{
			fg.move(fg.get_x(),fg.get_y()+delta*speed); 		//updates fg's y to move down
			if(fg.get_y()+fg.get_height() > get_scene_height())
			{
				speed=50;
				++bounce;
				display = "BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(display);
				move_up=true;
				move_down=false;
			}	
		}
		if(move_left)
		{
			fg.move(fg.get_x()-delta*speed,fg.get_y()); 		//updates fg's x  to move left
			if(fg.get_x()<0)
			{
				speed=50;
				++bounce;
				display = "BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(display);
				move_right=true;
				move_left=false;
			}	
		}
	}
	
	public void set_rotation(double angle)
	{
		rotation = angle;	
	}

	public double get_rotation()
	{
		return(rotation);
	}

	public void cleanup()
	{
		base.cleanup();
		SESprite.remove(bg);
		SESprite.remove(fg);
		SESprite.remove(text);	
	}
}






/*
		bg //background
		add_sprite_for_color 	  //adds the elements of color
		(Color.instance("red"), 	//color to use
		get_scene_width(),	  	//gets the screen width of bg
		get_scene_height())		//gets the screen height of bg
		bg.move(0,0);		 	 // moves the object x,y by pixel
		get_scene_width()*0.1	//gets the screen width of fg multiple by 10%
		get_scene_height()*0.1	//gets the screen height of fg multiple by 10%
		
*/