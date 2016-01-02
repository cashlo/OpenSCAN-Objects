


module coin_holder() {
    
}

module coin_slot(diameter, height, stack, window, holder) {
cylinder(h=height*stack, d=diameter, center=true);
cylinder(h=height*stack+20, d=window, center=true);
translate([-diameter/2,holder,-height*stack/2]) 
    cube([diameter, diameter/2-holder, height*stack], false);
}