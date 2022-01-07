abstract class Animal {
  final String _name;
  String get name => _name;

  Animal({required String name}) : _name = name;
}

class Lion extends Animal {
  Lion({required String name}) : super(name: name);

  static List<Lion> lions = [
    Lion(name: 'Simba'),
    Lion(name: 'Nala'),
    Lion(name: 'Mufasa'),
    Lion(name: 'Scar'),
  ];
}

class Tiger extends Animal {
  Tiger({required String name}) : super(name: name);

  static List<Tiger> tigers = [
    Tiger(name: 'Harold Castro'),
    Tiger(name: 'Jonathan Schoop'),
    Tiger(name: 'Jeimer Candelario'),
  ];
}

class Bear extends Animal {
  Bear({required String name}) : super(name: name);

  static List<Bear> bears = [
    Bear(name: 'Gummy'),
    Bear(name: 'Polar'),
    Bear(name: 'Grizz'),
  ];
}
