ArrayList<Integer> data  = new ArrayList<Integer>();
ArrayList<Integer> data2 = new ArrayList<Integer>();
ArrayList<Integer> gap   = new ArrayList<Integer>();

int max = 0;
int min = 0;
int gmax = 0;
int streak = 0;
boolean streakT = true;

int r1 = -100;
int r2 = 400;
int r3 = -100;
int r4 = 400;

int curr = 0;
int curr2 = 0;

void setup() {
   size(600,600);
   frameRate(5);
   
   data.add(0);
   data2.add(0);
}

void draw() {
   background(0);
   
   textSize(20);
   stroke(255);
   
   fill(255);
   text("Gap: " + numberFormat(abs(curr - curr2)), 20, 90);
   text("Streak: " + numberFormat(streak), 20, 120);
   
   // load values into an array
   final int[] val1 = new int[data.size()];
   for (int i = 0; i < val1.length; i++) {
      val1[i] = data.get(i);
   }
   
   final int[] val2 = new int[data2.size()];
   for (int i = 0; i < val2.length; i++) {
      val2[i] = data2.get(i);
   }
   
   final int[] val3 = new int[gap.size()];
   for (int i = 0; i < val3.length; i++) {
      val3[i] = gap.get(i);
   }
   
   // draw graph
   
   int px = 0;
   int py = height;
   
   stroke(0,255,255);
   
   if (curr > curr2) {
      fill(255,255,0);
      if (!streakT) streak = 0;
      streakT = true;
   } else {
      fill(255);
   }
   text(numberFormat(curr) + " (" + numberFormat(r1) + " " + numberFormat(r2) + ")", 20, 30);
   
   final int SCALE = width / data.size();
   for (int i = 0; i < data.size(); i++) {
      
      final int dmax = max(val1);
      final int dmin = min(val1);
      if (dmax > max) max = dmax;
      if (dmin > min) min = dmin;
      
      final int y = (int) map(data.get(i), min, max * 1.15, height, 0);
      final int x = i * SCALE;
      
      line(x,y,px,py);
      
      px = x;
      py = y;
   }
   
   px = 0;
   py = height;
   
   stroke(255,0,0);
   
   if (curr2 > curr) {
      fill(255,255,0);
      if (streakT) streak = 0;
      streakT = false;
   } else {
      fill(255);
   }
   text(numberFormat(curr2)  + " (" + numberFormat(r3) + " " + numberFormat(r4) + ")", 20, 60);
   
   for (int i = 0; i < data2.size(); i++) {
      
      final int dmax = max(val2);
      final int dmin = min(val2);
      if (dmax > max) max = dmax;
      if (dmin > min) min = dmin;
      
      final int y = (int) map(data2.get(i), min, max * 1.15, height, 0);
      final int x = i * SCALE;
      
      line(x,y,px,py);
      
      px = x;
      py = y;
   }
   
   // gap
   stroke(255,255,0);
   
   px = 0;
   py = height;
   
   for (int i = 0; i < gap.size(); i++) {
      
      final int dmax = max(val3);
      if (dmax > gmax) gmax = dmax;
      
      final int y = (int) map(gap.get(i), 0, gmax * 2, height, 0);
      final int x = i * SCALE;
      
      line(x,y,px,py);
      
      px = x;
      py = y;
   }
   
   if (true) {
      curr += floor(random(r1, r2));
      curr2 += floor(random(r3, r4));
      data.add(curr);
      data2.add(curr2);
      gap.add(abs(curr - curr2));
      
      r1 += random(-100,25);
      r2 += random(-300,500);
      r3 += random(-100,25);
      r4 += random(-300,500);
   }
   
   if (data.size() > width) {
      data.remove(0);
      data2.remove(0);
      gap.remove(0);
   }
   
   //if (curr > curr2) {
   //   if (!streakT) streak = 0;
   //   streakT = true;
   //} else {
   //   if (streakT) streak = 0;
   //   streakT = false;
   //}
   
   streak += 1;
}

String numberFormat(int num) {
   
   boolean signed = num < 0;
   
   num = abs(num);

   String formatted = "";
   
   int index = 0;
   while (num > 0) {
   
      int curr = num % 10;
      
      formatted = curr + formatted;
      
      if (index == 2 && num > 9) {
      
         formatted = "," + formatted;
         
         index = -1;
      }
      
      index += 1;
      num /= 10;
   }
   
   if (signed) {
      formatted = "-" + formatted;
   }
   
   return formatted;
}
