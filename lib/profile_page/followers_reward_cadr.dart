import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

//Widgets
import '../profile_page/profile_card.dart';

class FollowersRewardCard extends StatelessWidget {
  final UserData user;

  FollowersRewardCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          followersRewardContainer(
            'Followers',
            EneftyIcons.colorfilter_outline,
            user.userFollowers.toString(),
          ),
          followersRewardContainer(
            'Rewards',
            EneftyIcons.gift_outline,
            user.userRewards.toString(),
          ),
        ],
      ),
    );
  }

  Widget followersRewardContainer(String title, IconData icon, String data) {
    return Container(
      height: 100,
      width: 170,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.green,
              ),
              const SizedBox(width: 4),
              Text(
                title,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${data}k',
            style: GoogleFonts.openSans(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
