$fn=180;
inner_d=48.4;
outer_d=inner_d+6.8;
hole_length=45;
hl1=hole_length+0.01;

module frame() {
    hull() {
        cylinder(hole_length,d=outer_d);
        rotate([0,90,0]) cylinder(hole_length,d=outer_d);
        rotate([90,90,0]) cylinder(hole_length,d=outer_d);
        sphere(d=outer_d);
    }
        translate([-6,6,-outer_d/2]) cylinder(5,d=12);
}
difference() {
    frame();
    translate([0,0,0]) cylinder(hl1,d=inner_d-0.2); //The perpendicular hole is a bit bigger.
    rotate([0,90,0]) translate([0,0,0]) cylinder(hl1,d=inner_d);
    rotate([90,90,0]) translate([0,0,0]) cylinder(hl1,d=inner_d);
    sphere(d=inner_d);
    translate([0,0,-outer_d/2]) cube([100,100,4],true);
}
translate([-inner_d/2,-20,0]) cube([1,4,inner_d/4],true);
translate([20,inner_d/2,0]) cube([4,1,inner_d/4],true);
translate([0,inner_d/2,20]) cube([inner_d/4,1.5,4],true);
