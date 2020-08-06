$fn=360;
magnetd = 5.6;
magnetz = 2;
string = "DAD";
font = "FreeSans";
//font = "FreeSans:style=bold";
font_ht = 12;
wiggle_x = 0.92;  // typ 0.8-1.0
cubex = len(string) * font_ht * wiggle_x;
//cubex = 32 ;
cubey = font_ht + 4;
cubez = magnetz + 2 * 0.8;
difference(){
    cube([cubex,cubey,cubez]);
    translate([cubex/4,cubey/2,0.8]) cylinder(magnetz,d=magnetd);
    translate([cubex*3/4,cubey/2,0.8]) cylinder(magnetz,d=magnetd);
}
translate([cubex/2-0.4,cubey/2,cubez]) linear_extrude(1.2, false) text(string,font_ht,font,halign="center",valign="center");