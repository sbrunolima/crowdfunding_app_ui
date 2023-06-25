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

class SupportPage extends StatefulWidget {
  final UserData user;

  SupportPage({required this.user});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //APP BAR
          Row(
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
          ),
          const SizedBox(height: 20),
          //Creator GOAL CARD
          Text(
            'Creator Goal',
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          //Creator GOAL CARD
          SupportDonationCard(user: widget.user),
        ],
      ),
    );
  }
}
