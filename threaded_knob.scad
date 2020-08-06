include <threads.scad>;
$fn=100;
radius=25;
module knob () {
    sphere(r=radius);
    list = [for (x=[120:20:240], y = [0:20:340]) [x,y,0]]; 
    for (n=list) rotate(n) translate([0,0,radius]) cylinder(7,r=2.5);
    rotate([-90,0,0]) translate([0,0,radius]) cylinder(7,r=4);
    rotate([90,0,0]) translate([0,0,radius]) cylinder(7,r=4);
}
difference() {
    knob();
    translate([0,0,-radius-8]) cylinder(13,r=radius);
    translate([0,0,-radius-8]) cylinder(33,d=42);
    translate([0,0,-radius+1]) metric_thread(42,4,24,invert=true);
}   