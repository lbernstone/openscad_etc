th=2.5;
long=140;
gap=38;
hanger=37;
ext=16;
linear_extrude(ext) {
    polygon([[0,0],[0,th],[long-th,th],[long-th,gap+th],[long-hanger,gap-th],[long-hanger,gap],[long,gap+th*2],[long,0]]);
}
module peg(axis) {
    $fn=360;
    translate([axis,-1.5,(ext-5.6)/2]) cube([10.75,1.5,5.6]);
    translate([axis+10,0,ext/2]) rotate([90,90,0]) cylinder(h=7.5,d=5);
    translate([axis+10,th-7.5,ext/2]) rotate([90,0,0]) cylinder(h=th,d=12);
}
peg(20);
peg(60);
peg(100);