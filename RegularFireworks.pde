ArrayList<Firework> fireworks ;
PImage image ;
float hLine ;
float skyImLength ;
float skyImHeight ;
float skyImTopY ;
float skyImBotY ;
float skyImLeftX ;
float skyImRightX ;
PGraphics imageSmokeBg ;
PGraphics rocketBuffer ;

int framePerSec = 25 ;
void setup(){
  image = loadImage( "slip.png" ) ;
  fullScreen() ;
  imageSmokeBg = createGraphics( width , height ) ;
  rocketBuffer = createGraphics( width , height ) ;
  skyImTopY = height * 0.1 ;
  skyImBotY = height * 0.5 ;
  skyImHeight = skyImBotY - skyImTopY ;
  skyImLength = skyImHeight / image.height * image.width ;
  skyImLeftX = width/2 - skyImLength/2 ;
  skyImRightX = width/2 + skyImLength/2 ;
  frameRate(framePerSec) ;
  fireworks = new ArrayList<Firework>() ;
}

void draw(){
  //Screen trail
  colorMode(RGB,255,255,255,100) ;
  noStroke() ;
  fill(0,0,0,20) ;
  rect(0,0,width,height) ;
  //Rockets buffer trail
    //rocketBuffer.beginDraw() ;
    //rocketBuffer.colorMode(RGB,255,255,255,100) ;
    //rocketBuffer.noStroke() ;
    //rocketBuffer.fill(0,0,0,50) ;
    //rocketBuffer.rect(0,0,width,height) ;
    //rocketBuffer.endDraw() ;
    //image(rocketBuffer,0,0) ;
  image(imageSmokeBg,0,0) ;
  for( int k = fireworks.size()-1 ; k >= 0 ; --k ){
    Firework firework = fireworks.get(k) ;
    firework.update() ;
    if( firework.explosion.age >= firework.explosion.duration ){
      fireworks.remove(k) ;
    }
  }
  if( frameCount/framePerSec < 23 && random(1) < 0.15 ){
    for( int k = 0 ; k < 8 ; ++k ){
      color colour = color(255) ;
      int i = 0 ;
      int j = 0 ;
      while( red(colour) + blue(colour) > 350 ){
        j = int(random( image.width )) ;
        i = int(random( image.height )) ;
        colour = image.get( j , i ) ;
      }
      //int j = int(random( image.width )) ;
      //int i = int(random( image.height )) ;
      //color colour = image.get( j , i ) ;
      
      float x = map( j , 0 , image.width , skyImLeftX , skyImRightX ) ;
      float y = map( i , 0 , image.height , skyImTopY , skyImBotY ) ;
      float speed = random(150,300) ;
      fireworks.add( new Firework( random(width) , height , x , y , speed , 2 , colour ) ) ;
    }
  }
  //saveFrame("film/#####.tiff") ;
}
