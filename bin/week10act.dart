abstract class Serviceable {
  void service();
}

mixin GPS {
  void nav() => print("GPS: Navigating to destination...");
}

class Car implements Serviceable {
  String color;
  Car(this.color);

  void honk() => print("Car ($color): Beep beep!");

  @override
  void service() => print("Car ($color): Standard maintenance done.");
}

class SportsCar extends Car {
  SportsCar(super.color);

  @override
  void honk() => print("SportsCar ($color): Vroom!");
}

class ElectricCar extends Car with GPS {
  ElectricCar(super.color);

  @override
  void honk() => print("ElectricCar ($color): Silent chime!");
}

class DeliveryDrone with GPS {}

void main() {
  final List<Car> squad = [
    Car("Green"),
    SportsCar("Red"),
    ElectricCar("Yellow")
  ];

  for (final car in squad) {
    car.honk();
    car.service();
  }

  print("-----------------------");

  final ev = ElectricCar("Blue");
  ev.nav();

  final drone = DeliveryDrone();
  drone.nav();
}
