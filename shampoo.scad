$fn=1000;
hull() {
    translate([-28,-28,0]) cylinder(1.6,d=4);
    translate([28,28,0]) cylinder(1.6,d=4);
    translate([28,-28,0]) cylinder(1.6,d=4);
    translate([-28,28,0]) cylinder(1.6,d=4);
}
difference() {
    cylinder(40,d=37);
    translate([0,0,1.2]) cylinder(40,d=34);
}