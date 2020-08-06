$fn=360;
l = 65;
w = 72;
ht = 60;
// This whole thing needs to be a bit wider so you can get at the top screws
// when the socket aasy is in place.
module sconce() {
    difference() {
        cube([l,w,ht]);
        translate([l,0,0]) rotate([0,-90,0]) hull() {
            translate([3.5,3.5,0]) cylinder(l,d=3);
            translate([3.5,w-3.5,0]) cylinder(l,d=3);
            translate([ht-3.5,w-3.5,0]) cylinder(l,d=3);
            translate([ht-3.5,3.5,0]) cylinder(l,d=3);
        }
        translate([-1,2,-1]) cube([l+2,w-6,5]);
        translate([l/2,-0.5,22]) rotate([-90,0,0]) cylinder(3,d=10);
    }
    difference() {
        translate([w+1.4,w/2,ht-2]) cylinder(2,d=98.5+l);
        translate([0,-165/2,0]) cube([165,205,ht+1]);
    }
    translate([l,0,0]) mirror([1,0,0]) difference() {
        translate([w+1.4,w/2,ht-2]) cylinder(2,d=98.5+l);
        translate([0,-165/2,0]) cube([165,205,ht+1]);
    }
    difference() {
        translate([0,w-20,0]) cube([l,20,2]);
        translate([14,w-20+8/2+2,0]) cylinder(2,d=8);
        translate([14,w-9,1]) cube([3.51,3,2.1],true);
        translate([14,w-8,0]) cylinder(3,d=3.51);
        translate([l-14,w-20+8/2+2,0]) cylinder(2,d=8);
        translate([l-14,w-9,1]) cube([3.51,3,2.1],true);
        translate([l-14,w-8,0]) cylinder(2,d=3.51);
    }
    translate([10,20,ht-2]) rotate([180,0,0]) difference () {
        cylinder(5/16*25.4,d=10);
        translate([0,0,1/16*25.4]) cylinder(1/4*25.4,d=3.9);
    }
    translate([10,w-20,ht-2]) rotate([180,0,0]) difference () {
        cylinder(5/16*25.4,d=10);
        translate([0,0,1/16*25.4]) cylinder(1/4*25.4,d=3.9);
    }
    translate([l-10,20,ht-2]) rotate([180,0,0]) difference () {
        cylinder(5/16*25.4,d=10);
        translate([0,0,1/16*25.4]) cylinder(1/4*25.4,d=3.9);
    }
    translate([l-10,w-20,ht-2]) rotate([180,0,0]) difference () {
        cylinder(5/16*25.4,d=10);
        translate([0,0,1/16*25.4]) cylinder(1/4*25.4,d=3.9);
    }
}

module locknut() {
    translate([-20,10,0]) {
        difference() {
            cylinder(h=11,d=10+9.2);
            cylinder(h=11,d=10);
            translate([0,0,11-3.8]) cylinder(h=4, d=16, $fn=6);
        }
    }
}

sconce();
//locknut();