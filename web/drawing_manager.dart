part of sio6014e01;

class DrawingManager {
  
  CoordinateConverter _converter;
  CanvasRenderingContext2D _context;
  CanvasElement _canvas;
  
  DrawingManager(){
    _canvas = document.query('#canvasMap');
    int widthCanvas = _canvas.width;
    int heightCanvas = _canvas.height;
    _converter = new CoordinateConverter(widthCanvas,heightCanvas);
    _context = _canvas.getContext('2d');
  }
  
  
  //Dessine les villes
  void drawCities(){
    int x, y;
    for (City city in citiesReferential.cities) {
      x = _converter.getHorizontalCoordinate(city.longitude);
      y = _converter.getVerticalCoordinate(city.latitude);
      drawCity(x, y);
    }
  }
  
  //Dessine une ville
  void drawCity(int x, int y){
    _context.arc(x, y, 5, 0, 2 * PI, false);
    _context.fillStyle = 'red';
    _context.fill();
  }
  
  void drawFlights(){
//    for (City city in cities) {
//      for (City destination in city.connections){
//        xSource = convertisseur.obtenirCoordonneeHorizontale(city.longitude);
//        ySource = convertisseur.obtenirCoordonneeVerticale(city.latitude);  
//        xDestination = convertisseur.obtenirCoordonneeHorizontale(destination.longitude);
//        yDestination = convertisseur.obtenirCoordonneeVerticale(destination.latitude);
//        _dessinerVol(xSource, ySource, xDestination, yDestination);
//      }
//    }
    Line flight = new Line();
      for (City destination in citiesReferential.cities[0].connections){
        flight.x1 = _converter.getHorizontalCoordinate(citiesReferential.cities[0].longitude);
        flight.y1 = _converter.getVerticalCoordinate(citiesReferential.cities[0].latitude);  
        flight.x2 = _converter.getHorizontalCoordinate(destination.longitude);
        flight.y2 = _converter.getVerticalCoordinate(destination.latitude);
        _drawFlight(flight, 1, "FF0000");
      }
    
  }
  
  //vide le canevas
  void clearCanvas(){
    _context.clearRect(0, 0, _canvas.width, _canvas.height);
  }
  
  //Dessine le chemin le plus court
  void drawPath(List<City> path){
    assert(path != null);
    assert(path.length>1);
    _context.beginPath();
    Line flight = new Line();
    for (int i = 0; i<path.length-1;i++) {
      flight.x1 = _converter.getHorizontalCoordinate(path[i].longitude);
      flight.y1 = _converter.getVerticalCoordinate(path[i].latitude);  
      flight.x2 = _converter.getHorizontalCoordinate(path[i+1].longitude);
      flight.y2 = _converter.getVerticalCoordinate(path[i+1].latitude);
      _drawFlight(flight, 2, '#00FF00');
    }
    _context.closePath();
  }
  
  //Dessine une ligne sur le canevas
  void _drawFlight(Line line, int thickness, String color){
    assert(line.x1 >= 0 && line.x2 >= 0 && line.y1 >= 0 && line.y2 >= 0);
    if(color != null){
      _context.strokeStyle = color;
    }
    if(thickness != null){
      _context.lineWidth= thickness;
    }
    _context.moveTo(line.x1, line.y1);
    _context.lineTo(line.x2, line.y2);
    _context.stroke();
  }
}
