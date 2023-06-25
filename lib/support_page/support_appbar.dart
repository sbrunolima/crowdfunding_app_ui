import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

//Widgets
import '../support_page/support_donations_card.dart';
import '../widgets/my_back_button.dart';

class SupportAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyBackIcon(),
        Text(
          'Supports',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const Icon(
          Icons.more_horiz_outlined,
          color: Colors.black,
          size: 26,
        ),
      ],
    );
  }
}
