import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Screens
import './screens/home_page.dart';
import './screens/profile_page.dart';

//Providers
import './providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Crowdfunding App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
        },
      ),
    );
  }
}
