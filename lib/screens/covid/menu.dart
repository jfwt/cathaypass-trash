import 'package:flutter/material.dart';
import 'package:recipe_app/components/custom_nav_bar.dart';
import 'package:recipe_app/components/my_bottom_nav_bar.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/screens/covid/tripcard.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String destination = 'Seoul';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          // _buildYourOwnTest(screenHeight),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome Andrew!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'You have 2 trips left in 2021!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            TripCard(
              tripNumber: 'Trip 1',
              destination: destination,
              destinationList: ['Seoul', 'Busan', 'Tokyo', 'Singapore', 'Bangkok', 'Sydney (+HKD1,000)', 'Paris (+HKD2,000)'],
            ),
            SizedBox(height: 32,),
            TripCard(
              tripNumber: 'Trip 2',
              destination: destination,
              destinationList: ['Seoul', 'Busan', 'Tokyo', 'Singapore', 'Bangkok', 'Sydney (+HKD1,000)', 'Paris (+HKD2,000)'],
            ),
            SizedBox(height: 32,),
            TripCard(
              tripNumber: 'Trip 3',
              destination: destination,
              destinationList: ['Seoul', 'Busan', 'Tokyo', 'Singapore', 'Bangkok', 'Sydney (+HKD1,000)', 'Paris (+HKD2,000)'],
            ),
          ],
        )
      ),
    );
  }
}
