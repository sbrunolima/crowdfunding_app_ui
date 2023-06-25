import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

class SupportDonationCard extends StatefulWidget {
  final UserData user;

  SupportDonationCard({required this.user});

  @override
  State<SupportDonationCard> createState() => _SupportDonationCardState();
}

class _SupportDonationCardState extends State<SupportDonationCard> {
  double _percentBar = 0;
  String _percentText = '';
  var _isInit = true;

  @override
  void initState() {
    super.initState();

    double donationGoal = widget.user.donationGoal;
    double donationReceived = widget.user.donationRecenved;

    if (_isInit) {
      _percentText = returnedPercentText(
        donationGoal: donationGoal,
        donationRecenved: donationReceived,
      );
      _percentBar = returnedPercentBar(
        donationGoal: donationGoal,
        donationRecenved: donationReceived,
      );
    }

    _isInit = false;
  }

  //Return the percent TEXT
  String returnedPercentText(
      {required double donationGoal, required double donationRecenved}) {
    //Text to be returned
    String textToReturn = '';
    double percent = 0;

    if (donationGoal > donationRecenved) {
      percent = ((donationGoal - donationRecenved) / donationGoal) * 100;

      textToReturn = (100 - percent).toStringAsFixed(0);
    }

    if (donationGoal == donationRecenved) {
      textToReturn = '100';
    }

    if (donationGoal < donationRecenved) {
      percent = ((donationGoal + donationRecenved) / donationGoal) * 100;

      textToReturn = (percent - 100).toStringAsFixed(0);
    }

    return textToReturn;
  }

  //Return the percent BAR
  double returnedPercentBar(
      {required double donationGoal, required double donationRecenved}) {
    //Text to be returned
    double percentToReturn = 0;

    if (donationGoal > donationRecenved) {
      percentToReturn = ((donationGoal - donationRecenved) / donationGoal);
    }

    if (donationGoal == donationRecenved) {
      percentToReturn = 1;
    }

    if (donationGoal < donationRecenved) {
      percentToReturn = 1;
    }

    return percentToReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Objective / Percentage
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dream PC',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              //Raised / Goal
              raisedGoal(
                'Raised',
                widget.user.donationRecenved.toStringAsFixed(0),
              ),
              raisedGoal(
                'Goals',
                widget.user.donationGoal.toStringAsFixed(0),
              ),
            ],
          ),
        ),
        LinearPercentIndicator(
          lineHeight: 8.0,
          percent: _percentBar < 1 ? 1 - _percentBar : 1,
          backgroundColor: Colors.grey.shade300,
          progressColor: Colors.green,
          barRadius: const Radius.circular(16),
        ),
      ],
    );
  }

  Widget raisedGoal(String title, String valor) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$$valor',
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
