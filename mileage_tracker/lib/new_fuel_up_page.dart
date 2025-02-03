import 'package:flutter/material.dart';

class NewFuelUpPage extends StatefulWidget {
  const NewFuelUpPage({super.key});

  @override
  State<NewFuelUpPage> createState() => _NewFuelUpPageState();
}

class _NewFuelUpPageState extends State<NewFuelUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fuelAmountController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Fuel Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_car),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a vehicle name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Fuel Amount Field
              TextFormField(
                controller: _fuelAmountController,
                decoration: const InputDecoration(
                  labelText: 'Fuel Amount (liters)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_gas_station),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fuel amount';
                  }
                  final num? fuel = num.tryParse(value);
                  if (fuel == null || fuel <= 0) {
                    return 'Enter a valid positive number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Price Field
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price per Liter (\$)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price per liter';
                  }
                  final num? price = num.tryParse(value);
                  if (price == null || price <= 0) {
                    return 'Enter a valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // All fields are valid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Fuel Entry...')),
                    );

                    // Do something with the values
                    print("Vehicle: ${_nameController.text}");
                    print("Fuel Amount: ${_fuelAmountController.text}");
                    print("Price: ${_priceController.text}");
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _fuelAmountController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
