import 'package:crowdfunding_app/screens/home_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

//Screens
import '../screens/profile_page.dart';
import '../screens/support_page.dart';

//Objects
import '../objects/user_data.dart';

//Providers
import '../providers/user_provider.dart';

class SupportButton extends StatefulWidget {
  final UserData user;
  final double ammount;
  final String pageID;

  SupportButton(
      {required this.user, required this.ammount, required this.pageID});

  @override
  State<SupportButton> createState() => _SupportButtonState();
}

class _SupportButtonState extends State<SupportButton> {
  var _isInit = true;

  var _updatadUser = UserData(
    id: '',
    name: '',
    userImageUrl: '',
    userBannerUrl: '',
    userCategory: '',
    userDescription: '',
    userFollowers: 0,
    userRewards: 0,
    donationGoal: 0,
    donationRecenved: 0,
    userSuporters: [],
  );

  var _initialValues = {
    'id': '',
    'name': '',
    'userImageUrl': '',
    'userBannerUrl': '',
    'userCategory': '',
    'userDescription': '',
    'userFollowers': 0,
    'userRewards': 0,
    'donationGoal': 0,
    'donationRecenved': 0,
    'userSuporters': [],
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isInit) {
      _updatadUser = Provider.of<UserProvider>(context, listen: false)
          .findByID(widget.user.id);
      _initialValues = {
        'id': _updatadUser.id,
        'name': _updatadUser.name,
        'userImageUrl': _updatadUser.userImageUrl,
        'userBannerUrl': _updatadUser.userBannerUrl,
        'userCategory': _updatadUser.userCategory,
        'userDescription': _updatadUser.userDescription,
        'userFollowers': _updatadUser.userFollowers,
        'userRewards': _updatadUser.userRewards,
        'donationGoal': _updatadUser.donationGoal,
        'donationRecenved': _updatadUser.donationRecenved,
        'userSuporters': _updatadUser.userSuporters,
      };
    }

    print('USER ID ${_updatadUser.id}');

    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    //Get the device size
    final mediaQuery = MediaQuery.of(context).size;

    //Load all User data
    final userData = Provider.of<UserProvider>(context, listen: false);
    final loadedUser = userData.user;

    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            width: mediaQuery.width - 30,
            child: OutlinedButton(
              child: Text(
                'Support',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: widget.ammount > 0
                  ? () async {
                      //Sum the Ammount
                      double newAmount =
                          widget.ammount + _updatadUser.donationRecenved;

                      //Update ete ammount
                      _updatadUser = UserData(
                        id: _updatadUser.id,
                        name: _updatadUser.name,
                        userImageUrl: _updatadUser.userImageUrl,
                        userBannerUrl: _updatadUser.userBannerUrl,
                        userCategory: _updatadUser.userCategory,
                        userDescription: _updatadUser.userDescription,
                        userFollowers: _updatadUser.userFollowers,
                        userRewards: _updatadUser.userRewards,
                        donationGoal: _updatadUser.donationGoal,
                        donationRecenved: newAmount,
                        userSuporters: _updatadUser.userSuporters,
                      );
                      await Provider.of<UserProvider>(context, listen: false)
                          .setDonation(
                              id: widget.user.id, updatadUser: _updatadUser);

                      if (widget.pageID == 'home') {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home-page',
                          (route) => false,
                        );
                      } else {
                        Navigator.of(context).pop();
                      }
                    }
                  : null,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                side: const BorderSide(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
