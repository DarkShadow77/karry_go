import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karry_go/Screens/SignUp%20Screens/guarantor_details.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/image_picker_class.dart';
import 'package:karry_go/utils/modal_dialog.dart';
import 'package:karry_go/utils/utils.dart';
import 'package:karry_go/widgets/logo.dart';
import 'package:karry_go/widgets/signUpBars.dart';

class Documents extends StatefulWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  void initState() {
    super.initState();
  }

  final photoController = TextEditingController();
  final LNController = TextEditingController();
  final LEDController = TextEditingController();

  bool licenseBool = false;
  bool photoBool = false;
  bool LNBool = false;
  bool LEDBool = false;

  String profilePhoto = "";
  String licensePhoto = "";
  String LN = "";
  String LED = "";

  Future next(Size size) async {
    LN = LNController.text.trim();
    LED = LEDController.text.trim();

    setState(() {
      LNBool = LN.length < 6 ? true : false;
      LEDBool = LED.length < 4 ? true : false;
    });

    if (LNBool == false &&
        LEDBool == false &&
        profilePhoto != "" &&
        licensePhoto != "") {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
            child: CircularProgressIndicator(
              color: AppColors.green,
            ),
          ),
        );

        Map<String, dynamic> userInfoMap = {
          "License Photo": licensePhoto,
          "License Number": LN,
          "License Expiry Date": LED,
          "Profile Photo": profilePhoto,
        };

        FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(userInfoMap);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return GuarantorDetails();
            },
          ),
        );
      } on FirebaseAuthException catch (e) {
        print(e);

        Utils.showSnackBar(e.message, size);
      }
    } else {
      Utils.showSnackBar("Please Fill All Required Documents", size);
    }
  }

  void processImage(XFile? file, Size size) async {
    final InputImage image = InputImage.fromFilePath(file!.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    await textRecognizer.close();
    if (recognizedText.text
        .toUpperCase()
        .contains("NATIONAL DRIVERS LICENCE")) {
      log("This is a Driver's licence");

      Reference reference = FirebaseStorage.instance
          .ref()
          .child("Images")
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("License Photo");

      try {
        //Store the File
        await reference.putFile(File(file!.path));

        //Success: get the download URL
        licensePhoto = await reference.getDownloadURL();
      } on Exception catch (e) {
        // TODO
      }

      Utils.showSnackBar("Updated Successfully", size);
      setState(() {
        licenseBool = true;
      });
      LNController.text = recognizedText.blocks[1].lines[0].elements[1].text;
      LEDController.text = recognizedText.blocks[10].lines[1].elements[1].text;
    } else {
      log("Please provide a Driver's license");
      Utils.showSnackBar("Please provide a Driver's license", size);
    }
  }

  @override
  void dispose() {
    photoController.dispose();
    LNController.dispose();
    LEDController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: size.width * 1,
          height: size.height * 1,
          color: AppColors.white,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.055,
                    ),
                    const Logo(
                      color: Colors.white,
                      position: MainAxisAlignment.start,
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RichText(
                          softWrap: true,
                          text: TextSpan(
                            text: "Documents",
                            style: TextStyle(
                              fontFamily: "Clash Grotesk",
                              fontSize: 24,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          softWrap: true,
                          text: TextSpan(
                            text:
                                "We’re legally required to ask you for some documents to sign you up as a driver. This should only take a minute 🫶🏾",
                            style: TextStyle(
                              fontFamily: "DM Sans",
                              fontSize: 12,
                              height: 1.7,
                              color: AppColors.subBlack,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SignUpBars(
                      size: size,
                      color1: AppColors.greenBar,
                      color2: AppColors.greenBar,
                      color3: AppColors.greenBar.withOpacity(0.38),
                      color4: AppColors.subWhite2,
                      color5: AppColors.subWhite2,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "Driver's License",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "DM Sans",
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Container(
                            height: size.height * 0.0545,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: licenseBool
                                    ? AppColors.green
                                    : AppColors.subWhite2,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * 0.564,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Visibility(
                                            visible: licenseBool ? true : false,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              "assets/images/image.png"))),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.025,
                                                ),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            textAlign: TextAlign.left,
                                            text: TextSpan(
                                              text: licenseBool
                                                  ? "License.jpg"
                                                  : "Upload driver's license",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "DM Sans",
                                                fontWeight: licenseBool
                                                    ? FontWeight.w700
                                                    : FontWeight.w400,
                                                color: licenseBool
                                                    ? AppColors.black
                                                    : AppColors.subBlack2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: licenseBool ? true : false,
                                        child: Icon(
                                          Icons.check_circle_rounded,
                                          size: 24,
                                          color: AppColors.green,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    imagePickerModal(
                                      context,
                                      size,
                                      onCameraTap: () {
                                        log("Camera");
                                        pickImage(source: ImageSource.camera)
                                            .then((value) {
                                          if (value != "") {
                                            processImage(value, size);
                                            /*imageCropperView(value, context)
                                                .then((value) async {
                                              if (value != "") {
                                              }
                                            });*/
                                          }
                                        });
                                      },
                                      onGalleryTap: () {
                                        log("Gallery");
                                        pickImage(source: ImageSource.gallery)
                                            .then((value) {
                                          if (value != "") {
                                            processImage(value, size);
                                            /*imageCropperView(value, context)
                                                .then((value) async {
                                              if (value != "") {
                                                */ /*Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return RecognizePage(
                                                        path: value,
                                                      );
                                                    },
                                                  ),
                                                );*/ /*

                                              }
                                            });*/
                                          }
                                        });
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    alignment: Alignment.center,
                                    width: size.width * 0.25,
                                    height: size.height * 0.045,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.green,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: licenseBool ? "Retake" : "Snap",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "DM Sana",
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          TextFieldsText(
                            fieldBool: LNBool,
                            controller: LNController,
                            hintText: "License Number",
                            enabled: licenseBool ? true : false,
                          ),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          TextFieldsText(
                            fieldBool: LEDBool,
                            controller: LEDController,
                            hintText: "License expiry date",
                            enabled: licenseBool ? true : false,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.028),
                      child: Divider(
                        color: AppColors.subWhite2,
                        thickness: 1,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "Driver’s Profile Photo",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "DM Sana",
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      softWrap: true,
                      text: TextSpan(
                        text:
                            "Please provide a clear portrait picture (not a full body picture) of yourself. It should show your full face, front view, with eyes open",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 12,
                          height: 1.7,
                          color: AppColors.subWhite3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Container(
                      height: size.height * 0.0545,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color:
                              photoBool ? AppColors.green : AppColors.subWhite2,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.564,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Visibility(
                                      visible: photoBool ? true : false,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "assets/images/image.png"),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.025,
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: photoBool
                                            ? "Profile.jpg"
                                            : "Upload profile photo",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "DM Sans",
                                          fontWeight: photoBool
                                              ? FontWeight.w700
                                              : FontWeight.w400,
                                          color: photoBool
                                              ? AppColors.black
                                              : AppColors.subBlack2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: photoBool ? true : false,
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    size: 24,
                                    color: AppColors.green,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              imagePickerModal(
                                context,
                                size,
                                onCameraTap: () {
                                  log("Camera");
                                  pickImage(source: ImageSource.camera)
                                      .then((value) async {
                                    if (value != "") {
                                      Reference reference = FirebaseStorage
                                          .instance
                                          .ref()
                                          .child("Images")
                                          .child(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .child("Profile Photo");

                                      try {
                                        //Store the File
                                        await reference
                                            .putFile(File(value!.path));

                                        //Success: get the download URL
                                        profilePhoto =
                                            await reference.getDownloadURL();
                                      } on Exception catch (e) {
                                        // TODO
                                      }

                                      setState(() {
                                        if (profilePhoto.isNotEmpty)
                                          photoBool = true;
                                        else
                                          photoBool = false;
                                      });
                                      /*imageCropperView(value, context)
                                          .then((value) async {
                                        if (value != "") {

                                        }
                                      });*/
                                    }
                                  });
                                },
                                onGalleryTap: () {
                                  log("Gallery");
                                  pickImage(source: ImageSource.gallery)
                                      .then((value) async {
                                    if (value != "") {
                                      Reference reference = FirebaseStorage
                                          .instance
                                          .ref()
                                          .child("Images")
                                          .child(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .child("Profile Photo");

                                      try {
                                        //Store the File
                                        await reference
                                            .putFile(File(value!.path));

                                        //Success: get the download URL
                                        profilePhoto =
                                            await reference.getDownloadURL();
                                      } on Exception catch (e) {
                                        // TODO
                                      }

                                      setState(() {
                                        if (profilePhoto.isNotEmpty)
                                          photoBool = true;
                                        else
                                          photoBool = false;
                                      });
                                      /*imageCropperView(value, context)
                                          .then((value) async {
                                        if (value != "") {

                                        }
                                      });*/
                                    }
                                  });
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(3),
                              alignment: Alignment.center,
                              width: size.width * 0.25,
                              height: size.height * 0.045,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.green,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  text: photoBool ? "Retake" : "Upload",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "DM Sana",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.016),
                child: Divider(
                  color: AppColors.subWhite2,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width * 0.41,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.subWhite2,
                            ),
                            child: Text(
                              "Go Back",
                              style: TextStyle(
                                fontFamily: "DM Sans",
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            next(size);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: size.width * 0.41,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.black),
                            child: Text(
                              "Next Step",
                              style: TextStyle(
                                fontFamily: "DM Sans",
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 12,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ), //apply style to all
                        children: [
                          TextSpan(
                            text: "All ",
                          ),
                          TextSpan(
                            text: "Kárry",
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: "Clash Grotesk SemiBold",
                            ),
                          ),
                          TextSpan(
                            text: "Go",
                            style: TextStyle(
                              fontFamily: "Space Grotesk",
                              color: AppColors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: " drivers' information are kept private",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldsText extends StatelessWidget {
  const TextFieldsText({
    Key? key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    required this.hintText,
    this.warningMessage,
    required this.fieldBool,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final String? warningMessage;
  final bool fieldBool;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      cursorColor: AppColors.subWhite,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.green, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: fieldBool ? Colors.red : AppColors.green, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: fieldBool ? Colors.red : AppColors.subWhite2, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.subWhite2, width: 1.0),
        ),
        contentPadding: EdgeInsets.all(14),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 13,
          fontFamily: "DM Sans",
          fontWeight: FontWeight.w400,
          color: AppColors.subWhite,
        ),
      ),
      style: TextStyle(
        fontSize: 13,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w400,
        color: AppColors.subWhite,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (user) {
        if (user != null && user.length < 2) {
          return warningMessage;
        } else {
          return null;
        }
      },
    );
  }
}
