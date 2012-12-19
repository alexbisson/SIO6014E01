part of sio6014e01;

class DrawingManager {

  CanvasRenderingContext2D _context;
  CanvasElement _canvas;
  ImageElement _plane;
  
  DrawingManager(){
    _canvas = document.query('#canvasMap');
    _plane = document.query('#plane');
    //_plane.style.imageOrientation = "90deg";
    int widthCanvas = _canvas.width;
    int heightCanvas = _canvas.height;
    _context = _canvas.getContext('2d');
    
    // Populer les coordonnées X, Y de chaque ville
    for (City c in citiesReferential.cities) {
      c.x = _getHorizontalCoordinate(c.longitude, widthCanvas);
      c.y = _getVerticalCoordinate(c.latitude, heightCanvas);
    }
  }
  
  //Dessine les villes
  void drawCities(){
    int x, y;
    for (City city in citiesReferential.cities) {
      x = city.x;
      y = city.y;
      drawCity(x, y);
    }
  }
  
  //Dessine une ville
  void drawCity(int x, int y){
    _context.arc(x, y, 5, 0, 2 * PI, false);
    _context.fillStyle = 'red';
    _context.fill();
  }
  
  //Dessine tous les vols
  void drawFlights(){
    Line flight = new Line();
    _context.beginPath();
    for (City city in citiesReferential.cities) {
      for (City destination in city.connections){
        flight.x1 = city.x;
        flight.y1= city.y;  
        flight.x2 = destination.x;
        flight.y2 = destination.y;
        _drawFlight(flight, 1, "FFFFFF");
      }
    }
    _context.closePath();
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
      
      flight.x1 = path[i].x;
      flight.y1 = path[i].y;  
      flight.x2 = path[i+1].x;
      flight.y2 = path[i+1].y;
      
      _drawFlight(flight, 2, '#00FF00');
    }
    _context.closePath();
  }
  
  void drawPlane(int x, int y) {
    _context.drawImage(_plane, x - 16, y - 16, 32, 32);
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
  
  //Permet d'obtenir le x à partir de la longitude
  int _getHorizontalCoordinate(num longitude, int widthCanvas){
    assert(longitude > -180 && longitude < 180);
    int x = ((longitude + 180)/360*widthCanvas).toInt();
    return x;
  }

  //Permet d'obtenir le y à partir de la latitude  
  int _getVerticalCoordinate(num latitude, int heightCanvas){
    assert(latitude > -90 && latitude < 90);
    int y = ((latitude + 90)/180*heightCanvas).toInt();
    return heightCanvas - y; 
  }
}
