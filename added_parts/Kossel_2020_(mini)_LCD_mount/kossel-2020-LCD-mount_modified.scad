$fn = 100;

lcd_w = 150;
lcd_l = 55;

support1_w = 10;
support1_l = 62;
support1_h = 7;
offset = 6;
hole_l = 49.5;
hole_d = 3.2;
sd_card_l = 29;
sd_card_h = 3.4;
support2_w = 10;
support2_l = 7;
support2_h = 25;
ext_w = 15;

union() {
  difference() {
    difference() {
      translate([0, 0, 0])
        cube([support1_w, support1_l, support1_h]);  
      translate([support1_w / 2, support1_l - offset, 0])
        cylinder(r=hole_d / 2, h=support1_h);
      translate([support1_w / 2, support1_l - offset - hole_l, 0])
        cylinder(r=hole_d / 2, h=support1_h);
    };
    translate([0, 23, 0])
      cube([support1_w, sd_card_l, sd_card_h]);
  };
  translate([0, 0, 0])
    rotate([45, 0, 0]) {
      difference() {
        cube([support2_w, support2_l, support2_h]);
        translate([support2_w / 2, support2_l, support2_h - (ext_w / 2)])
          rotate([90, 0, 0]) {
            cylinder(r=hole_d / 2, h=support2_l);
          };
        translate([support2_w / 2, 3, support2_h - (ext_w / 2)])
          rotate([90, 0, 0]) {
            cylinder(r=hole_d, h=3);
          };
      };
    };
  };