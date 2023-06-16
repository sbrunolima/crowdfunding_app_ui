import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//Widgets
import '../home_page/categories_container.dart';

//Providers
import '../providers/user_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
          SizedBox(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 2),
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.green,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  user[index].userImageUrl,
                                  fit: BoxFit.cover,
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        user[index].name,
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
