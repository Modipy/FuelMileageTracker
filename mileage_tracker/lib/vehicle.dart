class Vehicle {
  int? year = 0;
  String? make = "Default";
  String? model = "Default";
  String? vehicleType = "Default";
  double? mileage = 0.0;
  static List<String> vehicleTypes = ["Car", "Truck", "Van / SUV", "Motorcycle", "Offroad Vehicle", "Other"]; // list of vehicle types


  
  Vehicle([this.year, this.make, this.model, this.vehicleType, this.mileage]); // Constructor for a vehicle

  String? getBasicInfoAsString() {
    return "$year $make $model";
  }


  void updateVehicleMileage(double newMileage) {
    mileage = newMileage;
  }

}