 PImage bg; 
int starSize = 0;
final int SCREEN_WIDTH = 500, SCREEN_HEIGHT = 500;
class Stardust {
  int col,size;
  float theta,x,y ;
  double velocity;
  Stardust(int size, double velocity){
    this.velocity = velocity;
    this.size = size;
    this.x = (int)(Math.random()*SCREEN_WIDTH);
    this.y = (int)(Math.random()*SCREEN_HEIGHT);
    this.col = color((int)(Math.random()*256)+1,(int)(Math.random()*256)+1,(int)(Math.random()*256)+1);
  }
  /*void orbit(){
   / this.theta+= 10;
   / this.x = 10.0*cos( theta );
   / this.y = 10.0*sin( theta );
   / translate( width /2, height/2);
   / }
   */
  void arract(){
    if(this.x< SCREEN_WIDTH/2){
      this.x += (int)(Math.random()*7)+velocity;
    } else {
      this.x -= (int)(Math.random()*7)+velocity;
    }
    if(this.y < SCREEN_HEIGHT/2 ){
      this.y += (int)(Math.random()*7)+velocity;
    } else {
      this.y -= (int)(Math.random()*7)+velocity;
    }
    
    
  }
  
  void expandStar(){
    if(this.x == SCREEN_WIDTH/2 && this.y == SCREEN_HEIGHT/2){
      if(starSize >= stardust.length){
        return;
      }
      starSize++;
    }
    return;
  }
  void show(){
    fill(this.col);
    ellipse(this.x,this.y,this.size,this.size);
  }
}

Stardust[] stardust;
void setup(){
  //colorMode(HSB);
  bg = loadImage("catseye_w112.jpg");
  frameRate(20);
  stardust = new Stardust[400];
  size(500,500);
  for(int i = 0; i<stardust.length;i++){
    stardust[i] = new Stardust(10, 1);
  }
  
}
void draw(){
  background(bg);
  for(int i = 0; i<stardust.length;i++){
    stardust[i].show();
    stardust[i].arract();
    //stardust[i].orbit();
    stardust[i].expandStar();
  }
  fill(51,171,249);
  //tint(29);
  
  ellipse(SCREEN_WIDTH/2,SCREEN_HEIGHT/2, starSize/1.5,starSize/1.5);
}
void mouseClicked(){
  for(int i = 0; i<stardust.length;i++){
    stardust[i].x = (int)(Math.random()*SCREEN_WIDTH);
    stardust[i].y = (int)(Math.random()*SCREEN_HEIGHT);
    starSize = 0;
  }
}
