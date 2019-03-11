class ExplosionAnimation{
  float age ;
  float duration ;
  color colour ;
  void update(){
    
  }
}

class ExplosionParticle{
  PVector pos ;
  PVector speed ;
  PVector acc ;
  float r ;
  color colour ;
  //Trail trail ;
  
  ExplosionParticle( float x , float y , float xSpeed , float ySpeed , float r , color col ){
    pos = new PVector( x , y ) ;
    speed = new PVector( xSpeed , ySpeed ) ;
    acc = new PVector( 0 , 0.05 ) ;
    this.r = r ;
    colour = col ;
    //trail = new Trail( 0.3 ) ;
  }
  
  void show(float t){
    colorMode( RGB , 255 , 255 , 255 , 100 ) ;
    float alpha = map(t,0,1,100,0) ;
    noStroke() ;
    fill( colour , alpha ) ; 
    ellipse( pos.x , pos.y , 2*r , 2*r ) ;
  }
  
  void move(){
    speed.add(acc) ;
    pos.add(speed) ;
  }
  
  void update(float t){
    show(t) ;
    move() ;
    //trail.update() ;
    //trail.add( pos.x , pos.y , r , colour ) ;
  }
}

class ExplosionAnimation1 extends ExplosionAnimation{
  ArrayList<ExplosionParticle> particles ;
  float angleRange = TAU*0.7 ;
  float initialSpeed = 4 ;
  float particleRadius = 4 ;
  
  ExplosionAnimation1(float x , float y , color colour){
    age = 0 ;      //in seconds
    duration = 1.5 ; //in seconds
    particles = new ArrayList<ExplosionParticle>() ;
    for( int k = 0 ; k < 30 ; ++ k ){
      float agl = map( k , 0 , 29 , -angleRange , angleRange) -TAU/4 ;
      float speed = initialSpeed*map( noise(k*0.003) , 0 , 1 , 0.8 , 1.2) ;
      particles.add( new ExplosionParticle( x , y , speed*cos(agl) , speed*sin(agl) , particleRadius , colour ) ) ;
    }
  }
  
  void update(){
    float t = age / duration ;
    for( int k = particles.size()-1 ; k >= 0; k-- ){
      particles.get(k).update(t) ;
    }
    age += 1./framePerSec ;
  }
}

class ExplosionAnimation2 extends ExplosionAnimation{
  float rGrowthSpeed = 40 ;
  float xCenter ;
  float yCenter ;
  
  ExplosionAnimation2( float x , float y , color colour ){
    age = 0 ;      //in seconds
    duration = 1.5 ; //in seconds
    xCenter = x ;
    yCenter = y ;
    this.colour = colour ;
  }
  
  void update(){
    float t =  age / duration ;
    colorMode(RGB,255,255,255,100) ;
    stroke( colour , (1-t)*100 ) ;
    noFill() ;
    strokeWeight(4) ;
    ellipse( xCenter , yCenter , rGrowthSpeed*age*2 , rGrowthSpeed*age*2 ) ;
    strokeWeight(1) ;
    age += 1./framePerSec ;
  }
}

class ExplosionAnimation3 extends ExplosionAnimation{
  float maxRGrowthSpeed = 25 ;
  float minRGrowthSpeed = maxRGrowthSpeed*2./5 ;
  float xCenter ;
  float yCenter ;
  float agl = random(TAU) ;
  int nbBranches =  int(random(5,8)) ;
  
  ExplosionAnimation3( float x , float y , color colour ){
    age = 0 ;      //in seconds
    duration = 1.5 ; //in seconds
    xCenter = x ;
    yCenter = y ;
    this.colour = colour ;
  }
  
  void update(){
    float t =  age / duration ;
    colorMode(RGB,255,255,255,100) ;
    stroke( colour , (1-t)*100 ) ;
    noFill() ;
    strokeWeight(4) ;
    beginShape() ;
    float minR = minRGrowthSpeed*age*2 ;
    float maxR = maxRGrowthSpeed*age*2 ;
    for( int k = 0 ; k < nbBranches ; ++k ){
      vertex( xCenter + minR*cos( 2*k* TAU/2/nbBranches+agl) , yCenter +minR*sin( 2*k* TAU/2/nbBranches+agl) ) ;
      vertex( xCenter + maxR*cos( (2*k+1)* TAU/2/nbBranches+agl) , yCenter +maxR*sin( (2*k+1)* TAU/2/nbBranches+agl) ) ;
    }
    endShape(CLOSE) ;
    strokeWeight(1) ;
    age += 1./framePerSec ;
  }
}
