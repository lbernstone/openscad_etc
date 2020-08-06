$fn=360;
difference() {
    translate([0,0,.8]) cube([7.5,7.5,1.6],true);
    cylinder(1.6,d=5.5);
    translate([-7.5/2,-5.3/2,0]) cube([4.2,5.3,1.6]);
}