use<C:\Users\cashr\Downloads\OnlineWebFonts_COM_2daeb83fd1abb3e70f25cd194c032d21\Radikal Bold\Radikal Bold.ttf>;

offset = 4;
height = 5;
gap = 0;
logo_offset = 173;

difference(){
    union(){
        name();

        translate([-offset,offset,offset]) name();


        #translate([logo_offset,-5,-51])
        scale([0.3,0.3,1])
        intersection(){
            translate([0,0,55])cube([100,100,height]);
            surface(file = "itsanef.png");
        }

        #translate([logo_offset+offset,-5-offset,-51-offset])
        scale([0.3,0.3,1])
        intersection(){
            translate([0,0,55])cube([100,100,height]);
            surface(file = "itsanef.png");
        }
    }
    //translate([0,-30,(height+offset-gap)/2])cube([300,60,gap]);
}

module name(){
linear_extrude(height)
text("Hélène", font="Radikal:style=Bold",spacing=0.80,size=50);   
}