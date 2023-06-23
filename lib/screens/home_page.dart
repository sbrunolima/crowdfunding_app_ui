import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Widgets
import '../home_page/categories_container.dart';
import '../home_page/top_user_list.dart';
import '../home_page/creator_grid.dart';
import '../home_page/user_profile.dart';

//Providers
import '../providers/user_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get the device Size
    final mediaQuery = MediaQuery.of(context).size;

    //Load all user data
    final userData = Provider.of<UserProvider>(context, listen: false);
    final user = userData.user;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        title: UserProfile(),
        actions: const [
          Icon(
            Icons.notifications_none_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 15),
          Icon(
            Icons.menu,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  CategoriesContainer(
                      color: Colors.yellow, title: 'Cosplayer', isActive: true),
                  CategoriesContainer(
                      color: Colors.red, title: 'Streamer', isActive: false),
                  CategoriesContainer(
                      color: Colors.blue, title: 'Movies', isActive: false),
                  CategoriesContainer(
                      color: Colors.blue, title: 'Cosplay', isActive: false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //User LISTVIEW
            TopUserList(),
            //Creators TITLE
            topCreatorTitle(),
            //Creators GRID
            CreatorGrid(),
          ],
        ),
      ),
    );
  }

  Widget topCreatorTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Top Creators',
            style: GoogleFonts.openSans(
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Text(
                'See all',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward,
                size: 18,
                color: Colors.green,
              )
            ],
          ),
        ],
      ),
    );
  }
}
