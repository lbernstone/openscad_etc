$fn=180;
include <threads.scad>;
cylinder(20,d=38.5);
metric_thread(40.5,4,20);
translate([0,0,15]) cylinder(5,d2=48.5,d1=40);
difference() {
    translate([0,0,20]) cylinder(100,d=48.5);
    translate([0,0,95]) cylinder(25,d=40);
    translate([0,0,95]) metric_thread(42,4,25,internal=true);
    translate([0,0,128.8]) cylinder(1.2,d=40);
}
/*
difference() {
    cylinder(19.99,d=48.4);
    cylinder(19.99,d=47.4);
}
*/