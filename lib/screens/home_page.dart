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

class HomePage extends StatefulWidget {
  //Page route
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isInit = true;

  @override
  void initState() {
    super.initState();

    Provider.of<UserProvider>(context, listen: false).LoadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
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
                    imageURL: 'assets/ninja.png',
                    title: 'Cosplayer',
                    isActive: true,
                  ),
                  CategoriesContainer(
                    imageURL: 'assets/joystick.png',
                    title: 'Streamer',
                    isActive: false,
                  ),
                  CategoriesContainer(
                    imageURL: 'assets/movie.png',
                    title: 'Movies',
                    isActive: false,
                  ),
                  CategoriesContainer(
                    imageURL: 'assets/anime.png',
                    title: 'Anime',
                    isActive: false,
                  ),
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
