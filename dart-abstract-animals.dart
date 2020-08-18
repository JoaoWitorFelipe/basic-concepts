abstract class Animal {
  void walk();
  void eat();
  void talk();
}

abstract class Mammal implements Animal {
  void mammal() {
    print("I'm mamal");
  }
}

class Lion extends Mammal {
  final String name;
  Lion(this.name);

  void walk() {
    print("$name, walk fast");
  }

  void eat() {
    print("$name, eat fast");
  }

  void talk() {
    print("$name, talk fast");
  }
}

void main() {
  final Mammal lion = Lion("Zumba")
    ..walk()
    ..eat()
    ..talk()
    ..mammal();
}
