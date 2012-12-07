part of sio6014e01;

class GestionnairePageHtml {


  void afficherVilles(){
    Dessinateur dessinateur = new Dessinateur();
    dessinateur.dessinerVilles();
  }
  
  void afficherVols(){
    Dessinateur dessinateur = new Dessinateur();
    dessinateur.dessinerVols();
  }
  
  void afficherCheminPlusCours(List<City> cities){
    assert(cities != null);
    if(cities.length != 0){
      Dessinateur dessinateur = new Dessinateur();
      dessinateur.dessinerChemin(cities);
      String reponse = "";
      for(int i=0;i<cities.length-1;i++){
        reponse = reponse.concat(cities[i].name).concat("->");
      }
      //on ne veut pas de flêche pour le dernier
      reponse = reponse.concat(cities[cities.length-1].name); 
      afficherTexteReponse(reponse);    
    }
    
  }
  
  void afficherTexteReponse(String reponse){
    assert(reponse != null);
    query("#text").innerHTML = reponse;
  }
  
  void remplirSelect(){
    _remplirSelect("#depart");
    _remplirSelect("#arrivee");
  
    }
  
  void _remplirSelect(String id){
    assert(id != null);
    SelectElement listeDeroulante = query(id) as SelectElement;
    for(City city in referentielVilles.cities){
      listeDeroulante.elements.add(new OptionElement(city.name));  
    }
    
  }
  

}
