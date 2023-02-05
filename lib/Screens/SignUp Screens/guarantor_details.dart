import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:karry_go/Screens/SignUp%20Screens/payment_Info.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/utils.dart';
import 'package:karry_go/widgets/TextField.dart';
import 'package:karry_go/widgets/logo.dart';
import 'package:karry_go/widgets/signUpBars.dart';

class GuarantorDetails extends StatefulWidget {
  const GuarantorDetails({Key? key}) : super(key: key);

  @override
  State<GuarantorDetails> createState() => _GuarantorDetailsState();
}

class _GuarantorDetailsState extends State<GuarantorDetails> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  final formKeys = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final relationshipController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String dialCode = "";

  bool firstBool = false;
  bool lastBool = false;
  bool relationshipBool = false;
  bool emailBool = false;
  bool phoneBool = false;
  bool addressBool = false;

  String firstName = "";
  String lastName = "";
  String relationship = "";
  String email = "";
  String phoneNumber = "";
  String address = "";

  Future next(Size size) async {
    firstName = firstNameController.text.trim();
    lastName = lastNameController.text.trim();
    relationship = relationshipController.text.trim();
    email = emailController.text.trim();
    phoneNumber = dialCode + phoneController.text.trim();
    address = addressController.text.trim();

    print(phoneNumber);

    setState(() {
      firstBool = firstName.length < 2 ? true : false;
      lastBool = lastName.length < 2 ? true : false;
      emailBool = !EmailValidator.validate(email) ? true : false;
      relationshipBool = relationship.length < 4 ? true : false;
      phoneBool = phoneNumber.length < 10 ? true : false;
      addressBool = address.length < 10 ? true : false;
    });
    if (firstBool == false &&
        lastBool == false &&
        relationshipBool == false &&
        emailBool == false &&
        phoneBool == false &&
        addressBool == false) {
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

        log("All False");
        Map<String, dynamic> userInfoMap = {
          "firstName": firstName,
          "lastName": lastName,
          "relationship": relationship,
          "email": email,
          "phoneNumber": phoneNumber,
          "address": address,
        };

        log("All Mapped");

        FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("Guarantor Details")
            .add(userInfoMap);

        log("All saved");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PaymentInfo();
            },
          ),
        );
      } on FirebaseAuthException catch (e) {
        print(e);

        Utils.showSnackBar(e.message, size);
      }
    } else {
      Utils.showSnackBar("Please Fill All Required Fields", size);
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    relationshipController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
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
                            text: "Guarantor Details",
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
                                "You’re almost there, now we just need you to fill in your guarantor’s information ✍🏾",
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
                      color3: AppColors.greenBar,
                      color4: AppColors.greenBar.withOpacity(0.38),
                      color5: AppColors.subWhite2,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFieldText(
                            fieldBool: firstBool,
                            controller: firstNameController,
                            hintText: "Guarantor's first name",
                            textInputAction: TextInputAction.next,
                            warningMessage: "Enter a Valid First Name",
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldText(
                            fieldBool: lastBool,
                            controller: lastNameController,
                            hintText: "Guarantor's last name",
                            textInputAction: TextInputAction.next,
                            warningMessage: "Enter a Valid Last Name",
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldText(
                            fieldBool: relationshipBool,
                            controller: relationshipController,
                            hintText: "Relationship with guarantor",
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldEmail(
                            fieldBool: emailBool,
                            controller: emailController,
                            hintText: "Guarantor's email",
                            textInputAction: TextInputAction.next,
                            warningMessage: "Enter a Valid Email",
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: phoneBool
                                      ? Colors.red
                                      : AppColors.subWhite2,
                                  width: 1.0),
                            ),
                            child: Stack(
                              children: [
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber value) {
                                    int phoneLength =
                                        value.phoneNumber.toString().length;
                                    dialCode = value.dialCode.toString();

                                    setState(() {
                                      phoneBool =
                                          phoneLength < 14 ? true : false;
                                    });
                                  },
                                  fieldKey: formKeys,
                                  textFieldController: phoneController,
                                  initialValue: PhoneNumber(
                                    isoCode: "NG",
                                  ),
                                  cursorColor: AppColors.subWhite,
                                  selectorConfig: SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                    setSelectorButtonAsPrefixIcon: true,
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.subWhite,
                                  ),
                                  inputDecoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Guarantor's phone number",
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "DM Sans",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.subWhite,
                                    ),
                                  ),
                                  maxLength: 12,
                                  searchBoxDecoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: AppColors.green,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: AppColors.subWhite2,
                                        width: 1.0,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(14),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "DM Sans",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.subWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldText(
                            fieldBool: addressBool,
                            controller: addressController,
                            hintText: "Guarantor's Address",
                            textInputAction: TextInputAction.done,
                            warningMessage: "Enter a min. 10 Characters",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.016,
                ),
                child: Divider(
                  color: AppColors.subWhite2,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
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
                              color: AppColors.black,
                            ),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.13),
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                        text: TextSpan(
                          text:
                              "Guarantor will be required to come for physical verification",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 12,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
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
      ),
    );
  }
}
