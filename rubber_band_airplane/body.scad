$fn=100;
main_thickness = 0.8;
wing_offset = 7;
wing_depth = 20;
cab_depth=wing_depth/2;
width1 = 120;
wall_thickness = 0.8;
min_thickness = 0.4; //nozzle width
body_thickness = 10;
f_hook_dia = 4;
f_hook_width = 18;
f_hook_len = 24; //this is just the distance behind the cab
r_hook_dia = 2.4;
fuselage_w = 10;
fuselage_l = 120;
fuselage_th = 5;
rear_mount = 90;
module winglet(offset,depth,thickness=main_thickness) {
    hull() {
        translate([offset,depth/2,0]) rotate([90,0,0]) cylinder(depth,d=thickness);
        translate([offset*1.5,-depth/4,depth*0.6]) rotate([90,0,0]) cylinder(depth/2,d=thickness);
    }
}

module wing(length,depth,thickness) {
    winglet(length/2,depth);
    mirror([1,0,0]) winglet(length/2,depth);
    cube([length,depth,thickness],true);
}

module cab_frame() {
    polygon([[cab_depth/2,0],[f_hook_width/2,-cab_depth],[f_hook_width/2,-f_hook_len],[-f_hook_width/2,-f_hook_len],[-f_hook_width/2,-cab_depth],[-cab_depth/2,0]]);
}
difference() {
    union() {
// The wings and main supports
        wing(width1,wing_depth,wall_thickness);
        translate([0,0,wing_offset]) wing(width1,wing_depth,wall_thickness);
        for (x = [0:10]) {
            translate([width1/2-min_thickness-width1/10*x,-wing_depth/2,0]) cube([min_thickness,wing_depth,wing_offset]); 
            mirror([1,0,0]) translate([width1/2-min_thickness-width1/10*x,-wing_depth/2,0]) cube([min_thickness,wing_depth,wing_offset]);
        }
        translate([width1*0.75-wall_thickness/4,-wing_depth/2,15.5]) cube([wall_thickness,wing_depth/2,wing_offset],true);
        mirror([1,0,0]) translate([width1*0.75-wall_thickness/4,-wing_depth/2,15.5]) cube([wall_thickness,wing_depth/2,wing_offset],true);

// The cab
        translate([-cab_depth/2,0,0]) cube([cab_depth,cab_depth,wing_offset]);
//extruded plines go from back of the cab tracing around the hook
        translate([0,0,-main_thickness/2]) linear_extrude(height=wing_offset+main_thickness) cab_frame();
        translate([0,0,-main_thickness/2]) linear_extrude(height=main_thickness) offset(r=fuselage_th) cab_frame();
    }
// The front hook shaft
    translate([0,cab_depth,wing_offset/2]) rotate([90,0,0]) cylinder(cab_depth+f_hook_len+main_thickness,d=f_hook_dia);
// The inside wall of the cab frame
    translate([0,0,-main_thickness/2]) linear_extrude(height=wing_offset+main_thickness) offset(r=-main_thickness) cab_frame();
}
//translate([-5,-10,0]) cube([1.2,10,7]);
//translate([5-1.2,-10,0]) cube([1.2,10,7]);
// fuselage
difference() {
    translate([-fuselage_w/2,-fuselage_l,-main_thickness/2]) cube([fuselage_w,fuselage_l-f_hook_len,fuselage_th]);
    translate([-3.8,-fuselage_l,main_thickness/2]) cube([10-2.4,fuselage_l-10,5-main_thickness]);
    translate([-fuselage_w/2,-fuselage_l,main_thickness/2]) cube([fuselage_w,wing_depth-main_thickness,5-main_thickness]);
}
// rear hook mount

difference() {
    translate([-fuselage_w/2,-rear_mount-r_hook_dia*1.5,-main_thickness/2]) cube([fuselage_w,r_hook_dia*3,fuselage_th]);
//    translate([-fuselage_w/2-1,-fuselage_l,0]) cube([fuselage_w+2,18,5-main_thickness]);
    translate([0,-rear_mount,-main_thickness/2]) cylinder(fuselage_th+main_thickness,d=r_hook_dia);
}

//Back wing
translate([-40,-fuselage_l,-main_thickness/2]) cube([80,20,main_thickness]);
// Rear Stabilizer
translate([-wall_thickness,-120,0]) rotate([90,0,90]) linear_extrude(height=wall_thickness*2) polygon([[0,0],[0,30],[10,30],[20,20],[20,0]]);
translate([-fuselage_w/2,-fuselage_l+20-wall_thickness*3,0]) cube([fuselage_w,wall_thickness*3,fuselage_th]);