part of sio6014e01;

class City {

  String name;
  double latitude;
  double longitude;
  int x;
  int y;
  List<City> connections = new List<City>();

  City(String name, double latitude, double longitude) {
    assert(name != null);
    assert(name.length > 0);
    assert(latitude > -90 && latitude < 90);
    assert(longitude > -180 && longitude < 180);
    this.name = name;
    this.latitude = latitude;
    this.longitude = longitude;
  }

  //Permet d'obtenir la distance entre deux villes
  double getDistanceTo(City other) {
    assert(other != null);
    // Formule Excel qui calcule la distance
    // http://bluemm.blogspot.ca/2007/01/excel-formula-to-calculate-distance.html
    // 6371*ACOS(COS(RADIANS(90-lat_1)) *COS(RADIANS(90-lat_2)) +SIN(RADIANS(90-lat_1)) *SIN(RADIANS(90-lat_2)) *COS(RADIANS(long_1-long_2)))

    return 6371 * acos(cos(_radians(90 - this.latitude)) *
        cos(_radians(90 - other.latitude)) + sin(_radians(90 - this.latitude)) *
        sin(_radians(90 - other.latitude)) * cos(_radians(this.longitude - other.longitude)));
  }
  
  double getPixelDistanceTo(City other) {
    return sqrt(pow((other.y - this.y), 2) + pow((other.x - this.x), 2));
  }
  
  int getVerticalPixelDistanceTo(City other) {
    return (other.y - this.y);
  }
  
  int getHorizontalPixelDistanceTo(City other) {
    return (other.x - this.x);
  }

  //Converti les degrés en radians
  double _radians(double degres) {
    return degres * 0.0174532925;
  }
}
