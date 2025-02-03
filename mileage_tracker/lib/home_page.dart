import 'package:flutter/material.dart';
import 'package:mileage_tracker/drawer_item.dart';
import 'package:mileage_tracker/mileage_model.dart';
import 'package:mileage_tracker/new_fuel_up_page.dart';
import 'package:mileage_tracker/vehicle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.mileageModel});

  final MileageModel mileageModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Current index of selected drawer item
  int _drawerSelectedIndex = 0;
  // List of items for the drawer
  static final List<DrawerItem> _drawerItems = [
    DrawerItem('Home', const Icon(Icons.home), 0),
    DrawerItem('Logbook', const Icon(Icons.menu_book_rounded), 1),
    DrawerItem('Statistcs', const Icon(Icons.analytics_rounded), 2),
    DrawerItem('Vehicles', const Icon(Icons.directions_car_filled_rounded), 3),
    DrawerItem('Account', const Icon(Icons.account_circle_rounded), 4),
    DrawerItem('Settings', const Icon(Icons.settings), 5)
  ];

  //List<Widget> pageList = [homePageBody(context, widget.mileageModel.vehicleList.getBasicInfoAsString())];
  String? dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //leading: IconButton(onPressed: () {Scaffold.of(context).openDrawer();}, icon: const Icon(Icons.density_medium_rounded)),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu /*Icons.density_medium_rounded*/),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              onPressed: _addFuelMileage,
              icon: (_addButtonIsAvailable(_drawerItems[_drawerSelectedIndex]))
                  ? const Icon(Icons.add)
                  : Container(), // change this so that no button is actually there
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: _drawerItems[_drawerSelectedIndex].getNameAsText(),
          centerTitle: true,
        ),
        body: homePageBody(
            context, widget.mileageModel.getBasicVehicleInfoAsString()),
        //Center(child: _drawerItems[_selectedIndex].getNameAsText()),
        // might have to make a function that returns a widget based on the _drawerSelectedIndex
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets
                .zero, // Important: Remove any padding from the ListView.
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer),
                  child: _drawerItems[_drawerSelectedIndex].getNameAsText()),
              drawerTile(context, _drawerItems[0]),
              drawerTile(context, _drawerItems[1]),
              drawerTile(context, _drawerItems[2]),
              drawerTile(context, _drawerItems[3]),
              drawerTile(context, _drawerItems[4]),
              drawerTile(context, _drawerItems[5]),
            ],
          ),
        ));
  }

  ListTile drawerTile(BuildContext context, DrawerItem drawerItem) {
    return ListTile(
      leading: drawerItem.getIcon(),
      title: drawerItem.getNameAsText(),
      selected: _drawerSelectedIndex == drawerItem.getIndex(),
      onTap: () {
        setState(() {
          _drawerSelectedIndex = drawerItem.getIndex();
        }); // Update the state of the app
        Navigator.pop(context); // Then close the drawer
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Initialize dropDownValue with a default value, if desired
    dropDownValue = widget.mileageModel.getBasicVehicleInfoAsString().first;
  }

  Column homePageBody(BuildContext context, List<String?> vehicleList) {
    //String? dropDownValue = vehicleList[0];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Current Vehicle: "),
              DropdownButton(
                hint: Text(dropDownValue!),
                iconSize: 30.0,
                items: vehicleList.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val!),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      dropDownValue = val;
                    },
                  );
                },
              ),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print("We got here");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewFuelUpPage()),
              );
              print("Here after the navigate");
            },
            child: const Text("Add New Fuel Up"))
      ],
    );
  }

  void _addFuelMileage() {}

  void _addNewFuelUp() {}

  bool _addButtonIsAvailable(DrawerItem drawerItem) {
    if (drawerItem.getName() == "Home") {
      return true;
    }
    if (drawerItem.getName() == "Logbook") {
      return true;
    }
    if (drawerItem.getName() == "Vehicles") {
      return true;
    }
    return false;
  }
}
