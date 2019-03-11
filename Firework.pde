class Firework{
  Rocket rocket ;
  ExplosionAnimation explosion ;
  boolean hasExploded = false ;
  color colour ;
  
  Firework( float xStart , float yStart , float xEnd , float yEnd , float speed , float r , color colour ){
    rocket = new Rocket( xStart , yStart , xEnd , yEnd , speed , r , color(#FFC636) ) ;
    int explType = 1+int( random( 2) ) ;
    switch( explType ){
      case 0 :
        explosion = new ExplosionAnimation1( xEnd , yEnd  , colour ) ;
        break ;
      case 1 :
        explosion = new ExplosionAnimation2( xEnd , yEnd  , colour ) ;
        break ;
      case 2 :
        explosion = new ExplosionAnimation3( xEnd , yEnd  , colour ) ;
        break ;
    }
    this.colour = colour ;
  }
  
  void update(){
    //Rocket
    if( !hasExploded ){
      rocket.update() ;
      if( rocket.hasReachedDestination ){
        hasExploded = true ;
        imageSmokeBg.beginDraw() ;
        imageSmokeBg.noStroke() ;
        imageSmokeBg.colorMode( RGB,255,255,255,100 ) ;
        imageSmokeBg.fill( red(colour) , green(colour) , blue(colour) , 20 ) ;
        imageSmokeBg.ellipse( rocket.pos.x , rocket.pos.y , 2 , 2 ) ;
        imageSmokeBg.endDraw() ;
      }
    }
    //Explosion
    else{
      explosion.update() ;
    }
  }
}
