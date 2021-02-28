/*

  show_eject.scad
  
  (c) olikraus@gmail.com

  This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.

  This is an extended scad file, not intended for 3d printing.
  
*/


include <card_compare_machine.scad>;

translate([0,(card_height+card_gap+2*wall)/2,house_height])
rotate([0,0,180])
tray();

eject_house(true);
