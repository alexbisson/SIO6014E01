part of sio6014e01;

class CoordinateConverter {

  int widthCanvas, heightCanvas; 
  CoordinateConverter(this.widthCanvas, this.heightCanvas);
  
  //Permet d'obtenir le x à partir de la longitude
  int getHorizontalCoordinate(num longitude){
    assert(longitude > -180 && longitude < 180);
    int x = ((longitude + 180)/360*widthCanvas).toInt();
    return x;
  }

  //Permet d'obtenir le y à partir de la latitude  
  int getVerticalCoordinate(num latitude){
    assert(latitude > -90 && latitude < 90);
    int y = ((latitude + 90)/180*heightCanvas).toInt();
    return heightCanvas - y; 
  }

}
