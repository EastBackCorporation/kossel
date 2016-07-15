// Holder for raised, hexagonal heat bed on Kossel Mini
// Licence: CC BY-SA 3.0, http://creativecommons.org/licenses/by-sa/3.0/
// Author: Dominik Scholz <schlotzz@schlotzz.com> and contributors
// visit: http://www.schlotzz.com

// avoid OpenScad artefacts
epsilon = 0.1;

// increase this if your slicer or printer make holes too tight
extra_radius = 0.1;

// major diameter of metric 3mm thread
m3_major = 2.85;
m3_radius = m3_major / 2 + extra_radius;
m3_wide_radius = m3_major / 2 + extra_radius + 0.2;

// diameter of metric 3mm hexnut screw head
m3_head_radius = 3 + extra_radius;


// size settings
raise = 12;
pcb_thickness = 1.6;
pcb_offset = 8.25;
screw_offset = 15 / 2 - 1.5;
screw_padding = 7;
insert_width = 20;
insert_height = 2;


// base of heat bed holder
module heat_bed_holder_base(width = 40, depth = 15, height = raise + pcb_thickness)
{
    
    difference()
    {
        // base
        cube([width, depth, height]);
        
        // pcb cutout
        translate([-epsilon, pcb_offset, raise])
            cube([width + 2 * epsilon, depth, pcb_thickness + epsilon]);
        
        // insert
        translate([(width - insert_width) / 2, pcb_offset, raise - insert_height])
            cube([insert_width, depth, insert_height + epsilon]);
        
        // screw holes
        for (x  = [screw_padding, width - screw_padding])
            translate([x, screw_offset, -epsilon])
                cylinder(r = m3_wide_radius, h = height + 2 * epsilon, $fn = 32);
    }
    
}


// top of heat bed holder
module heat_bed_holder_top(width = 40, depth = 14.5, height = 3)
{
    difference()
    {
        // base
        cube([width, depth + 10, height]);
        
        // glas bed cutout
        translate([width / 2, 170 / 2 + depth, -epsilon])
            cylinder(r1 = 170 / 2 + 0.5, r2 = 170 / 2, h = height + 2 * epsilon, $fn = 128);
        
        // screw holes
        for (x  = [screw_padding, width - screw_padding])
        {
            translate([x, screw_offset, -epsilon])
            {
                hull()
                {
                    translate([0, -1.5, 0])
                        cylinder(r = m3_wide_radius, h = height + 2 * epsilon, $fn = 32);
                    translate([0, 2.5, 0])
                        cylinder(r = m3_wide_radius, h = height + 2 * epsilon, $fn = 32);
                }
                hull()
                {
                    translate([0, -1.5, height / 2])
                        cylinder(r = m3_head_radius, h = height + 2 * epsilon, $fn = 32);
                    translate([0, 2.5, height / 2])
                        cylinder(r = m3_head_radius, h = height + 2 * epsilon, $fn = 32);
                }
            }
        }
    }
    
}

heat_bed_holder_base();
translate([0, 20, 0])
    heat_bed_holder_top();
