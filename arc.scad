/*
Plot a 2D or 3D arc from 0.1 to ~358 degrees.

Set Width of drawn arc, Radius, Thickness, resolution ($fn) and height for the 3D arc. Arc is centered around the origin

By tony@think3dprint3d.com
GPLv3

*/

2D_arc(w=10,r=20,deg=270,fn=200);

module 2D_arc(w, r, deg=90,fn = 100 ) {
	render() {
		difference() {
			// outer circle
			circle(r=r+w/2,center=true,$fn=fn);
			// outer circle
			circle(r=r-w/2,center=true,$fn=fn);

		//remove the areas not covered by the arc
		translate([sin(90-deg/2)*((r+w/2)*2),
						-sin(deg/2)*((r+w/2)*2)])
			rotate([0,0,90-deg/2])
				translate([((r+w/2))-sin(90-(deg)/4)*((r+w/2)),
							((r+w/2))*2-sin(90-(deg)/4)*((r+w/2))])
					square([sin(90-deg/4)*((r+w/2)*2),
								sin(90-deg/4)*((r+w/2)*2)],center=true);
		translate([-sin(90-(deg)/2)*((r+w/2)*2),
						-sin(deg/2)*((r+w/2)*2)])
			rotate([0,0,-(90-deg/2)])
			  translate([-((r+w/2))+sin(90-(deg)/4)*((r+w/2)),
							((r+w/2))*2-sin(90-(deg)/4)*((r+w/2))])
					square([sin(90-deg/4)*((r+w/2)*2),
								sin(90-deg/4)*((r+w/2)*2)],center=true);
		}
		//line to see the arc
		//#translate([-((r)*2)/2, sin((180-deg)/2)*(r)]) square([(r+w/2)*2+1,0.01]); 
	}
}

module 3D_arc(w, r, deg, h,fn) {
	linear_extrude(h)
			2D_arc(w, r, deg,fn);

}