include <BOSL2/std.scad>


difference(){
    cuboid([50,50,50], chamfer=2);
    
    #fwd(20)
    cuboid([40.2,12.2,40.2], anchor=FRONT);
    
    ycyl(l=40, d=42);
    cuboid(200, anchor=BOT);
}