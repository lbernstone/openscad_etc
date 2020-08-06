$fn=360;
module box() {
cube([44.3,26.5,1.2]);
cube([44.3,1.2,44.3]);
translate([0,0,44.3-1.2]) cube([44.3,9,1.2]);
translate([-1.2,26.4,1.2]) rotate([111.9,0,0]) cube([45.5,46.5,1.2]);
rotate([0,-90,0])
  linear_extrude(1.2) polygon([[0,0],[44.3,0],[44.3,9+0.1],[0,26.5+0.05]]);
translate([44.3,0,0]) rotate([0,-90,0])
  linear_extrude(1.2) polygon([[0,0],[44.3,0],[44.3,9],[0,26.5]]);
}

difference() {
    box();
    translate([44.3/2,1.2,44.3/2]) rotate([90,0,0]) cylinder(1.3,d=35); // fan hole
    // fan screws
    translate([44.3/2-31/2,1.2,44.3/2-31/2]) rotate([90,0,0]) cylinder(1.3,d=2.8);
    translate([44.3/2+31/2,1.2,44.3/2-31/2]) rotate([90,0,0]) cylinder(1.3,d=2.8);
    translate([44.3/2+31/2,1.2,44.3/2+31/2]) rotate([90,0,0]) cylinder(1.3,d=2.8);
    translate([44.3/2-31/2,1.2,44.3/2+31/2]) rotate([90,0,0]) cylinder(1.3,d=2.8);
    translate([7.35,26.5-2.5,0]) cube([44.3-(7.35*2),5,5]);
    // top screws
    translate([(44.3-29.6)/2,4.5,44.3-1.2]) cylinder(1.2,d=2.9);
    translate([44.3-(44.3-29.6)/2,4.5,44.3-1.2]) cylinder(1.2,d=2.9);
}