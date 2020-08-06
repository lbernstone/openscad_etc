$fn=100;
hubTop = 1.5;        // hub radius top  
shaftRadius = 0.4;   // motor shaft radius
tipHeight = 1.2;
difference() {
    cylinder(tipHeight,r2=hubTop,r1=hubTop-0.4);
    for (j = [60:120:300]) {
        rotate([0,0,j]) translate([0,-0.2,tipHeight-0.2]) cube([hubTop+0.4,0.4,0.2]);
    }
}
cylinder(3,r=shaftRadius-0.15);