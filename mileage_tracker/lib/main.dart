import 'package:flutter/material.dart';
import 'package:mileage_tracker/home_page.dart';
import 'package:provider/provider.dart';
import 'package:mileage_tracker/mileage_model.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context) => MileageModel(), child: const MaterialApp(home: MyApp())));
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
      home: Consumer<MileageModel>( // the list of widgets tied to the tab controller
      builder: (context, mileageChangeNotifier, child) => HomePage(mileageModel: mileageChangeNotifier)),
    );
  }
}