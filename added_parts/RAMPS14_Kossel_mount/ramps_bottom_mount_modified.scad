// Kossel Mini mount for RAMPS 1.4 at bottom location
// Licence: CC BY-SA 3.0, http://creativecommons.org/licenses/by-sa/3.0/
// Author: Dominik Scholz <schlotzz@schlotzz.com> and contributors
// visit: http://www.schlotzz.com


// Increase this if your slicer or printer make holes too tight.
extra_radius = 0.2;


// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major / 2 + extra_radius;
m3_wide_radius = m3_major / 2 + extra_radius + 0.2;




module ramps_mount()
{

	// define base plate
	base_plate = [102, 54, 3];
	base_plate_delta = [20, 20, 0];
	base_plate_offset = [10, 0, 0];

	// define mounting hole offsets
	base_hole_offsets = [
		[14, 2.5, 0],
		[96.7, 2.5, 0],
		[66.1, 7.6, 0],
		[66.1, 35.5, 0],
		[15.3, 50.7, 0],
		[90.2, 50.7, 0]
	];

	// define mounting plate
	mounting_plate = [3, base_plate[1] + base_plate_delta[1], 25];
	mounting_plate_offset = [base_plate[0] + base_plate_delta[0] - mounting_plate[0], 0, 0];

	// define mounting hole offsets
	mounting_hole_offsets = [
		[1.5, 0, 7.5],
		[1.5, base_plate[1] - 2, 7.5],
		[1.5, 0, 19.5],
		[1.5, base_plate[1] - 2, 19.5],
	];

	// define joint enforcement
	joint_enforcement_radius = 30;
	joint_enforcement_thickness = 3;
	joint_enforcement_offsets = [
		[base_plate[0] + base_plate_delta[0] - 4, -base_plate_delta[0] / 2, -8],
		[base_plate[0] + base_plate_delta[0] + 29, base_plate[1] - 8 + base_plate_delta[0] / 2 - joint_enforcement_thickness, -10],
	];

	// define domes
	dome_height = 3;
	dome_base_width = 6;
	dome_top_width = 4.2;

	// stepper cutout
	stepper_cutout_depth = 15;
	stepper_cutout_offset = [
		base_plate[0] + base_plate_delta[0] - joint_enforcement_radius - tan(30) * stepper_cutout_depth,
		base_plate[1] + base_plate_delta[1] / 2 - stepper_cutout_depth,
		0
	];

	difference()
	{
		
		union()
		{
			// base plate
			translate(base_plate_offset - base_plate_delta / 2)
				cube(base_plate + base_plate_delta+[32,-8,0], center = false);

			// mounting plate
			translate(base_plate_offset - base_plate_delta / 2 + mounting_plate_offset+[-14.1,0,0])
            rotate([0, 0, -27]) {
                difference() {
                  cube(mounting_plate+[0,10,0]);
                  union() {
                    for (a = mounting_hole_offsets)
			          translate(a+[0,10,0])
				        rotate([0, 90, 0])
					      cylinder(r = m3_radius, h = 3, center = true, $fn = 16);
                    };
                    translate([1.5 - m3_radius, 0 - m3_radius, 7.5]+[0,10,0]) cube([5, m3_radius*2, 12]);
                    translate([1.5 - m3_radius, (base_plate[1] - 2) - m3_radius, 7.5]+[0,10,0]) cube([5, m3_radius*2, 12]);
                };
            };

			// domes
			for (a = base_hole_offsets)
				translate(a + [0, 0, base_plate[2]])
					cylinder(r1 = dome_base_width / 2, r2 = dome_top_width / 2, h = dome_height, $fn = 16);
			
			// joint enforcement
			for (a = joint_enforcement_offsets)
				translate(a)
					rotate([90, 0, 180])
						intersection()
						{
							cube([joint_enforcement_radius, joint_enforcement_radius, joint_enforcement_thickness]);
							cylinder(r = joint_enforcement_radius, h = joint_enforcement_thickness, $fn = 32);
						}
		}

		// base holes
		for (a = base_hole_offsets)
			translate(a)
				cylinder(r = m3_radius, h = 50, center = true, $fn = 16);

		// mounting holes
		//for (a = mounting_hole_offsets)
		//	translate(a + mounting_plate_offset)
		//		rotate([0, 90, 0])
		//			cylinder(r = m3_radius, h = 3, center = true, $fn = 16);
        
		// cutout for stepper motor
		//translate(stepper_cutout_offset - [0, 0, 1])
		//	rotate([0, 0, 60])
		//		cube([stepper_cutout_depth * 2, stepper_cutout_depth * 2, base_plate[2] + 2]);
        
		translate([108.3, -10, 0])
			rotate([0, 0, -27])
				cube([50, 90, base_plate[2] + 50]);
        
		translate([100, 9, 7])
			rotate([0, 0, -27])
				cube([35, 8, 13]);
                
		translate([100, 22, 7])
			rotate([0, 0, -27])
				cube([35, 8, 13]);
                
		translate([100, 35, 7])
			rotate([0, 0, -27])
				cube([35, 8, 13]);
                
		translate([100, 48, 7])
			rotate([0, 0, -27])
				cube([35, 8, 13]);
        
        translate([0, -50, -50])
		  cube([200, 120, 50]);
        
        translate([0, -20, 0])
		  cube([200, 10, 50]);
          
        translate([0, 56, 0])
		  cube([200, 10, 50]);
        
        translate([10, 12, 0])
          cube([32, 34, 50]);
        
        translate([23, 0, 0])
          cube([36, 46, 50]);
          
        translate([73, 0, 0])
          cube([15, 46, 50]);
          
        translate([83, 12, 0])
          cube([32, 34, 50]);
	}
	

}

ramps_mount();
