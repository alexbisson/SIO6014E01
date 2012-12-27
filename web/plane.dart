part of sio6014e01;

class Plane {
  int originCityIndex;

  int x;
  int y;
  int orientation;

  int increment;

  void move(List<City> path) {

    City destinationCity = path[originCityIndex + 1];

    double dist = _getPixelDistanceTo(destinationCity);
    int yDist = _getVerticalPixelDistanceTo(destinationCity);
    int xDist = _getHorizontalPixelDistanceTo(destinationCity);

    double angle = atan(yDist / xDist);

    int yIncrement = (sin(angle) * increment).toInt();
    int xIncrement = (cos(angle) * increment).toInt();

    if ((yDist < 0 && yIncrement > 0) || (yDist > 0 && yIncrement < 0)) {
      yIncrement = yIncrement * -1;
    }

    if ((xDist < 0 && xIncrement > 0) || (xDist > 0 && xIncrement < 0)) {
      xIncrement = xIncrement * -1;
    }

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

    orientation = (angle * 180 / PI).toInt();

    if (xIncrement >= 0 && yIncrement >= 0) {
      orientation = -1 * orientation;
    } else if (xIncrement >= 0 && yIncrement < 0) {
      orientation = -1 * orientation;
    } else if (xIncrement < 0 && yIncrement >= 0) {
      orientation = 180 - orientation;
    } else {
      orientation = 180 - orientation;
    }
  }

  double _getPixelDistanceTo(City other) {
    return sqrt(pow((other.y - this.y), 2) + pow((other.x - this.x), 2));
  }

  int _getVerticalPixelDistanceTo(City other) {
    return (other.y - this.y);
  }

  int _getHorizontalPixelDistanceTo(City other) {
    return (other.x - this.x);
  }
}
