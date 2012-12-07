library sio6014e01;

import 'dart:html';
import 'dart:math';
part 'city.dart';
part 'convertisseur_coordonnees.dart';
part 'dessinateur.dart';
part 'a_star.dart';
part 'referentiel_villes.dart';
part 'gestionnaire_page_html.dart';



ReferentielVilles referentielVilles = new ReferentielVilles();
GestionnairePageHtml gestionnairePageHtml = new GestionnairePageHtml();

void main() {
  query('#btnTestAStar').on.click.add(testAStar);
  gestionnairePageHtml.afficherVilles();
  generateRandomConnections();   
  gestionnairePageHtml.afficherVols();
  gestionnairePageHtml.remplirSelect();
}

void testAStar(Event event) {
//Vider l'espace réponse
  gestionnairePageHtml.afficherTexteReponse(""); 
  AStar algo = new AStar();
  City villeDepart = referentielVilles.obtenirVille((query('#depart') as SelectElement).selectedOptions[0].text );
  City villeArrivee = referentielVilles.obtenirVille((query('#arrivee') as SelectElement).selectedOptions[0].text );
  if(villeDepart.name !== villeArrivee.name){
    List<City> path = algo.findPath(villeDepart, villeArrivee);
    if(path.length<2){
      gestionnairePageHtml.afficherTexteReponse("Aucun chemin possible, trouvez un autre moyen de transport");
    }else{
      gestionnairePageHtml.afficherCheminPlusCours(path);  
    }
  }else{
    gestionnairePageHtml.afficherTexteReponse("Origine = Destination, ne prenez pas l'avion");
  }
}




void generateRandomConnections() {

  // Nombre de connexions sortantes qu'on va creer par ville
  // Il va avoir plus de connexions en bout de lignes puisque chaque
  // connexion est créée dans 2 villes
  int minConnections = 2;
  int maxConnections = 6;
  Random rnd = new Random();

  for (City city in referentielVilles.cities) {
    // Nombre de connexions pour la ville (valeur max en parametre est exclue)
    int connectionCount = rnd.nextInt(maxConnections - minConnections + 1) + minConnections;

    while (connectionCount > 0) {
   // Piger une ville aléatoire comme destination
      City destination = referentielVilles.cities[rnd.nextInt(referentielVilles.cities.length)];

      if (!destination.connections.contains(city)) {
        city.connections.add(destination);
        destination.connections.add(city);
        connectionCount = connectionCount - 1;
      }
    }

  }
}
