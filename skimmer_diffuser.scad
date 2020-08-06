$fn=360;
difference() {
    cylinder(100,d=32.5+3.2);
    cylinder(100,d=32.5);
    for (rot = [0:20:240])
       rotate([rot,90,0]) translate([-44,0,15]) cube([3,4,3]);
}
difference() {
    cylinder(2,d=32.5+3.2);
    cylinder(2,d=8);
}