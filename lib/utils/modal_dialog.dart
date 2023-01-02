import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';

void imagePickerModal(BuildContext context, Size size,
    {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SizedBox(
          height: size.height * 0.184,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                height: size.height * 0.11,
                width: size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      width: size.width * 0.1,
                      height: size.height * 0.045,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: onCameraTap,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.subWhite,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          minimumSize:
                              Size(size.width * 1, size.height * 0.045),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: "Take Photo",
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
                        onPressed: onGalleryTap,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.subWhite,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          minimumSize:
                              Size(size.width * 1, size.height * 0.045),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: "Choose Photo",
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
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.subWhite,
                    alignment: Alignment.center,
                    minimumSize: Size(size.width * 1, size.height * 0.06),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      text: "Cancel",
                      style: TextStyle(
                        fontFamily: "DM Sans",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xffeb5757),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
