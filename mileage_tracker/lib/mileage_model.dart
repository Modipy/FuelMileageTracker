import 'package:flutter/material.dart';
import 'package:mileage_tracker/vehicle.dart';

class MileageModel extends ChangeNotifier {
  List<Vehicle> vehicleList = [
    Vehicle(1997, 'Chevrolet', 'K2500', 'Truck', 236000),
    Vehicle(1999, 'GMC', 'Sierra 1500', 'Truck', 168000),
    Vehicle(1983, 'BMW', '633 CSI', 'Car', 212000),
    Vehicle(2015, 'GMC', 'Sierra 2500', 'Truck', 148000)
  ];

  Vehicle selectedVehicle = Vehicle();

  Vehicle getSelectedVehicle() {
    selectedVehicle = vehicleList[0];
    notifyListeners();
    return selectedVehicle;
  }

  List<String?> getBasicVehicleInfoAsString() {
    List<String?> userVehicleNames = [];
    for (int i = 0; i < vehicleList.length; i++) {
      String? vehicleToAdd = vehicleList[i].getBasicInfoAsString();
      userVehicleNames.add(vehicleToAdd);
    }
    return userVehicleNames;
  }

  static void getUserVehicles() async {}
}
