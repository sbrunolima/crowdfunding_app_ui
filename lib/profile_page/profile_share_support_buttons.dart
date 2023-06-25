import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Screens
import '../screens/profile_page.dart';
import '../screens/support_page.dart';

//Objects
import '../objects/user_data.dart';

class ProfileShareSupportButtons extends StatelessWidget {
  final UserData user;

  ProfileShareSupportButtons({required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            width: 170,
            child: OutlinedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/share.png',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Share',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(color: Colors.grey.shade100),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 170,
            child: OutlinedButton(
              child: Text(
                'Support',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  builder: (context) => SupportPage(
                    user: user,
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                side: const BorderSide(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
