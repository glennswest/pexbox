
rsize=37;


module tbody(){
   cylinder(r=rsize+35/2,h=10,$fn=100); 
   translate([0,0,10]) cylinder(r=rsize+5,h=15,$fn=100);   
}

module h5mmthru()
{
    translate([0,0,-28.9]) cylinder(r=5.4/2,h=30,$fn=100); 
    translate([0,0,1]) cylinder(r=9.1/2,h=2.1,$fn=100);
    
}

module h5mmthread()
{
    translate([0,0,-28.9]) cylinder(r=5/2,h=30,$fn=100); 
    translate([0,0,1]) cylinder(r=9.1/2,h=2.1,$fn=100);
    
}

module tholes()
{
 translate([0,rsize+10,0]) h5mmthru();
 rotate([0,0,90]) translate([0,rsize+10,0])  h5mmthru(); 
 rotate([0,0,180]) translate([0,rsize+10,0])  h5mmthru(); 
 rotate([0,0,270]) translate([0,rsize+10,0])  h5mmthru();
    
 rotate([0,0,45]) translate([0,rsize+2,10]) rotate([-90,0,0]) h5mmthread(); 
 rotate([0,0,45+90]) translate([0,rsize+2,10]) rotate([-90,0,0]) h5mmthread();  
 rotate([0,0,45+180]) translate([0,rsize+2,10]) rotate([-90,0,0]) h5mmthread();
 rotate([0,0,45+270]) translate([0,rsize+2,10]) rotate([-90,0,0]) h5mmthread();      
    
    
    
}

module tmount(){
difference(){
  tbody();
  translate([0,0,-1]) cylinder(r=rsize,h=30,$fn=100);
  translate([0,0,7]) tholes();
  }
}

tmount();