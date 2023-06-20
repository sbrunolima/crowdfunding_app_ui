import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Objects
import '../objects/user_data.dart';

class DonationBar extends StatefulWidget {
  final UserData user;

  DonationBar({required this.user});

  @override
  State<DonationBar> createState() => _DonationBarState();
}

class _DonationBarState extends State<DonationBar> {
  double _percent = 0;
  double _percentBar = 0;
  String _percentText = '';
  var _isInit = true;

  @override
  void initState() {
    super.initState();

    double _donationGoal = widget.user.donationGoal;
    double _donationRecenved = widget.user.donationRecenved;

    if (_isInit) {
      if (_donationGoal > _donationRecenved) {
        _percent = ((_donationGoal - _donationRecenved) / _donationGoal) * 100;

        _percentBar = ((_donationGoal - _donationRecenved) / _donationGoal);

        _percentText = (100 - _percent).toStringAsFixed(0);
      }

      if (_donationGoal == _donationRecenved) {
        _percentBar = 1;

        _percentText = '100';
      }

      if (_donationGoal < _donationRecenved) {
        _percent = ((_donationGoal + _donationRecenved) / _donationGoal) * 100;

        _percentBar = 1;

        _percentText = (_percent - 100).toStringAsFixed(0);
      }
    }

    _isInit = false;
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
