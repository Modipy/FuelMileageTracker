import 'package:mileage_tracker/vehicle.dart';

class Logbook {
  
  DateTime dateFilled = DateTime.now();
  double amountOfFuel = 0;
  double moneySpent = 0;
  Vehicle vehicleFilled = Vehicle();

  Logbook(this.amountOfFuel, this.dateFilled, this.vehicleFilled);

}