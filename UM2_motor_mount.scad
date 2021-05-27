$fn = 50;

height = 7;

difference() {
translate ([-10,0,0]) cube([67.5+20, 56, height]);
translate ([20,26,0]){
    translate ([15.5,15.5,0]) cylinder(  height*2+1, 1.8, 1.8, true );
    translate ([15.5,-15.5,0]) cylinder(  height*2+1, 1.8, 1.8, true );
    translate ([-15.5,15.5,0]) cylinder(  height*2+1, 1.8, 1.8, true );
    translate ([-15.5,-15.5,0]) cylinder(  height*2+1, 1.8, 1.8, true );
    cylinder(  height*2+1, 11.5, 11.5, true );
 }
translate ([-10,56/2-10/2,0])
translate ([5,5,0])
 cylinder(  height*2+1, 1.4, 1.4, true );
 
 translate ([67.5,56/2-10/2,0])
 translate ([5,5,0])
 cylinder(  height*2+1, 1.4, 1.4, true );
}
translate ([-10,56/2-10/2,0]) difference(){
    cube([10, 10, height]);
    translate ([5,5,0]) cylinder(  height*2+1, 1.4, 1.4, true );
};
translate ([67.5,56/2-10/2,0]) difference(){
    cube([10, 10, height]);
    translate ([5,5,0]) cylinder(  height*2+1, 1.4, 1.4, true );
}