text = "Letter";

difference(){
linear_extrude(height = 25, center = false){
text(text, font = "Impact:style=Bold",spacing =0.8, size = 70);
}


#translate([-10,10,5])  rotate(a=[0,90,0]) 
linear_extrude(height = 2000){
 polygon([[0,0], [-5,0], [-8,40], [-20,70], [0, 70]]);
}
}