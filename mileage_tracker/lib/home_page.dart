
import 'package:flutter/material.dart';
import 'package:mileage_tracker/drawer_item.dart';
import 'package:mileage_tracker/mileage_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.mileageModel});

  final MileageModel mileageModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // Current index of selected drawer item
  int _selectedIndex = 0;
  // List of items for the drawer
  static final List<DrawerItem> _drawerItems = [
    DrawerItem('Home', const Icon(Icons.home), 0),
    DrawerItem('Logbook', const Icon(Icons.menu_book_rounded), 1),
    DrawerItem('Statistcs', const Icon(Icons.analytics_rounded), 2),
    DrawerItem('Vehicles', const Icon(Icons.directions_car_filled_rounded), 3),
    DrawerItem('Account', const Icon(Icons.account_circle_rounded), 4),
    DrawerItem('Settings', const Icon(Icons.settings), 5)
  ];


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
          actions: <Widget>[
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

            IconButton(
              onPressed: _addFuelMileage,
              icon: (_addButtonIsAvailable(_drawerItems[_selectedIndex])) ? const Icon(Icons.add) : Container(),
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: _drawerItems[_selectedIndex].getNameAsText(),
          centerTitle: true,
        ),
        body: Center(
          child: _drawerItems[_selectedIndex].getNameAsText()
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero, // Important: Remove any padding from the ListView.
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: _drawerItems[_selectedIndex].getNameAsText()
              ),
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
      selected: _selectedIndex == drawerItem.getIndex(),
      onTap: () {
        setState(() { _selectedIndex = drawerItem.getIndex(); }); // Update the state of the app
        Navigator.pop(context); // Then close the drawer
      },
    );
  }

  void _addFuelMileage() {}

  bool _addButtonIsAvailable(DrawerItem drawerItem) {
    if (drawerItem.getName() == "Home") { return true; }
    if (drawerItem.getName() == "Logbook") { return true; }
    if (drawerItem.getName() == "Vehicles") { return true; }
    return false;
  }
}
