length = 180;
width = 180;
height = 110;
inside_wall_thickness = 5;
outer_wall_thickness = 10;
base_thickness = 10;

difference()
  {
		translate([outer_wall_thickness-inside_wall_thickness, outer_wall_thickness-inside_wall_thickness, 0])
			{
				minkowski()
					{
						cube(size = [length-outer_wall_thickness*2+inside_wall_thickness*2, width-outer_wall_thickness*2+inside_wall_thickness*2, height-1], center = false);
						cylinder(r=outer_wall_thickness-inside_wall_thickness,h=1);
					}
			}
for(i = [ [outer_wall_thickness, outer_wall_thickness, base_thickness],
			 [outer_wall_thickness,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), base_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*1,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), base_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*2,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), base_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*3,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), base_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*4,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), base_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*1,outer_wall_thickness, base_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*2,outer_wall_thickness, base_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*3,outer_wall_thickness, base_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*4,outer_wall_thickness, base_thickness], ])
{
	translate(i)
	cube([(length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5,(width-(outer_wall_thickness*2)-(inside_wall_thickness))/2,height-base_thickness+1], center = false);
}
}
