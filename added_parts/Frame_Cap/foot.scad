$fn=50;
tol=0.2;

rotate([0,180,0]) foot();

module foot() {
  difference() {
    union() {
      for(i=[0,90,180,270])
        rotate([0,0,i])
          translate([0,15/2,0]) cube([3,3,5],center=true);
      intersection() {
        rotate([0,0,45]) cube([25,25,50],center=true);
        difference() {
          hull() {
            cube([20,20,5],center=true);
            translate([0,0,5]) cylinder(r=16/2,h=2);
          }
          translate([0,0,-tol]) cube([15,15,5],center=true);
        }
      }
    }
    translate([10,0,0]) cube([20,8,20],center=true);
  }
}