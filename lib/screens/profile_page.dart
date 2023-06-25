import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

//Widgets
import '../profile_page/profile_card.dart';
import '../profile_page/followers_reward_cadr.dart';
import '../profile_page/profile_donations_card.dart';
import '../profile_page/profile_share_support_buttons.dart';
import '../widgets/my_back_button.dart';

class ProfilePage extends StatefulWidget {
  //Page route
  static const routeName = '/profile-page';
  final UserData user;

  ProfilePage({required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    //Get the device Size
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        leading: MyBackIcon(),
        title: Center(
          child: Text(
            'Profile',
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Image.asset(
            'assets/share.png',
            height: 25,
            width: 25,
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              //User Profile Data
              ProfileCard(user: widget.user),
              //Followers / Reward
              FollowersRewardCard(user: widget.user),
              //Profile Donnation Card
              ProfileDonationCard(user: widget.user),
              //Final
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ProfileShareSupportButtons(user: widget.user),
      ),
    );
  }
}
