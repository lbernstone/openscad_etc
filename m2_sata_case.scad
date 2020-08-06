module pcb() {
  cube([44,8,5.7]);
  difference() {
    cube([44,98,1.6]);
    translate([10.3,15.5,-0.01]) cylinder(2,d=3.4);
    translate([10.3,92,-0.01]) cylinder(2.02,d=3.4);
  }
}

module peg() {
    difference(){
        cylinder(3.2,d=5);
        translate([0,0,-0.01]) cylinder(3.21,d=3);
    }
}

module case() {
    difference () {
        cube([1.2*2+3+44*2,98+3.2,9.2]);
        translate([1.2,-0.01,1.2]) cube([3+44*2,98+2,10]);
        translate([10.3+1.2,15.5,-0.01]) cylinder(3.21,d=3);
        translate([10.3+1.2,92,-0.01]) cylinder(3.21,d=3);
        translate([10.3+1.2+44+2,15.5,-0.01]) cylinder(3.21,d=3);
        translate([10.3+1.2+44+2,92,-0.01]) cylinder(3.21,d=3);
        translate([1.2*2+3+44*2-10.3-1.2,15.5,0]) cylinder(3.21,d=3);
        translate([1.2*2+3+44*2-10.3-1.2-44-2,15.5,0]) cylinder(3.21,d=3);
        translate([1.2*2+3+44*2-10.3-1.2,92,0]) cylinder(3.21,d=3);
        translate([1.2*2+3+44*2-10.3-1.2-44-2,92,0]) cylinder(3.21,d=3);
    }
    translate([10.3+1.2,15.5,0]) peg();
    translate([10.3+1.2,92,0]) peg();
    translate([10.3+1.2+44+2,15.5,0]) peg();
    translate([10.3+1.2+44+2,92,0]) peg();
    translate([1.2*2+3+44*2-10.3-1.2,15.5,0]) peg();
    translate([1.2*2+3+44*2-10.3-1.2-44-2,15.5,0]) peg();
    translate([1.2*2+3+44*2-10.3-1.2,92,0]) peg();
    translate([1.2*2+3+44*2-10.3-1.2-44-2,92,0]) peg();
}

$fn=360;
//translate([2.2,0,3.2]) pcb();
//translate([2.2+44+1,0,3.2]) pcb();
case();
//translate([1.2*2+3+44*2,0,0]) rotate([0,180,0]) case();