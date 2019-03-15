class Box {
  
 private int mass;
 private int size;
 private int x;
 private int y;
 private double v;
  
 // constructor
 public Box(int x, int y, int mass, int size, double v) {
   this.x = x;
   this.y = y;
   this.v = v;
   this.mass = mass;
   this.size = size;
 }
 
 // draws and updates box state
 public void draw() {

   // reverses direction if hits edge
   if (collidingWall()) v*= -1;
 
   // adds velocity to x
   x += v;
   x = constrain(x, 0, width - size);
   
   //draws box
   fill(200);
   rect(x,y,size,size);
   
   // draws mass text 
   textAlign(CENTER, CENTER);
   fill(0);
   textSize(20);
   text(mass, x + (size / 2), y + (size / 2));
 }
 
 // calculates final velocity for other box
 public double elastic(Box other) {
   
   final double sum = mass + other.mass;
   final double vf = ((mass - other.mass) / sum * v) + ((2 * other.mass / sum) * other.v);
  
  return vf;
}
 
 // returns true if colliding with another box.
 // TODO: Make this snap both boxes to their edges to put them in a non colliding state.
 //       this will fix many problems with this program.
 public boolean isColliding(Box other) {
   return x <= other.x + other.size && x + size >= other.x;
 }
 
 // returns true if colliding with wall
 public boolean collidingWall() {
   return x <= 0 || x + size >= width;
 }
 
 // sets velocity
 public void setV(double v) {
   this.v = v;
 }
   
}
