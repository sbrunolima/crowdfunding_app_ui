import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/profile.jpg',
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '4 SEPTEMBER',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'BimaSp!',
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.notifications_none_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 15),
          Icon(
            Icons.menu,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          testContainer(Colors.red, 'ahdsfhkahksh'),
          testContainer(Colors.black, 'asd'),
          testContainer(Colors.blue, 'ahdsfhasdfasdfasdfkahksh'),
          testContainer(Colors.yellow, 'adf'),
          testContainer(Colors.orange, 'ahdsfhkassdahksh'),
          testContainer(Colors.green, 'ahdsfhkadsfadsfahksh'),
        ],
      ),
    );
  }

  Widget testContainer(Color color, String title) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: CircleAvatar(
                backgroundColor: color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
