difference() {
    cube([70,54,1.6]);
    for (x=[0:7],y=[0:6]) {
        translate([(x-0.5)*9.9,(y-0.5)*9.9,0]) cylinder(h=1.6,d=4);
        translate([x*9.9,y*9.9,0]) cylinder(h=1.6,d=3.8);
    }
}