/*
    collection of tube ships for train tube track
    
    3d print without brim or raft (but with skirt!)
*/
include <train_tube_track.scad>;


for( j=[0:4] ) {
    translate([0, j*ship_length*1.5, 0])
    for( i=[0:6] ) {
        translate([i*ship_width*1.5, 0, 0])
        rotate([0,180,0])
        ttt_ship_body_m_4();
    }
}
for( j=[0:4] ) {
    translate([-ship_width*1.5, j*ship_length*1.5, 0])
    rotate([0,180,0])
    ttt_ship_body_m_3();
}
