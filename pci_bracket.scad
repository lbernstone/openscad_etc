$fn=360;
module pci_bracket() {
    linear_extrude(1.2) {
        polygon([[0,0],[3.5,0],[6.5,3],[109,3],[112.6,6.3],[112.6,7.5],[118.5,7.5],[118.5,16.4],[112.6,16.4],[112.6,17.4],[109,21.2],[8,21.2],[5,18.2],[0,18.2]]);
    }
    difference() {
        cube([1.2,18.2,12]);
        translate([0,3.2,6.5]) rotate([0,90,0]) cylinder(h=1.2,d=4.2);
        translate([0,0,6.5+4.2/2]) rotate([0,90,0]) cube([4.2,3.2,1.2]);
    }
}

difference() {
    pci_bracket();
    //translate([50,12.2,0]) cylinder(h=1.2,d=7);
    //translate([75,12.2,0]) cylinder(h=1.2,d=7);
}