
class Node<T extends num> {
  //T extends num means T must be extend from num. So it only can be int, double, float or complex number
  String name;
  List<Arc> arcs = <Arc>[];
  T cost = 0 as T; // Path cost. it must be inf at start
  Node? pred;

  Node({
    required this.name,
  });

  @override
  String toString() => 'Node(name: $name cost: $cost, pred:${pred?.name})';
}

class Arc<T extends num> {
  final Node node; // end node
  final T weight; // arc weight

  const Arc({
    required this.node,
    required this.weight,
  });
}
