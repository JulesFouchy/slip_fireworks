class Trajectory{
  PVector[] traj ;
  float dist ;
  
  Trajectory( float x1 , float y1 , float x2 , float y2 ){
    int N = 500 ;
    //Trajectory creation
    traj = new PVector[N] ;
    for( int k = 0 ; k < N ; ++k ){
      float t = (float) k / N ;
      float agl = 15*TAU *t ;
      float rotRadius = 5*(1+noise( t*10 ))/2 ;
      traj[k] = new PVector( x1*(1-t) + x2*t +rotRadius*cos(agl), y1*(1-t) + y2*t +rotRadius*sin(agl)) ;
    }
    //Distance calculation
    dist = 0 ;
    for( int k = 0 ; k < N-1 ; ++k ){
      dist += PVector.dist( traj[k] , traj[k+1] ) ;
    }
  }
}
