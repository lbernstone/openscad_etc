$fn=100;
difference() {
    translate([112.98,41.4,0]) cube([16,5,1.5]);
    for (x = [0:4]) {translate([(x*2.54)+115.86,43.2,0]) cylinder(1.5,d=1.8);}
}