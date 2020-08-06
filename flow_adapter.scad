$fn=360;
difference() {
    union() {
        cylinder(17,d=26);
        translate([0,0,15]) cylinder(15,d=13.2);
    }    
    cylinder(15,d=22.2);
    translate([0,0,15]) cylinder(15,d=9.2);
}
