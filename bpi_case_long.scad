use <MCAD/boxes.scad>;
$fn=120;

module screw_peg(loc, dia= 2, ht=4) {
    difference() {
        translate(loc) cylinder(ht,d=dia+3.2);
        translate(loc) cylinder(ht,d=dia);
    }    
}

module top() {
    translate([0,0,box_h/2]) roundedBox([box_w,box_l,th],box_r*2,true);
    difference() {
        translate([0,0,box_h/2-th]) roundedBox([box_w-2*th,box_l-2*th,th+0.4],box_r*2,true);
        translate([0,0,box_h/2-th-.01]) roundedBox([box_w-4*th-0.1,box_l-4*th-0.1,th+0.4],box_r*2,true);
    }
}

module shell() {
    difference() {
        hull() {
            roundedBox([box_w,box_l,box_h], box_r*2, true);
        }
        translate([0,0,th]) roundedBox([pad_w+0.1,pad_l+0.1,box_h+0.1], th*3,true);
// usb holes
        hole_ht=box_h/2-2.4-7;
        translate([-box_w/2+8.8,box_l/2+.1,hole_ht]) rotate([90,0,0]) cube([8.8,5,th+1]);
        translate([-box_w/2+8.8+12.8,box_l/2+.1,hole_ht]) rotate([90,0,0]) cube([8.8,5,th+1]);
// hdmi hole
        translate([box_w/2-22,box_l/2+.1,hole_ht]) rotate([90,0,0]) cube([14,5,th+1]);
 // sdcard hole
        translate([pad_w/2+th+.1,-8.6,hole_ht]) rotate([0,-90,0]) cube([5,13.2,th+1]);
 // GPIO hole
        //translate([0,-pad_l/2+5.4,-box_h/2+th]) cube([52,7,th*2.5],true);
 // camera hole
        //translate([-box_w/2+8,0,-box_h/2-.1]) cylinder(h=th*2,d=7.4);
    }
    set_w = 58.2/2;
    set_l = 23.4/2;
    screw_peg([-set_w,-set_l,-box_h/2+th],2,4);
    screw_peg([set_w,-set_l,-box_h/2+th],2,4);
    screw_peg([set_w,set_l,-box_h/2+th],2,4);
    screw_peg([-set_w,set_l,-box_h/2+th],2,4);
}

pad_w = 69.4-2.4;
pad_l = 32;
th = 1.2;
snap_w = 1;
snap_l = 5;
snap_th = 0.8;
box_w = pad_w + 2*th;
box_l = pad_l + 2*th;
box_h = 15;
box_r = 2.5;

//color([0.8,0.8,0.8]) top();
shell();
