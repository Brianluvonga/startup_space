import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:startup_space/components/models/startup/startup_model.dart';
import 'package:startup_space/pages/startup/account/notifier/startup_notifier.dart';

// enum ImageSource {
//   /// Opens up the device camera, letting the user to take a new picture.
//   camera,

//   /// Opens the user's photo gallery.
//   gallery,
// }

class UpdateStartupDetails extends StatefulWidget {
  final bool isUploading;
  const UpdateStartupDetails({Key? key, required this.isUploading})
      : super(key: key);

  @override
  _UpdateStartupDetailsState createState() => _UpdateStartupDetailsState();
}

class _UpdateStartupDetailsState extends State<UpdateStartupDetails> {
  TextEditingController businessCategoryController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final StartupModel _startup = StartupModel();

  @override
  void initState() {
    StartupNotifier startupNotifier =
        Provider.of<StartupNotifier>(context, listen: false);
    // getStartups(startupNotifier);
    super.initState();
  }

  Widget imageSection() {
    final image = NetworkImage(_startup.imageFile.toString());

    return ClipOval(
      child: Material(
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
          // child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget startup_name() {
    return Container(
      width: 150,
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
            labelText: 'Startup Name',
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            filled: true,
            hintText: 'Startup Name',
            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            labelStyle: TextStyle(color: Colors.black)),
        keyboardType: TextInputType.name,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontFamily: 'times'),
        cursorColor: Colors.black,
        // validator: (String? value) {
        //   if (value!.isEmpty) {
        //     return 'This field is required';
        //   }
        //   return null;
        // },
        onSaved: (String? value) {
          _startup.startupname = value;
        },
      ),
    );
  }

  Widget about() {
    return Container(
        width: 280,
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'About Startup',
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            filled: true,
            // hintText: 'Description',
            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            labelStyle: TextStyle(color: Colors.black),
          ),
          keyboardType: TextInputType.name,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontFamily: 'times'),
          cursorColor: Colors.black,
          // validator: (String? value) {
          //   if (value!.isEmpty) {
          //     return 'This field is required';
          //   }
          //   return null;
          // },
          onSaved: (String? value) {
            _startup.description = value!;
          },
        ));
  }

  Widget email() {
    return SizedBox(
        width: 120,
        child: TextFormField(
          decoration: const InputDecoration(
              labelText: 'Email Address',
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              filled: true,
              // hintText: 'Email',
              // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              labelStyle: TextStyle(color: Colors.black)),
          keyboardType: TextInputType.name,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontFamily: 'times'),
          cursorColor: Colors.black,
          // validator: (String? value) {
          //   if (value!.isEmpty) {
          //     return 'This field is required';
          //   }
          //   return null;
          // },
          onSaved: (String? value) {
            _startup.email = value!;
          },
        ));
  }

  Widget location() {
    return SizedBox(
      width: 120,
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
            labelText: 'Location',
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            filled: true,
            // hintText: 'Location',
            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            labelStyle: TextStyle(color: Colors.black)),
        keyboardType: TextInputType.name,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontFamily: 'times'),
        cursorColor: Colors.black,
        // validator: (String? value) {
        //   if (value!.isEmpty) {
        //     return 'This field is required';
        //   }
        //   return null;
        // },
        onSaved: (String? value) {
          _startup.location = value!;
        },
      ),
    );
  }

  Widget telephone() {
    return SizedBox(
      width: 150,
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration: const InputDecoration(
            hoverColor: Colors.black,
            labelText: 'Telephone',
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            filled: true,
            // hintText: 'Location',

            labelStyle: TextStyle(color: Colors.black)),
        keyboardType: TextInputType.name,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontFamily: 'times'),
        cursorColor: Colors.black,
        // validator: (String? value) {
        //   if (value!.isEmpty) {
        //     return 'This field is required';
        //   }
        //   return null;
        // },
        onSaved: (String? value) {
          _startup.location = value!;
        },
      ),
    );
  }

  String? dropdownValue;
// business type widget
  Widget businessCategoryField() {
    return SizedBox(
        width: 280,
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(width: 1, color: Colors.black),
              ),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.black),
              hintText: "Startup Category",
              labelStyle: TextStyle(color: Colors.black)),
          // itemHeight: 20.0,
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down_outlined, color: Colors.black),
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontFamily: 'times'),
          // validator: (String? value) {
          //   if (value!.isEmpty) {
          //     return 'This field is required';
          //   }
          //   return null;
          // },
          onSaved: (String? value) {
            _startup.category = value!;
          },
          // elevation: 16,

          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              businessCategoryController.text = dropdownValue!;
            });
          },
          items: <String>[
            'Finance',
            'Logistics',
            'IT',
            'Agriculture',
            'Manufacturing',
          ].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            },
          ).toList(),
        ));
  }

  _onStartupUploaded(StartupModel? startup) {
    StartupNotifier startupNotifier =
        Provider.of<StartupNotifier>(context, listen: false);
    // startupNotifier.addStartup(startup!);
    Navigator.pop(context);
  }

  Future<void> saveStartup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      // uploadStartup(_startup, widget.isUploading, _onStartupUploaded);
    }
  }

  File? _postImageFile;

  pickImage(ImageSource sourceImage) async {
    final image = await ImagePicker().pickImage(source: sourceImage);
    setState(
      () {
        _postImageFile = File(image!.path);
      },
    );
    Navigator.pop(context);
  }

  imageOptionsDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () => pickImage(ImageSource.gallery),
              child: const Text(
                "gallery",
              ),
            ),
            SimpleDialogOption(
              onPressed: () => pickImage(ImageSource.camera),
              child: const Text(
                "camera",
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
              ),
            )
          ],
        );
      },
    );
  }

  Widget profileImage() {
    return Positioned(
      left: 120,
      top: 0,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => pickImage,
            behavior: HitTestBehavior.translucent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                // InkWell()
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                    'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  ),
                ),
                const Icon(Icons.photo_camera_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update StartUp Details"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent[200],
      ),
      body: form(),
    );
  }

  Widget form() {
    return Center(
      child: Form(
        // ignore: deprecated_member_use
        autovalidate: true,
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
              width: 350,
              height: 600,
              child: Card(
                shadowColor: Colors.blue,
                elevation: 8.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 32, 0),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 120,
                        top: 0,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      profileImage(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 105,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      startup_name(),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      email()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 170,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      businessCategoryField(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 250,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      telephone(),
                                      const SizedBox(width: 10),
                                      location()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 315,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[about()],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 400,
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                          child: MaterialButton(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10),
                            minWidth: 200,
                            onPressed: () => saveStartup(),
                            child: const Text(
                              'Update',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
