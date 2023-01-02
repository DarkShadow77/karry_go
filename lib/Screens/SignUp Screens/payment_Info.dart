import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/SignUp%20Screens/success.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/TextField.dart';
import 'package:karry_go/widgets/logo.dart';
import 'package:karry_go/widgets/signUpBars.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({Key? key}) : super(key: key);

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  final accountController = TextEditingController();
  final nameController = TextEditingController();
  final holderController = TextEditingController();

  bool accountBool = false;
  bool nameBool = false;
  bool holderBool = false;

  String account = "";
  String name = "";
  String holder = "";
/*
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
              return Next();
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
  }*/

  @override
  void dispose() {
    accountController.dispose();
    nameController.dispose();
    holderController.dispose();
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
                            text: "Payment Info",
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
                                "Now all you need to do is put in your payment details so we can pay you 💳",
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
                      color4: AppColors.greenBar,
                      color5: AppColors.greenBar.withOpacity(0.38),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFieldText(
                            fieldBool: accountBool,
                            controller: accountController,
                            hintText: "Bank account number",
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldText(
                            fieldBool: nameBool,
                            controller: nameController,
                            hintText: "Bank Name",
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldText(
                            fieldBool: holderBool,
                            controller: holderController,
                            hintText: "Bank account holder name",
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(
                            height: size.height * 0.23,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Success();
                                },
                              ),
                            );
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
