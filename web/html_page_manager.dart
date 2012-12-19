part of sio6014e01;

class HtmlPageManager {

  DrawingManager _drawingManager = new DrawingManager();
  Timer _timer;
  List<City> _shortestPath;
  
  Plane _plane;
  
  const int _interval = 100;

  //Affiche le chemin le plus court sur le canvas
  void displayShortestPath(List<City> cities){
    assert(cities != null);
    int distance = 0;
    int distanceTotale = 0;
    String distances = "";
    String path = "Vols : ";
    
    _stopTimer();
    
    if(cities.length != 0){
      
      displayCities();
     
      _drawingManager.drawPath(cities);
      
      for (int i=0;i<cities.length-1;i++) {
        distance = cities[i].getDistanceTo(cities[i+1]).toInt();
        distances = distances.concat(cities[i].name).concat("->").concat(cities[i+1].name).concat("= $distance km<br>");
        path = path.concat(cities[i].name).concat("->");
        distanceTotale = distanceTotale + distance;
      }
      
      //on ne veut pas de flêche pour le dernier
      path = path.concat(cities[cities.length-1].name).concat("<br><br>Distances<br>");
      path = path.concat(distances);
      path = path.concat("Total = $distanceTotale km");
      displayAnswerText(path);    
      
      _shortestPath = cities;
      
      _plane = new Plane();
      _plane.increment= 12;
      _plane.originCityIndex = 0;
      _plane.x = _shortestPath[0].x;
      _plane.y = _shortestPath[0].y;
      
      _timer = new Timer.repeating(_interval, (t) => redraw());
      //redraw();
    }
  }
  
  // Appelé pour déplacer l'avion
  void redraw(){
    _drawingManager.clearCanvas();
    _drawingManager.drawCities();
    _drawingManager.drawPath(_shortestPath);
    _plane.move(_shortestPath);
    _drawingManager.drawPlane(_plane.x, _plane.y);
  }

  //affiche la réponse dans le champs texte
  void displayAnswerText(String answer){
    assert(answer != null);
    query("#text").innerHTML = answer;
  }
  
  //rempli les listes déroulantes d'origine/destination
  void fillDropDownLists(){
    _fillDropDownList("#origin");
    _fillDropDownList("#destination");
  
    }
  
  //Affiche les villes et les vols après avoir vider le canvas
  void displayCitiesAndFlights(){
    _stopTimer();
    _drawingManager.clearCanvas();
    _drawingManager.drawFlights();
    _drawingManager.drawCities();
  }
  
//Affiche les villes après avoir vider le canvas
  void displayCities(){
    _stopTimer();
    _drawingManager.clearCanvas();
    _drawingManager.drawCities();
  }

  //rempli une liste déroulante avec les villes  
  void _fillDropDownList(String id){
    assert(id != null);
    SelectElement dropDownList = query(id) as SelectElement;
    for(City city in citiesReferential.cities){
      dropDownList.elements.add(new OptionElement(city.name));  
    }
  }
    
  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
