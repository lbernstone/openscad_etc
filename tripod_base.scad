$fn=180;
include <threads.scad>;
legs = 3;
cylinder(20,d=38.5);
metric_thread(40.5,4,20);
difference() {
    cylinder(19.99,d=52);
    cylinder(19.99,d=51);
}
translate([0,0,15]) cylinder(5,d2=40+12,d1=40);
translate([0,0,20]) cylinder(10,d=40+12); //pipe ID + twice the thickness
difference() {
    for (x = [0:legs-1]) {
        rotate([0,0,x*(360/legs)]) translate([-4,4,26]) rotate([30,30,180]) cylinder(70,d=0.61*25.4);
    }
    translate([0,0,80]) cube([150,150,20],true);
}
