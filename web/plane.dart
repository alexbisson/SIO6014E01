part of sio6014e01;

class Plane {
  int originCityIndex;
  
  int x;
  int y;
  
  int increment;
  
  void move(List<City> path) {
    City originCity = path[originCityIndex];
    City destinationCity = path[originCityIndex + 1];
    
    double dist = originCity.getPixelDistanceTo(destinationCity);
    int yDist = originCity.getVerticalPixelDistanceTo(destinationCity);
    int xDist = originCity.getHorizontalPixelDistanceTo(destinationCity);
    
    int yIncrement = (increment / dist * yDist).toInt();
    int xIncrement = (increment / dist * xDist).toInt();
    
    bool goingRight = xDist > 0;
    bool goingDown = yDist > 0;
    bool changeLink = false;
    
    x = x + xIncrement;
    y = y + yIncrement;
    
    if (goingRight && x >= destinationCity.x) {
      changeLink = true;
    } else if (!goingRight && x <= destinationCity.x) {
      changeLink = true;
    }
    
    if (goingDown && y >= destinationCity.y) {
      changeLink = true;
    } else if (!goingDown &&y <= destinationCity.y ) {
      changeLink = true;
    }
    
    if (changeLink) {
      if (originCityIndex + 2 >= path.length) {
        // Derniere ville, retourner au debut du trajet
        originCityIndex = 0;
      } else {
        originCityIndex += 1;
      }
      
      x = path[originCityIndex].x;
      y = path[originCityIndex].y;
    }
  }
}
