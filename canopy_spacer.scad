$fn=120;
difference() {
    cube([30,30,27]);
    translate([15,0,19.9]) rotate([-90,0,0]) cylinder(30,d=8.4);
    translate([0,15,8.4]) rotate([0,90,0]) cylinder(30,d=8.4);
}
