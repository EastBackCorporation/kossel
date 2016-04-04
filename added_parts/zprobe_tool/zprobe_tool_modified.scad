include <configuration.scad>;

r_base = 5;             // radius of the tool base (mm)
h_base = 7;             // height of the tool base (mm)
l_tool = 15;            // center-to-center length of the base (mm)
r_tool = 4;             // radius of the tool that sticks up beyond the bed (mm)
h_tool = 18;            // height of the tool above the base (mm)
m3_head_wide_radius = 3.2;
m3_head_height = 3;
$fn = 100;

difference() {
  union() {
    cube([2*r_base, l_tool, h_base]);
    translate([r_base, l_tool, 0])      cylinder(r=r_base, h=h_base);
    translate([r_base, 0,      0])      cylinder(r=r_base, h=h_base);
    translate([r_base, l_tool, h_base]) cylinder(r=r_tool, h=h_tool);
  };
  union() {
    translate([r_base, 0, 0])
    cylinder(r=m3_wide_radius, h=h_base - m3_head_height);
    translate([r_base, 0, h_base - m3_head_height])
    cylinder(r=m3_head_wide_radius, h=h_base - m3_head_height);
  };
};