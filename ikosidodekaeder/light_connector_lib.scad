/*

  light_connector_lib.scad
   
  
  3mm x 120mm
  https://www.greenstuffworld.com/de/flugbasestaebe/600-3-mm-runde-acryl-staebe-transparent.html
  
  15 Jun 2022
    - outerLWDia needs to be increased from the current 4.7mm value. Probably 5.0 could be used
        --> 5.1
    - made height an argument so that the mount connector can be higher
  
*/
$fn=32;

width=14;
//height=10;
length=20;
boxmove=1.3;
edgeDia = 3.02;
outerLWDia = 5.1;
innerLWDia = 4.6;
clipWidth = 10.6;
clipHeight = 10;
clipThinkness = 1.5;
clipXWidth = clipWidth*0.8;
clipXThinkness = width;
clipXOffset = 1; 
//clipOffset = 1+height-clipHeight; /* offset of the clip cutout above ground */
clipDistance = 1.5; /* distance from the edge to the clip=wall between edge and clip */

module mountLug2(height=10) {
  let( clipOffset = 1+height-clipHeight ) { /* offset of the clip cutout above ground */
    let ( w = 8, h = clipXOffset+clipOffset ) {
      difference() {
        union() {
          // translate([0,0,h])
          // rotate([45,0,0])
          // cube([w, h, h], center=true);
          
        
          translate([-w/2, 0, 0])
          cube([w, w-1, h]);
          translate([0,w-1,0])
          cylinder(h=h, d=w);
        }
        translate([0,w-1,0])
        cylinder(d=3, h= 3*h, center=true);
        translate([0,w-1,h*0.6])
        cylinder(d=6, h= h);
      }
    }
  }
}


module light_connector(height = 10) {
  let( clipOffset = 1+height-clipHeight ) { /* offset of the clip cutout above ground */
    difference() {
      translate([-width/2, -width/2+boxmove,0])
      cube([width, length, height]);

      /* LWL cutout */

      translate([0,0,height-5])
      rotate([-90,0,0])
      cylinder(d1=innerLWDia, d2=outerLWDia, h=length-width/2+boxmove+0.01);

      /* touch pad reflection hole */

      translate([0,-width,height-5])
      rotate([-90,0,0])
      cylinder(d=innerLWDia, h=length);

      /* ikosidodekaeder edge cutout */
      
      translate([0,0,height-5])
      rotate([0,90,0])
      cylinder(d=edgeDia, h=width+0.02, center=true);
      
      translate([0,0,-edgeDia*0.2-5])  
      cube([width+0.02, edgeDia*0.9, height*2], center=true);

      /* chamfer to reduce issues with brim */
      
      rotate([45,0,0])
      cube([width+0.02, edgeDia*1.2, edgeDia*1.2], center=true);

      /* battery clip cutout */
      
      translate([-clipWidth/2,-clipThinkness-edgeDia/2-clipDistance,clipOffset])
      cube([clipWidth, clipThinkness, clipHeight]);

      translate([-clipXWidth/2,-clipXThinkness-clipThinkness-edgeDia/2-clipDistance+0.01,clipXOffset+clipOffset])
      cube([clipXWidth, clipXThinkness, clipHeight]);
      

      /* battery clip wire connection */
      translate([0,0,height+0.2])
      rotate([80,0,0])
      cylinder(d=2.2, h=length*2, center=true);

      translate([0,0,height])
      cube([4, length*1.0, 2], center=true);
      
    }
  }
}

module light_mount_connector(height=10) {
  union() {
    light_connector(height);
    translate([0,-width/2+boxmove+1,0])
    rotate([0,0,180])
    mountLug2(height);
  }
}

