$fn=360;
rot_front = [90,0,0];
base_w = 20;
base_depth = 19.25;
base_ht = 3.7;
base_ball_dia = 5;
pipe_dia = 25.4;
pipe_len = 14;
pipe_th = 3;
collar_dia = 5;
collar_th = 1.5;
gap_width = 16;
top_ball_dia = 4;
cut_dia = 13;

difference() {
    union() {
        rotate(rot_front) translate([-base_w/2,base_ball_dia/2,-base_depth/2]) cylinder(base_depth,d=base_ball_dia);
        rotate(rot_front) translate([base_w/2,base_ball_dia/2,-base_depth/2]) cylinder(base_depth,d=base_ball_dia);
        translate([0,0,base_ht/2]) cube([base_w,base_depth,base_ht],true);
        rotate(rot_front) translate([0,(pipe_dia+pipe_th)/2,-pipe_len/2]) cylinder(pipe_len,d=pipe_dia+pipe_th);
        rotate(rot_front) translate([0,(pipe_dia+pipe_th)/2,-collar_th/2]) cylinder(collar_th,d=pipe_dia+pipe_th+collar_dia);
    }
    rotate(rot_front) translate([-base_w/2,base_ball_dia/2,-base_depth/2]) cylinder(base_depth,d=base_ball_dia/2);
    rotate(rot_front) translate([base_w/2,base_ball_dia/2,-base_depth/2]) cylinder(base_depth,d=base_ball_dia/2);
    rotate(rot_front) translate([0,(pipe_dia+pipe_th)/2,-pipe_len/2]) cylinder(pipe_len,d=pipe_dia);
    translate([0,0,base_w]) cube([gap_width+pipe_th/2,pipe_len*1.01,base_w],true); //gap cutout
    mirror([0,0,1]) translate ([-pipe_dia/2,-pipe_dia/2,0]) cube([pipe_dia,pipe_dia,pipe_dia]);
    translate([-pipe_dia/2,-pipe_dia/2,pipe_dia]) cube([pipe_dia,pipe_dia,pipe_dia]); //clear above top of top balls
    translate([0,0,base_ht/2]) cube([cut_dia,cut_dia/2,base_ht],true); // rectangular base cutout
    cylinder(base_ht/2,d=cut_dia); // circular base cutout    
}
rotate(rot_front) translate([-base_w/2,pipe_dia-0.4,-gap_width/2]) cylinder(gap_width,d=top_ball_dia);
rotate(rot_front) translate([base_w/2,pipe_dia-0.4,-gap_width/2]) cylinder(gap_width,d=top_ball_dia);
translate([0,base_depth/3,base_ht/2]) cube([base_w*2/3,(base_depth-cut_dia/2)/2,base_ht/3],true); // suction cup retainer
translate([0,-base_depth/3,base_ht/2]) cube([base_w*2/3,(base_depth-cut_dia/2)/2,base_ht/3],true); // suction cup retainer