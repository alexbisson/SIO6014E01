part of sio6014e01;

class Dessinateur {
  
  ConvertisseurCoordonnees _convertisseur;
  CanvasRenderingContext2D _context;
  CanvasElement _canvas = document.query('#carteCanevas');
  
  Dessinateur(){
    int largeurCanevas = _canvas.width;
    int hauteurCanevas = _canvas.height;
    _convertisseur = new ConvertisseurCoordonnees(largeurCanevas,hauteurCanevas);
    _context = _canvas.getContext('2d');
  }
  
  void dessinerVilles(){
    int x, y;
    for (City city in referentielVilles.cities) {
      x = _convertisseur.obtenirCoordonneeHorizontale(city.longitude);
      y = _convertisseur.obtenirCoordonneeVerticale(city.latitude);
      dessinerVille(x, y, _context);
    }
  }
  
  void dessinerVille(int x, int y, CanvasRenderingContext2D context){
    context.arc(x, y, 5, 0, 2 * PI, false);
    context.fillStyle = 'red';
    context.fill();
  }
  
  void dessinerVols(){
    int xSource, ySource, xDestination, yDestination;
//    for (City city in cities) {
//      for (City destination in city.connections){
//        xSource = convertisseur.obtenirCoordonneeHorizontale(city.longitude);
//        ySource = convertisseur.obtenirCoordonneeVerticale(city.latitude);  
//        xDestination = convertisseur.obtenirCoordonneeHorizontale(destination.longitude);
//        yDestination = convertisseur.obtenirCoordonneeVerticale(destination.latitude);
//        _dessinerVol(xSource, ySource, xDestination, yDestination);
//      }
//    }
      for (City destination in referentielVilles.cities[0].connections){
        xSource = _convertisseur.obtenirCoordonneeHorizontale(referentielVilles.cities[0].longitude);
        ySource = _convertisseur.obtenirCoordonneeVerticale(referentielVilles.cities[0].latitude);  
        xDestination = _convertisseur.obtenirCoordonneeHorizontale(destination.longitude);
        yDestination = _convertisseur.obtenirCoordonneeVerticale(destination.latitude);
        _dessinerVol(xSource, ySource, xDestination, yDestination);
      }
    
  }
  
  void dessinerChemin(List<City> path){
    assert(path != null);
    assert(path.length>1);
    _context.clearRect(0, 0, _canvas.width, _canvas.height);
    int xSource, ySource, xDestination, yDestination;
    dessinerVilles();
    dessinerVols();
    _context = _canvas.getContext('2d');
    _context.beginPath();
    for (int i = 0; i<path.length-1;i++) {
      xSource = _convertisseur.obtenirCoordonneeHorizontale(path[i].longitude);
      ySource = _convertisseur.obtenirCoordonneeVerticale(path[i].latitude);  
      xDestination = _convertisseur.obtenirCoordonneeHorizontale(path[i+1].longitude);
      yDestination = _convertisseur.obtenirCoordonneeVerticale(path[i+1].latitude);
      _context.moveTo(xSource, ySource);
      _context.lineTo(xDestination, yDestination);
      _context.lineWidth= 2;
      _context.strokeStyle = '#00FF00';
      _context.stroke();
    }
    _context.closePath();
  }
  
  void _dessinerVol(int xSource, int ySource, int xDestination, int yDestination){
    assert(xSource > 0 && ySource > 0 && xDestination > 0 && yDestination > 0);
    _context.moveTo(xSource, ySource);
    _context.lineTo(xDestination, yDestination);
    _context.strokeStyle = '#ff0000';
    _context.lineWidth= 1;
    _context.stroke();
  }
}
