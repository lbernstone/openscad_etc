$fa = 2;
shaft_dia = 42; //measured, but go small
total_length = 113;
wall = 10; // wall thickness.
nub_r = 3; // interior nub radius 
cap = nub_r; // thickness of end cap
layer_thickness = 3*nub_r; //3*nub_r gives you a nub_r gap b/w layers
layers_to_repeat = 7; //number of layers b/w a nub and another directly below it
in_dia = shaft_dia + 2*nub_r;
out_dia = in_dia + wall;
length = total_length - wall/2 - cap;

difference() {
    cylinder(length+cap,d=out_dia);
    translate([0,0,cap]) cylinder(length,d=in_dia);
}
rings = (length-cap)/layer_thickness;
gap = (length-cap)/rings;
ltr = layers_to_repeat;
for (z = [0:rings]) {
    for (x = [0:30:330]) {        
        translate([cos(x+z*ltr)*in_dia/2,sin(x+z*ltr)*in_dia/2,z*gap+cap]) sphere(nub_r,$fa=8,$fs=0.9);
    }
}

translate([0,0,length+cap]) rotate_extrude() translate([(in_dia+wall/2)/2,0,0]) circle(wall/4);