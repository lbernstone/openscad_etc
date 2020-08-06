/*
From: Ekobots Innovation Ltda - www.ekobots.com
by: Juan Sirgado y Antico - www.jsya.com.br
Program Helix - 2015/02/24
All rights reserved 2015
*/
scale([2.5,2.5,2.5]) {
    helix();
}
module animate_helix()
{
   //Animate FSP: 60, Steps:  60 fast 
   //Animate FSP: 60, Steps: 120 normal 
   //Animate FSP: 60, Steps: 180 slow
   z = $t*360;
   translate([0,0,0]) rotate([0,0,z]) 
      mirror([0,0,0]) helix();
}
module helix
(
bladeRadius = 12.5,  // radius of blades
numberBlades = 3,  // number of blades
bladeThick = 0.2,  // thickness of blades
bladeWidth = 5,   // blade width at center
startAngle = 30,   // twist of blade from hub 
hubTop = 1.5,        // hub radius top  
hubBottom = 2.5,    // hub radius bottom
hubHeight = 2.5,    // hub Height   
shaftRadius = .4,   // motor shaft radius
borderEdge = 0,    // propeller border edge
facesNumber = 100,  // resolution for objects
bladeTip = 0       // blade tip(1=Yes, 0=No)
)
// ATTENTION 
// The hub height must to be equal blades height  
// if not, you need add a support for all
{// start of helix
   difference()
   {// start of difference
      intersection()
      {// start of intersection
         union()
         {// start of union
         // create the propeller blades
         blades(numberBlades,
                bladeRadius,
                bladeThick,
                bladeWidth,
                startAngle,
                borderEdge,
                facesNumber,
    bladeTip);
         // hub for shaft
         translate([0,0,0]) 
         cylinder(h=hubHeight,r1=hubBottom,r2=hubTop,
                  center=true,$fn=facesNumber);
         }// end of union
      // intersection between the objects create the rounded edges
      translate([0,0,0])
      cylinder(h=hubHeight,r=(bladeRadius*2)-borderEdge,
               center=true,$fn=facesNumber);
      }// end of intersection
   // remove center hub for shaft
   translate([0,0,0])
   cylinder(h=hubHeight+0.2,r=shaftRadius,
            center=true,$fn=facesNumber);
   }// end of difference
    difference() {
        translate([0,0,-hubHeight]) cylinder(hubHeight,r=shaftRadius*2,$fn=100);
        translate([0,0,-hubHeight]) cylinder(hubHeight,r=shaftRadius,$fn=100);
    }
/*
   intersection() {
    for (j = [60:120:300]) {
        rotate([0,0,j]) translate([shaftRadius,-0.2,hubHeight/2]) cube([hubTop,0.4,0.2]);
    }
        cylinder(h=hubHeight+0.4,r1=hubBottom,r2=hubTop-0.08,center=true,$fn=facesNumber);
    }// end of intersection
*/
}// end of helix
module blades
(
numberBlades,
bladeRadius,
bladeThick,
bladeWidth,
startAngle,
borderEdge,
facesNumber,
bladeTip
)
{// start of blades
   // create the propeller blades
   for (z=[0:360/numberBlades:360-(360/numberBlades)])
   rotate([0,0,z])
   {// start of for to create each blade 
      translate([bladeRadius,0,0]) rotate([90,90-startAngle,90])
      scale([(bladeThick/bladeWidth),(bladeWidth/bladeRadius/2),1])
      sphere(bladeRadius,center=true,$fn=facesNumber);
   }// end blade loops
}// end of blades

