class Snake {
  Food food;
  String direction = "right";
  int x;
  int y;
  int score = 0;
  ArrayList<SnakePart> snakeParts = new ArrayList<SnakePart>();
  
  Snake(Food foodNew) {
    food = foodNew;
  }
  
  void init() {
    x = int(random(2, 31));
    y = int(random(2, 26));
    x = x*20;
    y = y*20;
    snakeParts.clear();
    snakeParts.add(new SnakePart(x, y, "grey"));
    food.generate();
  }
  
  void keyEvents() {
    if(keyPressed) {
      if(key == 'w') {
        if(direction != "down") {
          direction = "top";
        }
      } else if(key == 'd') {
        if(direction != "left") {
          direction = "right"; 
        }
      } else if(key == 's') {
        if(direction != "top") {
          direction = "down";
        }
      } else if(key == 'a') {
        if(direction != "right") {
          direction = "left";
        }
      }
    }
  }  
  
  float getDistanceBetweenNodes(float node1X, float node1Y, float node2X, float node2Y) {
    float distance = abs((node1X-node2X)) + abs((node1Y-node2Y));
    return distance/20;
  }
  
  void move() {
    for(int x = snakeParts.size()-1; x >= 0; x--) {
      if(x >= 1) {
        SnakePart snakePart = snakeParts.get(x);
        SnakePart previousSnakePart = snakeParts.get(x-1);
        snakePart.x = previousSnakePart.x;
        snakePart.y = previousSnakePart.y;
      }
    }
    SnakePart head = snakeParts.get(0);
    if(direction == "top") {
      head.y -= 20;  
    } else if(direction == "right") {
      head.x += 20;
    } else if(direction == "down") {
      head.y += 20;
    } else if(direction == "left") {
      head.x -= 20;
    }
  }
  
  void showScore() {
    textSize(20);
    text("Score: " + score, 10, 20);
  }
  
  void screenCollision() {
    SnakePart head = snakeParts.get(0);
    if(head.y <= 0) {
      init();
      score = 0;
    } else if(head.y >= 580) {
      init();
      score = 0;
    } else if(head.x <= 0) {
      init();
      score = 0;
    } else if(head.x >= 680) {
      init();
      score = 0;
    }
  }
  
  void snakeTailCollision() {
    SnakePart head = snakeParts.get(0);
    if(snakeParts.size() >= 5) {
      for(int i = 1; i < snakeParts.size()-1; i++) {
        SnakePart snakePart = snakeParts.get(i);
        if(getDistanceBetweenNodes(head.x, head.y, snakePart.x, snakePart.y) == 0) {
          init();
        }
      }
    }
  }
  
  void foodCollision() {
    SnakePart snakeHead = snakeParts.get(0);
    if(getDistanceBetweenNodes(snakeHead.x, snakeHead.y, food.x, food.y) == 0) {
      score += 1;
      SnakePart snakeTail = snakeParts.get(snakeParts.size()-1);
      if(direction == "top") {
        snakeParts.add(new SnakePart(snakeTail.x, snakeTail.y-20, "grey"));
      } else if(direction == "right") {
        snakeParts.add(new SnakePart(snakeTail.x+20, snakeTail.y, "grey"));
      } else if(direction == "down") {
        snakeParts.add(new SnakePart(snakeTail.x, snakeTail.y+20, "grey"));
      } else if(direction == "left") {
        snakeParts.add(new SnakePart(snakeTail.x-20, snakeTail.y, "grey"));
      }
      food.generate();
    }
  }
  
  void showSnake() {
    for(SnakePart snakePart : snakeParts) {
      snakePart.show();
    }
  }
  
  void show() {
    keyEvents();
    screenCollision();
    foodCollision();
    snakeTailCollision();
    move();
    showSnake();
    showScore();
  }
}
