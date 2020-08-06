in=25.4;
module piece1() {
    linear_extrude(5) polygon([[0,10],[in,10],[in,0],[11/2*in,0],[11/2*in,in],[11/2*in-4,in-4],[11/2*in-4,in+8],[11/2*in,in+4],[11/2*in,2.4*in],[11/2*in-4,2.4*in-4],[11/2*in-4,2.4*in+8],[11/2*in,2.4*in+4],[11/2*in,(3.75+3.375)/2*in],[0,3.75*in]]);
    translate([11/2*in-4,0,5/2]) cube([4,3.375*in,5/2]);
}
module piece2() {
    difference() {
        linear_extrude(5) polygon([[11/2*in,(3.75+3.375)/2*in],[11*in,3.375*in],[11*in,10],[10*in,10],[10*in,0],[11/2*in,0],[11/2*in,in],[11/2*in-4,in-4],[11/2*in-4,in+8],[11/2*in,in+4],[11/2*in,2.4*in],[11/2*in-4,2.4*in-4],[11/2*in-4,2.4*in-4],[11/2*in-4,2.4*in+8],[11/2*in,2.4*in+4]]);
        translate([11/2*in-4.05,0,5/2]) cube([4,3.375*in,5/2]);
    }  
}
module piece3() {
    difference() {
        linear_extrude(5) polygon([[0,0],[0,1.5*in],[6*in,1.5*in],[6*in,0.75*in+4],[6*in+4,0.75*in+8],[6*in+4,0.75*in-4],[6*in,0.75*in],[6*in,0]]);
        translate([0,0,1.2]) cube([10,1.5*in,5-1.2]);
    }    
    translate([6*in,0,5/2]) cube([4,1.5*in,5/2]);
}    
module piece4() {
    difference() {
        linear_extrude(5) polygon([[6*in,0],[12*in,0],[12*in,1.5*in],[6*in,1.5*in],[6*in,0.75*in+4],[6*in+4,0.75*in+8],[6*in+4,0.75*in-4],[6*in,0.75*in]]);
        translate([6*in-0.05,0,5/2]) cube([4.05,1.5*in,5/2]);
        translate([12*in-10,0,0]) cube([10,10,5]);
    }  
}
//piece1();
//piece2();
//piece3();
piece4();