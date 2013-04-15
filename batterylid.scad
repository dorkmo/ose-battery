length = 180;
width = 180;
height = 110;
inside_wall_thickness = 5;
outer_wall_thickness = 10;
base_thickness = 10;
lid_thickness = 5;
lid_insert_height = 5;
seperator_width = 4;
hole_diameter = 3;

union()
  {
		translate([outer_wall_thickness-inside_wall_thickness, outer_wall_thickness-inside_wall_thickness, 0])
			{
				minkowski()
					{
						cube(size = [length-outer_wall_thickness*2+inside_wall_thickness*2, width-outer_wall_thickness*2+inside_wall_thickness*2, lid_thickness-1], center = false);
						cylinder(r=outer_wall_thickness-inside_wall_thickness,h=1);
					}
			}
for(i = [ [outer_wall_thickness, outer_wall_thickness, lid_thickness],
			 [outer_wall_thickness,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), lid_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*1,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), lid_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*2,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), lid_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*3,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), lid_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*4,outer_wall_thickness+((((width-(outer_wall_thickness*2)-inside_wall_thickness)/2)+inside_wall_thickness)*1), lid_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*1,outer_wall_thickness, lid_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*2,outer_wall_thickness, lid_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*3,outer_wall_thickness, lid_thickness],
			 [outer_wall_thickness+(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)+inside_wall_thickness)*4,outer_wall_thickness, lid_thickness], ])
{
	translate(i)
		union()
			{
				cube([(length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5,(width-(outer_wall_thickness*2)-(inside_wall_thickness))/2,lid_insert_height], center = false);


				translate([(((length-(outer_wall_thickness*2)-(inside_wall_thickness*4))/5)/2)-seperator_width/2,2,lid_insert_height])

					union()
						{
							cube([seperator_width,5,height-base_thickness-5], center=false);
							translate([0,(((width-(outer_wall_thickness*2)-(inside_wall_thickness))/2)-4)-5,0])
								cube([seperator_width,5,height-base_thickness-5], center=false);
							translate([0,0,(height-base_thickness-5)-5])
								cube([seperator_width,((width-(outer_wall_thickness*2)-(inside_wall_thickness))/2)-4,5], center=false);

							difference()
								{
									cube([seperator_width,((width-(outer_wall_thickness*2)-(inside_wall_thickness))/2)-4,height-base_thickness-5]);
									for(s = [ 	
											[0, 0, -15],
          							 	[0, 0, -30],
           								[0, 0, -45],
           								[0, 0, -60],
           								[0, 0, -75],
           								[0, 0, -90],
											[0,0,0],
											[0, 0, 15],
          							 	[0, 0, 30],
           								[0, 0, 45],
           								[0, 0, 60],
           								[0, 0, 75],
           								[0, 0, 90], ])
										{
											translate(s)
											rotate(a=[50,0,0])
												{
													cube([20,1000,5], center=true);
												}		
										}			
									}
							}
					}
			}
		}
