import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Screens
import '../screens/profile_page.dart';

//Providers
import '../providers/user_provider.dart';

//Widgets
import '../home_page/donation_bar.dart';
import '../home_page/share_support_buttons.dart';
import '../home_page/card_profile_data.dart';

class CreatorGrid extends StatefulWidget {
  @override
  State<CreatorGrid> createState() => _CreatorGridState();
}

class _CreatorGridState extends State<CreatorGrid> {
  @override
  Widget build(BuildContext context) {
    //Get the device Size
    final mediaQuery = MediaQuery.of(context).size;

    //Load all user data
    final userData = Provider.of<UserProvider>(context, listen: false);
    final user = userData.user;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: user.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        //Return a card with the user data
        return Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          user: user[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        //Profile Image & Name
                        //.........................................
                        CardProfileData(user: user[index]),
                        //End of Profile Image & Name
                        //.........................................
                        const SizedBox(height: 15),
                        //User Banner
                        DonationBar(user: user[index]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //Share / Support Button
                ShareSupportButtons(user: user[index]),
              ],
            ),
          ),
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 380,
        maxCrossAxisExtent: 400,
        childAspectRatio: 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
    );
  }
}
