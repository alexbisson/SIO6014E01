part of sio6014e01;

class HtmlPageManager {

  DrawingManager _drawingManager = new DrawingManager();

  //Affiche le chemin le plus court sur le canvas
  void displayShortestPath(List<City> cities){
    assert(cities != null);
    if(cities.length != 0){
      displayCities();
      _drawingManager.drawPath(cities);
      String textToDisplay = "";
      for(int i=0;i<cities.length-1;i++){
        textToDisplay = textToDisplay.concat(cities[i].name).concat("->");
      }
      //on ne veut pas de flêche pour le dernier
      textToDisplay = textToDisplay.concat(cities[cities.length-1].name); 
      displayAnswerText(textToDisplay);    
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
