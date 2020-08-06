$fn=360;
difference() {
    cube([19+2*2,24+2*2+4,11.2+2*2]);
    translate([2,6,2]) cube([19,24,11.3+2]);
    translate([23/2-10/2,0,2]) cube([10,6,15]);
    translate([2,2,2]) cube([19,2,15]);
}
translate([23,16,0]) difference(){
    union() {
        cube([4,6,2]);
        translate([4,3,0]) cylinder(h=2,d=6);
        translate([0,-2,0]) cube([6,3,2]);
        translate([3,-2,2]) cube([3,1.2,4]);
        translate([3,-2,5]) cube([3,3.2,1.2]);
    }
    translate([4,3,0]) cylinder(h=2,d=2.5);
}
translate([12+6.2,20,2]) cylinder(h=1.6,d=1.8);
translate([12-6.2,20,2]) cylinder(h=1.6,d=1.8);

//translate([40,0,0]) cube([15,4,1.6]);