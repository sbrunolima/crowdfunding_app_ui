import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

class HomeDonationCard extends StatefulWidget {
  final UserData user;

  HomeDonationCard({required this.user});

  @override
  State<HomeDonationCard> createState() => _HomeDonationCardState();
}

class _HomeDonationCardState extends State<HomeDonationCard> {
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
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.user.userBannerUrl,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          //Objective banners
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width - 76,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              const SizedBox(height: 5),
                              percentText(
                                _percentText,
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
                ),
              ),
            ),
          ),
        ],
      ),
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
        const SizedBox(height: 5),
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

  Widget percentText(String percent) {
    return Text(
      '$percent%',
      style: GoogleFonts.openSans(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.green,
      ),
    );
  }
}
