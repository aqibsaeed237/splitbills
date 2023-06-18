import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:splitbills/nav_pages/main_page.dart';

class ImagePickerController extends GetxController {
  final picker = ImagePicker();
  RxString imagePath = RxString('');

  Future<void> pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imagePath.value = pickedImage.path;
    } else {
      // Handle case when no image is picked
    }
  }

// Add more logic or methods as needed
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final ImagePickerController imagePickerController;

  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Currency? _selectedCurrency;
  bool _isObsecure = true;

  @override
  void initState() {
    super.initState();
    imagePickerController = Get.put(ImagePickerController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(children: [
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/slogo.jpg',
                        height: 50,
                        width: 50,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    const Text(
                      'Bill Splitter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      } else if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
                        return 'Please enter a valid full name';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Row(children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(2),
                          shape: BoxShape.rectangle,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Pick an Image'),
                                    content: const Text(
                                        'Choose an image from the gallery.'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          imagePickerController.pickImage();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Pick Image'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Dismiss the dialog
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Obx(
                              () => imagePickerController
                                      .imagePath.value.isNotEmpty
                                  ? Image.file(File(
                                      imagePickerController.imagePath.value))
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(2),
                                      child: Image.asset(
                                        'assets/images/ravatar.jpg',
                                      ),
                                    ),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            } else if (!RegExp(
                                    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isObsecure,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObsecure = !_isObsecure;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ]),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Row(children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showSearch: true,
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                setState(() {
                                  _phoneController.text =
                                      '+${country.phoneCode} ';
                                });
                              },
                            );
                          },
                          child: const Icon(Icons.phone),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number (Optional)',
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'I use ${_selectedCurrency != null ? '${_selectedCurrency!.name} (${_selectedCurrency!.symbol})' : 'USD (\$)'} as currency.',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showCurrencyPicker(
                              context: context,
                              showFlag: true,
                              showCurrencyName: true,
                              onSelect: (Currency currency) {
                                setState(() {
                                  _selectedCurrency = currency;
                                });
                              },
                            );
                          },
                          child: const Text(
                            'Change>>',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Perform action to go back
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Back',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                        // SignUpController();
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]))),
    );
  }
}
