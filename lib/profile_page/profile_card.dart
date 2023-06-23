import 'package:flutter/material.dart';

//Objects
import '../objects/user_data.dart';

//Widgets
import '../profile_page/user_name_image.dart';
import '../profile_page/user_description.dart';

class ProfileCard extends StatelessWidget {
  final UserData user;

  ProfileCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          //User Image and Name
          UserNameImage(user: user),
          //User Description
          UserDescription(user: user),
        ],
      ),
    );
  }
}
