import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

class UserDescription extends StatelessWidget {
  final UserData user;

  UserDescription({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Text(
            user.userDescription,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 6.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                socialMediaButtom('assets/google.png'),
                socialMediaButtom('assets/facebook.png'),
                socialMediaButtom('assets/instagram.png'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget socialMediaButtom(String imageUrl) {
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.shade100,
      ),
      child: Image.asset(
        imageUrl,
        height: 30,
        width: 30,
      ),
    );
  }
}
