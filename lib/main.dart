import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/NavItem.dart';
import 'package:recipe_app/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cathay Pass',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.primarySwatch),
          primarySwatch: AppColors.primarySwatch,
          fontFamily: 'OpenSans',
          // We apply this to our appBarTheme because most of our appBar have this style
          appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white), backgroundColor: AppColors.kPrimaryColor, elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
