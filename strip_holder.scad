$fn=100;
w_border=15;
module holder(
  height=31, // the height of the powerstrip
  width=101, // the width of the powerstrip
  window_border=15, // 
  socket_depth=20,
  th=2.6,
  flap=15,
  screw_d=4
  ) {
    window_w=width-w_border;
    window_h=height-w_border;
    difference() { // powerstrip casing
        hull() {
            translate([-height/2,-width/2,0]) cylinder(h=socket_depth,r=2);
            translate([height/2,-width/2,0]) cylinder(h=socket_depth,r=2);
            translate([height/2,width/2,0]) cylinder(h=socket_depth,r=2);
            translate([-height/2,width/2,0]) cylinder(h=socket_depth,r=2);
        }
        translate([0,0,socket_depth/2+th/2]) cube([height,width,socket_depth],true);
        cylinder(h=th,d=29);
        cube([window_h,window_w,th],true);
    }
    difference() { //screw base
        // TODO make this a hull
        translate([-height/2-th,width/2+flap,0]) rotate([90,0,0]) cube([th,socket_depth,width+flap*2]);
        translate([-height/2-th,width/2+flap/2+th/2,socket_depth/2]) rotate([0,90,0]) cylinder(h=10*th,d=4);
        translate([-height/2-th,-width/2-flap/2-th/2,socket_depth/2]) rotate([0,90,0]) cylinder(h=10*th,d=4);
    }
}
holder();
