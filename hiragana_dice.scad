hiragana_list = [
    [" ","あ","い","う","え","お"],
    ["K","か","き","く","け","こ"],
    ["G","が","ぎ","ぐ","げ","ご"],
    ["S","さ","し","す","せ","そ"],
    ["Z","ざ","じ","ず","ぜ","ぞ"],
    ["T","た","ち","つ","て","と"],
    ["D","だ","ぢ","づ","で","ど"],
    ["N","な","に","ぬ","ね","の"],
    ["H","は","ひ","ふ","へ","ほ"],
    ["B","ば","び","ぶ","べ","ぼ"],
    ["P","ぱ","ぴ","ぷ","ぺ","ぽ"],
    ["M","ま","み","む","め","も"],
    ["Y","や"," ","ゆ"," ","よ"],
    ["R","ら","り","る","れ","ろ"],
    ["W","わ"," "," "," ","を"]
];

size = 10;
word_depth = 1;
font = "MS Gothic:style=Regular";
font_size = 7;
$fn = 50;

for (i = [0:len(hiragana_list)-1]) {
    translate([size*(i%5)*1.5,size*floor(i/5)*1.5,0])
    difference(){
        intersection(){
            cube(size);
            translate([size/2,size/2,size/2])sphere(size-2);
            }
        
        
        #rotate([0,90,90])
        translate([-size/2,-size/2,size-word_depth])
        linear_extrude(word_depth+1)
        text(hiragana_list[i][0],font_size,font,valign="center",halign="center");
        
        #rotate([0,90,0])
        translate([-size/2,size/2,size-word_depth])
        linear_extrude(word_depth+1)
        text(hiragana_list[i][1],font_size,font,valign="center",halign="center");
    
        #rotate([0,180,0])
        translate([-size/2,size/2,-word_depth])
        linear_extrude(word_depth+1)
        text(hiragana_list[i][2],font_size,font,valign="center",halign="center");
        
        #rotate([0,270,0])
        translate([size/2,size/2,-word_depth])
        linear_extrude(word_depth+1)
        text(hiragana_list[i][3],font_size,font,valign="center",halign="center");
        
        #rotate([0,0,0])
        translate([size/2,size/2,size-word_depth])
        linear_extrude(word_depth+1)
        text(hiragana_list[i][4],font_size,font,valign="center",halign="center");
        
        #rotate([90,0,0])
        translate([size/2,size/2,-word_depth])
        linear_extrude(word_depth+1)
        text(hiragana_list[i][5],font_size,font,valign="center",halign="center");        
    
        
    }
}