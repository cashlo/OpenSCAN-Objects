use <C:\Users\cashr\Downloads\Best10-FONT\Best10-FONT\BestTen-CRT.otf>



difference(){
    union(){
        peach();
        words();
    }

    magnet_holes();
    
}


//mini_version();

color("Green")
translate([86,96,5])
linear_extrude(0.5)
//offset(delta=3)
import("C:/Users/cashr/Desktop/peach_leave.svg");


module mini_version(){
    
    peach();
    words(false);
}

module magnet_holes(){
    cylinder(3, 6.5/2, 6.5/2);
    
        translate([225,0,0.6])
    #magnet_hole();
    
    translate([160,0,0.6])
    #magnet_hole();
    
    translate([90,50,0.6])
    #magnet_hole();
    
    translate([290,50,0.6])
    #magnet_hole();
    
    translate([60,100,0.6])
    #magnet_hole();
    
    translate([325,100,0.6])
    #magnet_hole();
    
    translate([60,155,0.6])
    #magnet_hole();
    
    translate([325,155,0.6])
    #magnet_hole();
    
    translate([90,200,0.6])
    #magnet_hole();
    
    translate([295,200,0.6])
    #magnet_hole();
    
    translate([160,225,0.6])
    #magnet_hole();
    
    translate([230,225,0.6])
    #magnet_hole();
}


module magnet_hole(){
    cylinder(3, 6.5/2, 6.5/2);
}

module peach(){
color("White")
translate([0,30,0])
linear_extrude(5)
//offset(delta=3)
text("🍑", size=200, font="Segoe UI Emoji:style=Regular"); 

color("Grey")
translate([0,30,0])
linear_extrude(0.3)
difference(){    
hull()    
text("🍑", size=200, font="Segoe UI Emoji:style=Regular"); 

offset(delta=2)    
text("🍑", size=200, font="Segoe UI Emoji:style=Regular"); 

offset(delta=2)
translate([0,-30,0])    
projection()    
words();    
}
}





module words(small_words = true){
translate([70,165,0])
rotate([0,0,-30])
offset_text("もも", 11, 55);

translate([95,61,0])
rotate([0,0,-30])
offset_text("推し", 11, 55);

if(small_words){
translate([228,14,0])
rotate([0,0,44])
offset_text("#大河ももしか勝たん", 6, 12, 0.9);

translate([280,89,0])
rotate([0,0,44])
offset_text("#ﾓﾓｽｷ部", 6, 13);
}
}

module offset_text(text, offset, size, spacing=0.95) {

color("white")
linear_extrude(4)
text(text, size=size, spacing=spacing,
, font="BestTen\\-CRT:style=Bold");

color("pink")
linear_extrude(2)
offset(delta=offset)    
text(text, size=size, spacing=spacing,
, font="BestTen\\-CRT:style=Bold");
    
}