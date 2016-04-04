$fn=100;
plate_thickness=1.5;

module clip(x){
    difference(){
        union(){
            translate([0,plate_thickness/2,0]) cube([10,plate_thickness,x],center=true);
        
            hull(){
                    translate([-1.2,0,0])cylinder(h=x,r=0.5,center=true);
                    translate([-2.7/2,-2,0])cylinder(h=x,r=0.6,center=true);
            }
            hull(){
                    translate([1.2,0,0])cylinder(h=x,r=0.5,center=true);
                    translate([2.7/2,-2,0])cylinder(h=x,r=0.6,center=true);
            } 
        } 
        translate([0,0.3,0])cylinder(h=x+1,r=0.6,center=true);
    }
}

clip(10); //lenght

%translate ([0,-7.5,0])color ("DeepSkyBlue") linear_extrude(file ="TL-400-0101-002.dxf",height =30, center = true, convexity = 10, twist = 0); //OpenBeam Stream
