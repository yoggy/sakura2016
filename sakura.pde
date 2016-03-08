//
// sakura.pde
//
// github:
//     https://github.com/yoggy/sakura
//
// license:
//     Copyright (c) 2016 yoggy <yoggy0@gmail.com>
//     Released under the MIT license
//     http://opensource.org/licenses/mit-license.php;
//
import java.util.*;

List<SakuraParticle> sakuras;

void setup() {
  size(1280, 720);
  
  sakuras = new ArrayList<SakuraParticle>();

  for (int i = 0; i < 100; ++i) {
    SakuraParticle p = new SakuraParticle();
    p.pos.x = random(0, width);
    p.pos.y = random(0, height);
    p.scale = random(0.1, 0.5);
    
    sakuras.add(p);
  }
}

void draw() {
  background(#ffdbe0);

  for(SakuraParticle p : sakuras) {
    p.update();
  }

  for(SakuraParticle p : sakuras) {
    p.draw();
  }
}

class SakuraParticle {
  PVector pos = new PVector();
  PVector v   = new PVector();

  float th = 0.0f;
  float d_th = 0.01f;

  float scale = 1.0f;

  void update() {
    pos.x = pos.x + v.x;
    pos.y = pos.y + v.y;
    th = th + d_th;
  }

  void draw() {
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(th);
    scale(this.scale);

    drawSakura();
    
    popMatrix();
  }
}

void drawSakura() {
  pushMatrix();
  for (int i = 0; i < 5; ++i) {
    rotate((PI * 2) / 5);

    fill(#ffffff);
    noStroke();
    drawSakuraPetal();
  }
  popMatrix();

  pushMatrix();
  for (int i = 0; i < 5; ++i) {
    rotate((PI * 2) / 5);

    noFill();
    stroke(#ffdbe0);
    strokeWeight(3);
    drawSakuraStamen();
  }
  popMatrix();
}

void drawSakuraPetal() {
  drawSakuraPetalHalf();
  scale(-1, 1);
  drawSakuraPetalHalf();
  scale(-1, 1);
}

void drawSakuraPetalHalf() {
  bezier(0, -10, -17, -15, -106, -131, -11, -180 );
  beginShape();
  vertex(0, -10);
  vertex(8, -152);
  vertex(-12, -180);
  endShape();
}

void drawSakuraStamen() {
  line(0, 0, 0, -40);
  ellipse(0, -53, 20, 20);
}

