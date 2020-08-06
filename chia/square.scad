$fn=10;

difference() {
    cube([40,40,60]);
    for (x = [2.5:2.5:37.5], y = [2.5:2.5:37.5])
      translate([x,y,0]) cylinder(60,d=0.8);
    for (x = [1.25:2.5:38.75], y = [1.25:2.5:38.75])
      translate([x,y,0]) cylinder(60,d=0.8);
}

/*
difference() {
    cube([40,40,60]);
    translate([1.9,1.9,0]) cube([40-1.9*2,40-1.9*2,60]);
}
for (x = [2.5:2.5:37.5], y = [2.5:2.5:37.5])
    translate([x,y,0]) cylinder(60,d=1.9);
for (x = [1.25:2.5:38.75], y = [1.25:2.5:38.75])
    translate([x,y,0]) cylinder(60,d=1.9);
*/