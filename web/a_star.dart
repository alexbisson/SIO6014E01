part of sio6014e01;

class AStar {
  List<City> findPath(City origin, City goal) {

    
    // The set of nodes already evaluated
    List<City> closedSet = new List<City>();

    // The set of tentative nodes to be evaluated, initially containing the start node
    List<City> openSet = new List<City>();

    // The map of navigated nodes 
    Map<City, City> cameFrom = new Map();

    Map<City, double> gScore = new Map(); // Cost from start along best known path
    Map<City, double> fScore = new Map(); // Estimated total cost from start to goal through y

    openSet.add(origin);

    gScore[origin] = 0.0;
    fScore[origin] = gScore[origin] + origin.getDistanceTo(goal);

    
    while (!openSet.isEmpty) {
      
      // Trier par fScore ascendant
      openSet.sort((a, b) {
        if (fScore[a] < fScore[b]) return -1;
        else if (fScore[a] == fScore[b]) return 0;
        else return 1;
      });

      // Noeud ayant le plus petit f score
      City current = openSet[0];

      if (current == goal) {
        return reconstructPath(cameFrom, goal);
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

  List<City> reconstructPath(Map<City, City> cameFrom, City currentNode) {

    if (cameFrom.containsKey(currentNode)) {
      List<City> path = reconstructPath(cameFrom, cameFrom[currentNode]);
      path.add(currentNode);
      return path;
    } else {
      return [currentNode];
    }
  }
}
