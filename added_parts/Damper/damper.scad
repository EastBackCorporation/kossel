$fn=100;

difference() {
  union() {
    difference() {
      union() {
        difference() {
          cylinder(r=10, h=10);
          cylinder(r=8.5, h=10);
        }
        difference() {
          translate([3, 0, 0]) cylinder(r=7, h=10);
          translate([3, 0, 0]) cylinder(r=5.5, h=10);
        }
      }
      union() {
        translate([-10, 1,0]) cube([10, 10, 10]);
        translate([0, 0, 0]) rotate([0, 0, 20]) cube([30, 20, 10]);
      };
    };
    translate([-9, -0.5, 0]) cube([5, 1.5, 10]);
    translate([-5, -8.6, 0]) cube([4, 8.6+1+15, 10]);
  };
  translate([-1, 8.5, 5]) rotate([0, -90, 0]) cylinder(r=3.45/2, h=4);
};