$fn=40;
module shell(dw,dl,h) {
    l = dl/2;
    w = dw/2;
    ol = l+th;
    ow = w+th;
    difference() {
        hull() {
            translate([-ow,-ol,0]) cylinder(h,o_fil,o_fil);
            translate([-ow,ol,0]) cylinder(h,o_fil,o_fil);
            translate([ow,-ol,0]) cylinder(h,o_fil,o_fil);
            translate([ow,ol,0]) cylinder(h,o_fil,o_fil);
        }
        hull() {
            translate([-w,-l,th]) cylinder(h-th,r=i_fil);
            translate([-w,l,th]) cylinder(h-th,r=i_fil);
            translate([w,-l,th]) cylinder(h-th,r=i_fil);
            translate([w,l,th]) cylinder(h-th,r=i_fil);
        }
    }
}

module snapfit() {
    snap_w = 8;
    snap_h = 4;
    translate([int_length/4+snap_w,int_width/2+i_fil,height]) rotate([0,270,0]) linear_extrude(height=snap_w) polygon([[0,0],[snap_h,0],[snap_h,th*2],[0.7*snap_h,th*2],[0.7*snap_h,th],[0,th]]);
}

module snapfit_side() {
    snapfit();
    mirror([1,0,0]) snapfit();
}

int_length = 42;
int_width = 32;
th = 1.2;
i_fil = 2; //internal fillet radius
o_fil = i_fil + th;
height = 4;

shell(int_length,int_width,height);

stub_ht = 4.2;
snapfit_side();
mirror([0,1,0]) snapfit_side();