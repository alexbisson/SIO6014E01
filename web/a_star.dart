part of sio6014e01;

class AStar {
  
  
  //Permet de trouver le chemin le plus court entre 2 point
  List<City> findPath(City origin, City goal) {
    assert(origin != null);
    assert(goal != null);
    
    // l'ensemble des noeuds à évaluer
    List<City> closedSet = new List<City>();

    // L'ensemble des noeuds essayés
    List<City> openSet = new List<City>();
 
    Map<City, City> cameFrom = new Map(); // Map des noeuds parcourus
    Map<City, double> gScore = new Map(); // Coût à partir du début du meilleur chemin connu
    Map<City, double> fScore = new Map(); // Coût estimé de l'origine à y

    openSet.add(origin);
    gScore[origin] = 0.0;
    fScore[origin] = gScore[origin] + origin.getDistanceTo(goal);

    
    while (!openSet.isEmpty) {
      
      sortNodes(openSet, fScore);

      // Noeud ayant le plus petit f score
      City current = openSet[0];

      if (current == goal) {
        return _reconstructPath(cameFrom, goal);
      }

      openSet.removeAt(0);
      closedSet.add(current);

      for(City neighbor in current.connections) {
        if (closedSet.contains(neighbor)) {
          continue;
        }
        
        double tentativeGScore = gScore[current] + current.getDistanceTo(neighbor);

        if (!openSet.contains(neighbor) || tentativeGScore <= gScore[neighbor]) {
          cameFrom[neighbor] = current;
          gScore[neighbor] = tentativeGScore;
          fScore[neighbor] = gScore[neighbor] + neighbor.getDistanceTo(goal);
          if (!openSet.contains(neighbor)) {
            openSet.add(neighbor);
          }
        }
      }
    }

    // Pas de chemin trouvé
    return null;
  }
  
  
  // Trier par fScore ascendant  
  void sortNodes(List<City> openSet, Map fScore){
    openSet.sort((a, b) {
      if (fScore[a] < fScore[b]) return -1;
      else if (fScore[a] == fScore[b]) return 0;
      else return 1;
    });
  }

  //Reconstruire le chemin
  List<City> _reconstructPath(Map<City, City> cameFrom, City currentNode) {
    assert(cameFrom != null);
    assert(currentNode != null);
    
    if (cameFrom.containsKey(currentNode)) {
      List<City> path = _reconstructPath(cameFrom, cameFrom[currentNode]);
      path.add(currentNode);
      return path;
    } else {
      return [currentNode];
    }
  }
}
