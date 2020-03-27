use <TaipeiSansTCBeta-Bold.ttf>
delta = 0.2;
spacing = 0.85;
intersection(){
    
    translate([6.5,0,0])
    linear_extrude(14)
    offset(delta=delta)
    text("光復香港",
    font="TaipeiSansTCBeta-Bold",
    direction="ttb",
    spacing=spacing);

    translate([0,0,12])
    rotate([0,90,0])
    linear_extrude(14)
    translate([5,0,0])
    offset(delta=delta)
    text("時代革命",
    font="TaipeiSansTCBeta-Bold",
    direction="ttb",
    spacing=spacing);

}