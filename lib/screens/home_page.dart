import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Widgets
import '../home_page/categories_container.dart';
import '../home_page/top_user_list.dart';
import '../home_page/donation_bar.dart';

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/profile.jpg',
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '4 SEPTEMBER',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'BimaSp!',
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
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
            TopUserList(),
            topCreatorTitle(),
            GridView.builder(
              shrinkWrap: true,
              itemCount: user.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                //Retur a caard with the user data
                print(
                    'test => ${((user[index].donationGoal - user[index].donationRecenved) / user[index].donationGoal) * 100}');
                return Column(
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          children: [
                            //Profile
                            //.........................................
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    //Profile Image
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        user[index].userImageUrl,
                                        height: 60,
                                        width: 60,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    //Profile Name/Category
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user[index].name,
                                          style: GoogleFonts.openSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          user[index].userCategory,
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
                              //End of Profile
                              //.........................................
                            ),
                            const SizedBox(height: 15),

                            //User Banner
                            DonationBar(user: user[index]),
                            const SizedBox(height: 10),
                            Container(
                              height: 100,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 420,
                maxCrossAxisExtent: 400,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
            ),
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
              fontWeight: FontWeight.w600,
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
