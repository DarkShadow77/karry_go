import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';

Timestamp time = Timestamp.now();
void logoutModal(BuildContext context, Size size) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SizedBox(
          height: size.height * 0.178,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                height: size.height * 0.166,
                width: size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.015,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        softWrap: true,
                        text: TextSpan(
                          text: "Are you sure you want to Logout ?",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      width: size.width * 0.1,
                      height: size.height * 0.045,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          FirebaseAuth.instance.signOut();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.subWhite,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          minimumSize:
                              Size(size.width * 1, size.height * 0.045),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: "Yes",
                            style: TextStyle(
                              fontFamily: "DM Sans",
                              color: AppColors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.subWhite2,
                      thickness: 1,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      width: size.width * 0.1,
                      alignment: Alignment.center,
                      height: size.height * 0.045,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.subWhite,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          minimumSize:
                              Size(size.width * 1, size.height * 0.045),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: "No",
                            style: TextStyle(
                              fontFamily: "DM Sans",
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
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
              )
            ],
          ),
        );
      });
}
