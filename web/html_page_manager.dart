part of sio6014e01;

class HtmlPageManager {

  DrawingManager _drawingManager = new DrawingManager();

  //Affiche le chemin le plus court sur le canvas
  void displayShortestPath(List<City> cities){
    assert(cities != null);
    int distance = 0;
    int distanceTotale = 0;
    String distances = "";
    String path = "Vols : ";
    if(cities.length != 0){
      displayCities();
      _drawingManager.drawPath(cities);
      for(int i=0;i<cities.length-1;i++){
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
    }
    
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
    _drawingManager.clearCanvas();
    _drawingManager.drawFlights();
    _drawingManager.drawCities();
  }
  
//Affiche les villes après avoir vider le canvas
  void displayCities(){
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
  

}
