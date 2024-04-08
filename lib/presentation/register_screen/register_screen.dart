import 'package:college/presentation/register_screen/controller/register_screen_controller.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../global_widgets/textfield_refactor.dart';
import '../../utils/color_constants/color_constant.dart';
import '../login_screen/view/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final userkey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();
  String? name;
  String? pass;
  String? selectedGender;
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
  }

  // saveData() {
  //   SharedPreferencesClass().saveUser(usernameController.text);
  //   SharedPreferencesClass().savePass(usernameController.text);
  //   usernameController.clear();
  //   getData();
  //   setState(() {});
  // }

  // getData() {
  //   if (SharedPreferencesClass().getUserString() != null &&
  //       SharedPreferencesClass().getUserString() != null) {
  //     name = SharedPreferencesClass().getUserString();
  //     pass = SharedPreferencesClass().getPassString();
  //   }
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  DateTime selectedDate = DateTime.now();

  // here is the api data
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   dobController.text = _formatDate(selectedDate.toString());
  // }

  void _register() async {
    await Provider.of<RegistrationScreenController>(context, listen: false)
        .onRegister(
      full_name: fullnameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      dob: dobController.text = _formatDate(selectedDate.toString()),
      gender: selectedGender.toString(),
      user: usernameController.text.trim(),
      pass: passwordController.text.trim(),
    );
    // You can add more data to store if needed
    Provider.of<RegistrationScreenController>(context, listen: false)
            .isPostLoading
        ? CircularProgressIndicator()
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/login.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Create New Account",
                  style:
                      TextStyle(fontSize: 20, color: ColorCOnstant.myBlueColor),
                ),
                SizedBox(
                  height: 20,
                ),
                // here is the full name
                TextFormField(
                  controller: fullnameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorCOnstant.myBlueColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorCOnstant.myBlueColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Full Name",
                    labelText: "Full Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a vaild Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // here the Phone Number
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorCOnstant.myBlueColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorCOnstant.myBlueColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Phone Number",
                    labelText: "Phone Number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a vaild Phone Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // here the choosing the date of birth
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorCOnstant.myBlueColor)),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null && picked != selectedDate)
                            setState(() {
                              selectedDate = picked;
                            });
                        },
                        child: Text(
                          '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null && picked != selectedDate)
                            setState(() {
                              selectedDate = picked;

                              print(selectedDate);
                            });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
// drop down for choos e the gender
                DropdownButtonFormField(
                  value: selectedGender,
                  items: ["Male", "Female", "Others"]
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorCOnstant.myBlueColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorCOnstant.myBlueColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Gender",
                    labelText: "Gender",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
// Email id
                Container(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorCOnstant.myBlueColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorCOnstant.myBlueColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "Email ID",
                          labelText: "Email ID",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a vaild Email id';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // user name
                      Form(
                        key: userkey,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorCOnstant.myBlueColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorCOnstant.myBlueColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "User name",
                            labelText: "User name",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a vaild user name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // password
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: passKey,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorCOnstant.myBlueColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorCOnstant.myBlueColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a vaild password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(
                            color: ColorCOnstant.myTextGrey,
                            fontSize: 14,
                            height: 1.5),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text(
                            "Log In",
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            if (userkey.currentState!.validate() &&
                passKey.currentState!.validate()) {
              _register();
              // saveData();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorCOnstant.myBlueColor,
            ),
            height: 50,
            child: Center(
                child: Text(
              "Register",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString); // Parse the date string
    String formattedDate = DateFormat('yyyy-dd-MM').format(dateTime);
    // Dateformat('dd-MM-yyyy').format(dateTime); // Format the date
    return formattedDate;
  }
}
