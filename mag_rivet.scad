include <MCAD/regular_shapes.scad>
$fn=360;
//color("gray") cylinder(h=3,d=19.5);
/*
difference() {
    hull() {
        translate([0,20,0]) cylinder(h=4.2,d=4);
        translate([0,-20,0]) cylinder(h=4.2,d=4);
        translate([12,0,0]) cylinder(h=4.2,d=4);
        translate([-12,0,0]) cylinder(h=4.2,d=4);
    }
    cylinder(h=3,d=19.5);
    cylinder(h=5,d=15);
    translate([0,15,0]) cylinder(h=4,d=3);
    translate([0,15,4-2.4]) hexagon_prism(3,3.4);
    translate([0,-15,0]) cylinder(h=4,d=3);
    translate([0,-15,4-2.4]) hexagon_prism(3,3.4);
}
*/
difference() {
    hull() {
        translate([0,20,0]) cylinder(h=4.2,d=4);
        translate([0,-20,0]) cylinder(h=4.2,d=4);
        translate([12,0,0]) cylinder(h=4.2,d=4);
        translate([-12,0,0]) cylinder(h=4.2,d=4);
    }
    cylinder(h=3,d=19.5);
    cylinder(h=5,d=15);
    translate([0,15,0]) cylinder(h=4.2,d=3);
    translate([0,15,1.2]) cylinder(h=3,d1=3,d2=5.7);
    translate([0,-15,0]) cylinder(h=4.2,d=3);
    translate([0,-15,1.2]) cylinder(h=3,d1=3,d2=5.7);
}