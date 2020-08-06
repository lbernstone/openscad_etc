$fn=100;
rot_front = [90,0,0];
base_w = 26;
base_depth = 25;
base_ht = 7;
base_ball_dia = 6.5;
pipe_dia = 33;
pipe_len = 18.2;
pipe_th = 5;
collar_dia = 6;
collar_th = 1.5;
gap_width = 18;
top_ball_dia = 5;
cut_dia = 13;
glass_th = 3/32*25.4;
pipe_lift = 3;

difference() {
    union() {
        //rotate(rot_front) translate([-base_w/2,base_ball_dia/2,-base_depth/2]) cylinder(base_depth,d=base_ball_dia);
        //rotate(rot_front) translate([base_w/2,base_ball_dia/2,-base_depth/2]) cylinder(base_depth,d=base_ball_dia);
        translate([0,0,base_ht/2]) cube([base_w,base_depth,base_ht],true);
        rotate(rot_front) translate([0,(pipe_dia+pipe_th)/2+pipe_lift,-pipe_len/2]) cylinder(pipe_len,d=pipe_dia+pipe_th);
        rotate(rot_front) translate([0,(pipe_dia+pipe_th)/2+pipe_lift,-collar_th/2]) cylinder(collar_th,d=pipe_dia+pipe_th+collar_dia);
        rotate(rot_front) translate([-base_w+5,0,-base_depth/2]) cube([8,base_ht,base_depth]);
        rotate(rot_front) translate([base_w-13.5,0,-base_depth/2]) cube([8,base_ht,base_depth]);
    }
    //rotate(rot_front) translate([-base_w/2,base_ball_dia/2,-base_depth/2]) cylinder(base_depth,d=base_ball_dia/2);
    //rotate(rot_front) translate([base_w/2,base_ball_dia/2,-base_depth/2]) cylinder(base_depth,d=base_ball_dia/2);
    rotate(rot_front) translate([0,(pipe_dia+pipe_th)/2+pipe_lift,-pipe_len/2]) cylinder(pipe_len,d=pipe_dia);
    translate([0,0,base_w]) cube([gap_width+pipe_th+4,pipe_len*1.01,base_w-4],true); //gap cutout
    mirror([0,0,1]) translate ([-pipe_dia/2,-pipe_dia/2,0]) cube([pipe_dia,pipe_dia,pipe_dia]);
    translate([-pipe_dia,-pipe_dia,pipe_dia+1.2]) cube([pipe_dia*2,pipe_dia*2,pipe_dia*2]); //clear above top of top balls
    rotate(rot_front) translate([-base_w+2.6,(base_ht-glass_th)/2,-base_depth/2]) cube([base_ball_dia+3,glass_th,base_depth]);
    rotate(rot_front) translate([base_w-12.4,(base_ht-glass_th)/2,-base_depth/2]) cube([base_ball_dia+3,glass_th,base_depth]);    
}
rotate(rot_front) translate([-base_w/2-1.6,pipe_dia,-gap_width/2]) cylinder(gap_width,d=top_ball_dia);
rotate(rot_front) translate([base_w/2+1.6,pipe_dia,-gap_width/2]) cylinder(gap_width,d=top_ball_dia);
