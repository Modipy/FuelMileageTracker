import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mileage_tracker/database_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => DatabaseModel(),
      child: const MaterialApp(home: MainPage())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> dropdownChoices = ['Mileage', 'Vehicles', 'Logbook']; // choices for sorting
  static const List<Widget> _widgetOptions = <Widget>[Text('Mileage'), Text('Vehicles'), Text('Logbook')];
  int _selectedIndex = 0;


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
              icon: (dropdownChoices[_selectedIndex] != "Logbook") ? const Icon(Icons.add) : Container(),
              //padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(dropdownChoices[_selectedIndex]),
          centerTitle: true,
        ),
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(dropdownChoices[_selectedIndex]),
              ),
              ListTile(
                title: const Text('Mileage'),
                selected: _selectedIndex == 0,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(0);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Vehicles'),
                selected: _selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Logbook'),
                selected: _selectedIndex == 2,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(2);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }

  void _addFuelMileage() {}

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
