
import 'package:flutter/material.dart';
import 'package:mileage_tracker/mileage_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.mileageModel});

  final MileageModel mileageModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> drawerChoices = ['Mileage', 'Vehicles', 'Logbook', 'Statistics', 'Account', 'Settings']; // choices for sorting
  static const List<Widget> _drawerWidgetOptions = <Widget>[Text('Mileage'), Text('Vehicles'), Text('Logbook'), Text('Statisctics'), Text('Account'), Text('Settings')];
  int _drawerSelectedIndex = 0;


  // Icons.local_gas_station_rounded
  // Icons.directions_car_filled_rounded
  // menu_book_rounded
  //
  // mileage page, vehicles page, logbook, stats page, account page, settings page


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
                icon: const Icon(Icons.menu/*Icons.density_medium_rounded*/),
              );
            },
          ),
          actions: const <Widget>[
            // Flexible(
            //   child: DropdownButton(
            //     iconDisabledColor:
            //         Theme.of(context).colorScheme.primaryContainer,
            //     iconEnabledColor:
            //         Theme.of(context).colorScheme.primaryContainer,
            //     value: selectedChoice,
            //     underline: Container(),
            //     style: TextStyle(color: Theme.of(context).colorScheme.primary),
            //     icon: const Icon(Icons.density_medium_rounded),
            //     items: dropdownChoices.map((String items) {
            //       return DropdownMenuItem(value: items, child: Text(items));
            //     }).toList(),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         selectedChoice = newValue!;
            //       });
            //     },
            //   ),
            // ),

            // IconButton(
            //   onPressed: _addFuelMileage,
            //   icon: (dropdownChoices[_selectedIndex] != "Logbook") ? const Icon(Icons.add) : Container(),
            // )
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(drawerChoices[_drawerSelectedIndex]),
          centerTitle: true,
        ),
        body: Center(
          child: _drawerWidgetOptions[_drawerSelectedIndex],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero, // Important: Remove any padding from the ListView.
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(drawerChoices[_drawerSelectedIndex]),
              ),
              drawerTile(context, drawerChoices[0], 0),
              drawerTile(context, drawerChoices[1], 1),
              drawerTile(context, drawerChoices[2], 2),
              drawerTile(context, drawerChoices[3], 3),
              drawerTile(context, drawerChoices[4], 4),
              drawerTile(context, drawerChoices[5], 5),
            ],
          ),
        ));
  }

  ListTile drawerTile(BuildContext context, String drawerChoice, int index) {
    return ListTile(
      title: Text(drawerChoice),
      selected: _drawerSelectedIndex == index,
      onTap: () {
        setState(() { _drawerSelectedIndex = index; }); // Update the state of the app
        Navigator.pop(context); // Then close the drawer
      },
    );
  }

  void _addFuelMileage() {}
}
