$fn = 50;

height = 7;

difference() {
cube([67.5, 56, height]);
translate ([20,26,0]){
    translate ([15,15,0]) cylinder(  height*2+1, 1.6, 1.6, true );
    translate ([15,-15,0]) cylinder(  height*2+1, 1.6, 1.6, true );
    translate ([-15,15,0]) cylinder(  height*2+1, 1.6, 1.6, true );
    translate ([-15,-15,0]) cylinder(  height*2+1, 1.6, 1.6, true );
    cylinder(  height*2+1, 11.5, 11.5, true );
}
}
translate ([-10,56/2-10/2,0]) difference(){
    cube([10, 10, height]);
    translate ([5,5,0]) cylinder(  height*2+1, 1.4, 1.4, true );
};
translate ([67.5,56/2-10/2,0]) difference(){
    cube([10, 10, height]);
    translate ([5,5,0]) cylinder(  height*2+1, 1.4, 1.4, true );
}