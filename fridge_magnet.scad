//block_text = "ELLA";
block_text = "IRIE  ";
left_wiggle = 0; //Adjust to center the letters properly
layer_height = 0.1; // The letters "float" above the block so that it does a decent fill
font_kern = 0.75; //ratio of width to height
font = "Ubuntu Bold:style=bold";
letter_size = 16;
block_height = 6.1;
text_height = 2.5;
mag_inset = 0.8;
mag_l = 21;
mag_w = 11.6;
mag_h = 4;
border = 2;
difference() {
    translate([0,0,block_height/2]) cube([len(block_text)*letter_size*font_kern+2*border,letter_size+4*border,block_height],true);
    // The pocket is based on a 10x20x3.75mm magnet
    translate([0,0,mag_inset+mag_h/2]) cube([mag_l+0.4,mag_w+0.4,mag_h],true);
    translate([mag_l/2,-2.1,mag_inset]) cylinder(mag_h,r=1.2,$fn=30);
    translate([6.9,5.8,mag_inset]) cylinder(mag_h,r=2.5,$fn=30);
    translate([-mag_l/2,2.1,mag_inset]) cylinder(mag_h,r=1.2,$fn=30);
    translate([-6.9,-5.8,mag_inset]) cylinder(mag_h,r=2.5,$fn=30);
    translate([0,0,(mag_h+mag_inset)/2]) rotate([0,0,24]) cube([mag_l,mag_w,mag_h+mag_inset],true);
}
translate([left_wiggle,0,block_height+2*layer_height]) linear_extrude(height=text_height) text(block_text, size = letter_size, font = font, halign = "center", valign = "center", $fn = 40);
//translate([18,-9.5,10]) scale([0.2,0.2,0.09]) surface(file="../Downloads/weed4.png",invert=true);
//rotate([0,0,8]) cube([20,9.7,3.8],true);