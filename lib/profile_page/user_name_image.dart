import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

class UserNameImage extends StatelessWidget {
  final UserData user;

  UserNameImage({required this.user});

  @override
  Widget build(BuildContext context) {
    //Get the device Size
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        height: 290,
        width: mediaQuery.width,
        child: Stack(
          children: [
            Column(
              children: [
                //User Banner Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    user.userBannerUrl,
                    height: 160,
                    width: mediaQuery.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 130,
                  width: mediaQuery.width,
                  color: Colors.transparent,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/flame.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //User Profile Image
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        user.userImageUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  //User Name
                  Text(
                    user.name,
                    style: GoogleFonts.openSans(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  //                      //User Categorie
                  Text(
                    user.userCategory,
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
