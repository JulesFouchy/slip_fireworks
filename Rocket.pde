class Rocket{
  PVector pos ;
  Trajectory traj ;
  float speed ;   //in pixels per second
  float age = 0 ; //in seconds
  color colour ;
  //Trail trail ;
  float r ;
  boolean hasReachedDestination = false ;
  
  
  Rocket( float xStart , float yStart , float xEnd , float yEnd , float speed , float r , color col ){
    pos = new PVector( xStart , yStart ) ;
    traj = new Trajectory( xStart , yStart , xEnd , yEnd ) ;
    this.speed = speed ;
    colour = color( col , 150 ) ;
    this.r = r ;
    //trail = new Trail( 0.5 ) ;
  }
  
  void show(){
    int k = int(age*speed / traj.dist * traj.traj.length) ;
    if( k < traj.traj.length ){
      pos.set( traj.traj[k].x , traj.traj[k].y ) ;
      noStroke() ;
      fill( colour ) ;
      ellipse(pos.x , pos.y , r*2 , r*2 ) ;
      //rocketBuffer.beginDraw() ;
      //rocketBuffer.noStroke() ;
      //rocketBuffer.fill( colour ) ;
      //rocketBuffer.ellipse(pos.x , pos.y , r*2 , r*2 ) ;
      //rocketBuffer.endDraw() ;
    }
    else{
      hasReachedDestination = true ;
    }
  }
  
  void update(){
    //trail.update() ;
    show() ;
    age += 1./framePerSec ;
    //trail.add( pos.x , pos.y , r , colour ) ;
  }
}
