import 'package:flutter/material.dart';
import 'package:recipe_app/screens/booking/hotel.dart';
import 'package:recipe_app/screens/booking/flight.dart';
import 'package:recipe_app/screens/covid/menu.dart';
import 'package:recipe_app/screens/home/home_screen.dart';
import 'package:recipe_app/screens/profile/prrofile_screen.dart';
import 'package:recipe_app/screens/subscription/subscriptionpage.dart';

class NavItem {
  final int id;
  final Icon icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});

// If there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuid those widget those use this NavItems
class NavItems extends ChangeNotifier {
  // By default first one is selected
  int selectedIndex = 0;

  void chnageNavIndex({int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: Icon(Icons.home),
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: Icon(Icons.travel_explore),
      destination: MenuScreen(),
    ),
    NavItem(
      id: 4,
      icon: Icon(Icons.account_circle),
      destination: ProfileScreen(),
    ),
  ];
}
