class Car {
  late String brand;
  late String model;
  late int year;
  late double milesDriven;

  static int numberOfCars = 0;

  Car(String brand, String model, int year) {
    this.brand = brand;
    this.model = model;
    this.year = year;
    this.milesDriven = 0;
    numberOfCars++;
  }

  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  int getAge() {
    int currentYear = DateTime.now().year;
    return currentYear - year;
  }
}

void main() {
  Car car1 = Car("Toyota", "Corolla", 2010);
  car1.drive(5000);

  Car car2 = Car("Honda", "Civic", 2015);
  car2.drive(7000);

  Car car3 = Car("Ford", "Mustang", 2018);
  car3.drive(3000);

  print("Car 1: ${car1.getBrand()} ${car1.getModel()}, Year: ${car1.getYear()}, Miles driven: ${car1.getMilesDriven()}, Age: ${car1.getAge()}");
  print("Car 2: ${car2.getBrand()} ${car2.getModel()}, Year: ${car2.getYear()}, Miles driven: ${car2.getMilesDriven()}, Age: ${car2.getAge()}");
  print("Car 3: ${car3.getBrand()} ${car3.getModel()}, Year: ${car3.getYear()}, Miles driven: ${car3.getMilesDriven()}, Age: ${car3.getAge()}");

  print("Total number of cars: ${Car.numberOfCars}");
}
