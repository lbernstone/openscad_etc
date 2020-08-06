block_text = "ELLA";
//block_text = "E\u2618";
layer_height = 0.1; // The letters "float" above the block so that it does a solid fill
left_wiggle = -1.1; //Adjust to center the letters properly
font_kern = 0.9; //ratio of width to height
font = "Ubuntu Bold:style=bold";
letter_size = 20;
block_height = 6.1;
text_height = 2.5;
border = 2;
difference() {
    translate([0,0,block_height/2]) cube([len(block_text)*letter_size*font_kern+2*border,letter_size+2*border,block_height],true);
    // The pocket is based on a 10x20x3.75mm magnet
    translate([-11,-6.5,0.8]) cube([22,13,3.8]);
    rotate([0,0,20]) translate([-10.1,-5.1,0]) cube([20.2,10.2,4.9]);
}
translate([left_wiggle,0,block_height+2*layer_height]) linear_extrude(height=text_height) text(block_text, size = letter_size, font = font, halign = "center", valign = "center", $fn = 40);