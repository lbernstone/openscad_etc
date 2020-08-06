$fn=360;
difference() {
    union() {
        translate([-19.2/2,11,0]) cube([19.2,3.5,35+7.6+39]);
        cylinder(h=35+7.6+39,d=25+2*2);
    }
    cylinder(h=2,d=3);
    translate([0,0,2]) cylinder(h=31,d=25);
    translate([0,0,33]) cylinder(h=2,d=8.5);
    difference() {
        translate([0,0,33]) cylinder(h=2,d=25);
        translate([-15,0,33]) cube([30,30,2]);
    }
    translate([0,0,38]) cylinder(h=2,d=17.6);
    translate([0,0,34]) cylinder(h=7.6,d=8.5);
    translate([-15,-30,34]) cube([30,30,7.6]);
    translate([0,0,34+7.6]) cylinder(h=38,d=25);    
    translate([-15,-19,34+7.6]) cube([30,30,41]);    
}
translate([-5.6,6.8,35+7.6+37]) cube([11.2,6,2]);
difference() {
    translate([0,0,35+7.6+37]) cylinder(h=2,d=13.6+3*2);
    translate([0,0,35+7.6+37]) cylinder(h=2,d=13.6);    
}
