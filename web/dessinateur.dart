part of sio6014e01;

class Dessinateur {
  
  ConvertisseurCoordonnees convertisseur;
  CanvasRenderingContext2D context;
  
  Dessinateur(){
    CanvasElement canvas = document.query('#carteCanevas');
    int largeurCanevas = canvas.width;
    int hauteurCanevas = canvas.height;
    convertisseur = new ConvertisseurCoordonnees(largeurCanevas,hauteurCanevas);
    context = canvas.getContext('2d');
  }
  
  void dessinerVilles(List<City> cities){
    int x, y;
    for (City city in cities) {
      x = convertisseur.obtenirCoordonneeHorizontale(city.longitude);
      y = convertisseur.obtenirCoordonneeVerticale(city.latitude);
      dessinerVille(x, y, context);
    }
  }
  
  void dessinerVille(int x, int y, CanvasRenderingContext2D context){
    context.arc(x, y, 5, 0, 2 * PI, false);
    context.fillStyle = 'red';
    context.fill();
  }
  
  void dessinerVols(List<City> cities){
    int xSource, ySource, xDestination, yDestination;
    for (City city in cities) {
      for (City destination in city.connections){
        xSource = convertisseur.obtenirCoordonneeHorizontale(city.longitude);
        ySource = convertisseur.obtenirCoordonneeVerticale(city.latitude);  
        xDestination = convertisseur.obtenirCoordonneeHorizontale(destination.longitude);
        yDestination = convertisseur.obtenirCoordonneeVerticale(destination.latitude);
        context.moveTo(xSource, ySource);
        context.lineTo(xDestination, yDestination);
        context.lineWidth= 0.01;
        context.stroke();
      }
    }
  }
}
