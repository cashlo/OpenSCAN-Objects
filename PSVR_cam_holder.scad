thickness = 2;
width = 10;

// Thickness of TV from the front to the back
TV_thickness = 45;

// Length of the "finger" holding on to the TV and the camera
finger_length = 10;

// Thickness of the camera, this is the size of the V1 camera
cam_thickness = 27.4;

// Lean back angle for the arm standing up the camera, increase this to push the camera back
arm_angle = 30;

// Length of the arm standing up the camera, increase this to have the camera stand higher from the TV 
arm_length = 100;

// Length of the foot down the back of the TV
foot_length = 100;

// Down tilt angle for the camera, change this to fit your play space
cam_angle = 0;



/* [Hidden] */
support_length = sqrt(
pow(arm_length*sin(arm_angle)+cam_thickness/2*cos(cam_angle)+thickness/2,2)+
pow(arm_length*cos(arm_angle)+cam_thickness/2*sin(cam_angle)+foot_length-thickness/2,2));
support_angle = atan2(
arm_length*sin(arm_angle)+cam_thickness/2*cos(cam_angle)+thickness/2,
arm_length*cos(arm_angle)+cam_thickness/2*sin(cam_angle)+foot_length-thickness/2
);



cube([TV_thickness+thickness,thickness,width]);
cube([thickness,finger_length+thickness,width]);

translate([TV_thickness+thickness,0,0])
cube([thickness,foot_length,width]);

translate([TV_thickness+thickness*2,thickness,0])
rotate([0,0,180+arm_angle])
cube([thickness,arm_length,width]);


translate([sin(arm_angle)*arm_length+TV_thickness+thickness*3/2,-cos(arm_angle)*arm_length,0])
rotate([0,0,-cam_angle])
translate([-cam_thickness/2,0,0]){
    cube([cam_thickness,thickness,width]);
    translate([-thickness,-finger_length,0])
    cube([thickness,thickness+finger_length,width]);
    translate([cam_thickness,-finger_length,0])
    cube([thickness,thickness+finger_length,width]);
}

translate([TV_thickness+thickness*2,foot_length,0])
rotate([0,0,support_angle+180])
cube([thickness,support_length,width]);