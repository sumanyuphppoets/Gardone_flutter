import 'package:flutter/material.dart';
import '../../Components//Input/Input.dart'; // Import the input.dart file

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final pincodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();

  late final Map<String, TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = {
      'firstName': firstNameController,
      'lastName': lastNameController,
      'phone': phoneController,
      'country': countryController,
      'pincode': pincodeController,
      'city': cityController,
      'state': stateController,
      'address1': address1Controller,
      'address2': address2Controller,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Shipping Form',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // for back button or other icons
        elevation: 0, // optional: removes shadow for a flat look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              const Text(
                "Personal Information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'AvenirNextCyr',
                  color: Color(0xFF002140),
                ),
              ),
              const SizedBox(height: 12),
              InputField(
                label: "First Name",
                controller: firstNameController,
                validator:
                    (value) => value!.isEmpty ? "First Name required" : null,
              ),
              InputField(
                label: "Last Name",
                controller: lastNameController,
                validator:
                    (value) => value!.isEmpty ? "Last Name required" : null,
              ),
              InputField(
                label: "Phone Number",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator:
                    (value) =>
                        value!.length < 10
                            ? "Enter a valid phone number"
                            : null,
              ),
              const Text(
                "Shipping Address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF001F3F),
                ),
              ),
              const SizedBox(height: 12),
              InputField(
                label: "Country",
                controller: countryController,
                validator:
                    (value) => value!.isEmpty ? "Country required" : null,
              ),
              InputField(
                label: "PIN Code",
                controller: pincodeController,
                validator:
                    (value) => value!.isEmpty ? "PIN Code required" : null,
              ),
              InputField(
                label: "City",
                controller: cityController,
                validator: (value) => value!.isEmpty ? "City required" : null,
              ),
              InputField(
                label: "State",
                controller: stateController,
                validator: (value) => value!.isEmpty ? "State required" : null,
              ),
              InputField(
                label: "Address line 1",
                controller: address1Controller,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 3,
                validator:
                    (value) => value!.isEmpty ? "Address required" : null,
              ),
              InputField(
                label: "Address line 2",
                controller: address2Controller,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 3,
                validator:
                    (value) => value!.isEmpty ? "Address required" : null,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Print each field value to the console
                    controllers.forEach((key, controller) {
                      print('$key: ${controller.text}');
                    });

                    // Example: You can also access specific ones like:
                    // print('First Name: ${controllers['firstName']!.text}');
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
