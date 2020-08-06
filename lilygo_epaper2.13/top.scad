$fn=50;
module top(x, y, z, cham=3) {
    oy = y-cham*2;
    ox = x-cham*2;
        hull() {
            translate([-ox/2,-oy/2,0]) cylinder(h=z,r=cham);
            translate([-ox/2,oy/2,0]) cylinder(h=z,r=cham);
            translate([ox/2,-oy/2,0]) cylinder(h=z,r=cham);
            translate([ox/2,oy/2,0]) cylinder(h=z,r=cham);
        }
}
th=1.2;
difference() {
    translate([0,0,0]) top(84,57,th);
    translate([6,1,0]) cube([60,30.7,5],true);
    translate([-33.1,10.35,0]) cube([3.5,4.6,th]);    
    translate([-33.1,1.35,0]) cube([3.5,4.6,th]);
    translate([-33.1,-7.25,0]) cube([3.5,4.6,th]);
    translate([-33.1,-16.61,0]) cube([3.5,4.6,th]);
}

// set pins
translate([-29.3,18.55,0]) cylinder(h=5,r=0.8);
translate([29.5,18.55,0]) cylinder(h=5,r=0.8);
translate([-29.3,-19.45,0]) cylinder(h=5,r=0.8);
// posts
difference() {
  union() {  
    translate([31.2,17,0]) cube([3,5,5.2]);
    translate([31.2,-23,0]) cube([3,5,5.6]);
    translate([-35.5,16,0]) cube([3,5,5.6]);
    translate([-35.5,-23,0]) cube([3,5,5.6]);
  }
  translate([-35.5+1.8,-23,3.2]) cube([66.2,45,1.2]);
}