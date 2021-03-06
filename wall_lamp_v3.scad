gr = (1+sqrt(5))/2;
h = 200;
w = h/gr;
br = 5;

difference(){
intersection(){
    #translate([-w/2,-w/2,0]) difference(){
        frame();
        cube([w,w,h]);
        translate([w/2,w/2,-5]) cylinder(  10, d1=40.4, d2=40.4);
    //#translate([w/2,w/2,0])
    //translate([0,0,2*h-br*1.5])
    //rotate([180,0,0]) translate([-h,-h,0]) pyramid(h*2,h*2,h*2);
    }
translate([0,0,3*h-br*1.5-w])
rotate([180,0,0]) translate([-h,-h,0]) pyramid(h*2,h*2,h*2);
}

}



 
 module pyramid(w, l, h) {
	mw = w/2;
	ml = l/2;
	polyhedron(points = [
		[0,  0,  0],
		[w,  0,  0],
		[0,  l,  0],
		[w,  l,  0],
		[mw, ml, h]
	], faces = [
		[4, 1, 0],
		[4, 3, 1],
		[4, 2, 3],
		[4, 0, 2],
		//base
		[0, 1, 2],
		[2, 1, 3]
	]);
}


module frame() {
    face();
    rotate([0,0,90]) face();
    translate([0,w,0]) face();
    rotate([0,0,90]) translate([0,-w,0]) face();

    translate([0,0,-br/2]) cube([w,w,1]);    
}



module face() {
    translate([0,-br/2,0]){
        translate([0,0,-br/2]) cube([w,br,br]);
        translate([0,0,h-br/2]) cube([w,br,br]);
        translate([0,0,w-br/2]) cube([w,br,br]);
        translate([-br/2,0,-br/2]) cube([br,br,h+br]);
        translate([w-br/2,0,-br/2]) cube([br,br,h+br]);
    }    
}
