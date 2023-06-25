import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Providers
import '../providers/user_provider.dart';

//Widgets
import '../home_page/home_donation_card.dart';
import 'home_share_support_buttons.dart';

//Objects
import '../objects/user_data.dart';

class CardProfileData extends StatelessWidget {
  final UserData user;

  CardProfileData({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            //Profile Image
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user.userImageUrl,
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(width: 10),
            //Profile Name/Category
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  user.userCategory,
                  style: GoogleFonts.openSans(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        //Flame Icon
        SizedBox(
          height: 30,
          width: 30,
          child: Image.asset(
            'assets/flame.png',
            height: 30,
            width: 30,
          ),
        ),
      ],
    );
  }
}
