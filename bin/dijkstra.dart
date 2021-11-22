import 'node.dart';
import 'dart:math';

// max int number.
final INT_MAX = (pow(2, 32) - 1).toInt();

void main(List<String> arguments) {
  var node1 = Node(name: '1');
  var node2 = Node(name: '2');
  var node3 = Node(name: '3');
  var node4 = Node(name: '4');
  var node5 = Node(name: '5');
  var node6 = Node(name: '6');

  node1.arcs = [
    Arc(node: node2, weight: 2),
    Arc(node: node3, weight: 4),
  ];

  node2.arcs = [
    Arc(node: node3, weight: 1),
    Arc(node: node5, weight: 2),
    Arc(node: node4, weight: 4),
  ];
  node3.arcs = [
    Arc(node: node5, weight: 3),
  ];
  node4.arcs = [
    Arc(node: node6, weight: 2),
  ];
  node5.arcs = [
    Arc(node: node4, weight: 3),
    Arc(node: node6, weight: 2),
  ];
  node6.arcs = [];

  final allNodes = <Node>[
    node1,
    node2,
    node3,
    node4,
    node5,
    node6,
  ];

  Node findMinLabelNode(List<Node> nodelist) {
    return nodelist.reduce(
        (value, element) => value.cost < element.cost ? value : element);
  }

  for (var item in allNodes) {
    //SET ALL NODE COSTS TO INF 
    item.cost = INT_MAX;
  }

  node1.cost = 0; // set start node cost to 0
  node1.pred = null; //set start nodes pred to 0 or null

  final nodes = [node1]; // LIST

  while (nodes.isNotEmpty) {
    final selectedNode = findMinLabelNode(nodes);
    print('${selectedNode.name} selected');
    nodes.remove(selectedNode);

    selectedNode.arcs.forEach((element) {
      final newCost = selectedNode.cost + element.weight;
      if (newCost < element.node.cost) {
        print(
            'Node ${element.node.name} new weight is $newCost and Preds : ${selectedNode.name}');
        element.node.cost = newCost;
        element.node.pred = selectedNode;
        if (!nodes.contains(element.node)) nodes.add(element.node);
      }
    });
  }
  print('Finished');
  allNodes.forEach(print);
}
