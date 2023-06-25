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
import '../support_page/support_button.dart';

class DonnationAmmount extends StatefulWidget {
  final UserData user;
  final String pageID;

  DonnationAmmount({required this.user, required this.pageID});

  @override
  State<DonnationAmmount> createState() => _DonnationAmmountState();
}

class _DonnationAmmountState extends State<DonnationAmmount> {
  double ammount = 0;
  List<Color> color = [
    Colors.grey.shade200,
    Colors.grey.shade200,
    Colors.grey.shade200,
    Colors.grey.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    //Const SizedBOx
    const sizedBox = SizedBox(height: 30);
    //Get the device size
    final mediaQuery = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 80,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset(
                'assets/money.png',
              ),
            ),
          ),
        ),
        sizedBox,
        //Amount Donated Container
        Container(
          height: 55,
          width: mediaQuery.width - 150,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    ammount = ammount - 1;
                  });
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Text(
                '\$${ammount.toStringAsFixed(0)}',
                style: GoogleFonts.openSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    ammount = ammount + 1;
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        sizedBox,
        //Ammount Options
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  ammount = 10;
                  color[0] = Colors.green;
                  color[1] = Colors.grey.shade200;
                  color[2] = Colors.grey.shade200;
                  color[3] = Colors.grey.shade200;
                });
              },
              child: donnationOptions('10', color[0]),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ammount = 50;
                  color[0] = Colors.grey.shade200;
                  color[1] = Colors.green;
                  color[2] = Colors.grey.shade200;
                  color[3] = Colors.grey.shade200;
                });
              },
              child: donnationOptions('150', color[1]),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ammount = 150;
                  color[0] = Colors.grey.shade200;
                  color[1] = Colors.grey.shade200;
                  color[2] = Colors.green;
                  color[3] = Colors.grey.shade200;
                });
              },
              child: donnationOptions('100', color[2]),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ammount = 1000;
                  color[0] = Colors.grey.shade200;
                  color[1] = Colors.grey.shade200;
                  color[2] = Colors.grey.shade200;
                  color[3] = Colors.green;
                });
              },
              child: donnationOptions('1000', color[3]),
            ),
          ],
        ),
        sizedBox,
        //Donnation Benefit Text
        donnationBenefitText(),
        sizedBox,
        //Support Button
        SupportButton(
          user: widget.user,
          ammount: ammount,
          pageID: widget.pageID,
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  //Donnations Options WIDGET
  Widget donnationOptions(String ammount, Color color) {
    return Container(
      height: 45,
      width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: Text(
          '\$${ammount}',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  //Donnation Benefit Text
  Widget donnationBenefitText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        'Each treat grants access to exclusive content for 30 days',
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
