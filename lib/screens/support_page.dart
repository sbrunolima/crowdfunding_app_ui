import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

//Widgets
import '../support_page/support_donations_card.dart';
import '../support_page/support_appbar.dart';
import '../support_page/donnation_ammout.dart';

class SupportPage extends StatefulWidget {
  final UserData user;
  final String pageID;

  SupportPage({required this.user, required this.pageID});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    //Const SizedBox
    const sizedBox = SizedBox(height: 20);
    const sizedBox1 = SizedBox(height: 30);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //APP BAR
            SupportAppBar(),
            sizedBox,
            //Creator TITLE
            creatorRirle(),
            sizedBox,
            //Creator GOAL CARD
            SupportDonationCard(user: widget.user),
            //Donation ammount
            sizedBox1,
            DonnationAmmount(
              user: widget.user,
              pageID: widget.pageID,
            ),
          ],
        ),
      ),
    );
  }

  Widget creatorRirle() {
    return Text(
      'Creator Goal',
      style: GoogleFonts.openSans(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
