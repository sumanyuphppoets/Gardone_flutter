import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Components/CustomImagePicker/CustomImagepicker.dart';
import '../../Components/Input/Input.dart'; // ✅ Using your custom InputField

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  File? _image;

  Future<void> _pickImage() async {
    File? selected = await showImagePickerModal(context);
    if (selected != null) {
      setState(() {
        _image = selected;
      });
    }
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dobController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      // ✅ All inputs are valid - proceed with your logic
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Profile updated successfully')));

      // You can also access the values from the controllers here
      print("Name: ${firstNameController.text}");
      print("Phone: ${phoneController.text}");
      print("Email: ${emailController.text}");
      print("DOB: ${dobController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: BackButton(color: Colors.black),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    _image != null
                                        ? FileImage(_image!)
                                        : AssetImage(
                                              'assets/images/Profile.jpg',
                                            )
                                            as ImageProvider,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 4,
                                child: GestureDetector(
                                  onTap: _pickImage,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Color(0xFF18392A),
                                    child: Icon(
                                      Icons.edit,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          InputField(
                            label: "Name",
                            controller: firstNameController,
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? "First Name required"
                                        : null,
                          ),
                          SizedBox(height: 12),
                          InputField(
                            label: "Phone Number",
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? "Phone Number required"
                                        : null,
                          ),
                          SizedBox(height: 12),
                          InputField(
                            label: "Email",
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) return "Email required";
                              if (!RegExp(
                                r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                              ).hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: _selectDate,
                            child: AbsorbPointer(
                              child: InputField(
                                label: "Date of Birth",
                                controller: dobController,
                                validator:
                                    (value) =>
                                        value!.isEmpty
                                            ? "Date of Birth required"
                                            : null,
                              ),
                            ),
                          ),
                          Spacer(), // pushes the button to bottom of screen
                          SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: _updateProfile,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF18392A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "Update Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
