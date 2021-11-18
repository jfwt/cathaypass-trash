import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/NavItem.dart';
import 'package:recipe_app/models/task.dart';
import 'package:recipe_app/screens/covid/menu.dart';
import 'package:recipe_app/screens/home/home_screen.dart';
import 'package:recipe_app/widgets/calendarpage.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Task task = Task(
      iconData: Icon(Icons.person_rounded),
      title: 'Personal',
      bgColor: Colors.purple,
      iconColor: Colors.orange,
      btnColor: Colors.yellow,
      left: 3,
      done: 1,
      desc: [
        {
          'time': '9:00 am',
          'title': 'Arrive at Airport',
          'slot': '9:00 - 10:00 am',
          'tlColor': Colors.red,
          'bgColor': Colors.yellow,
        },
        {
          'time': '10:00 am',
          'title': 'Go to Hotel',
          'slot': '10:00 - 11:00 am',
          'tlColor': Colors.green,
          'bgColor': Colors.amber,
        },
        {
          'time': '11:00 am',
          'title': '',
          'slot': '',
          'tlColor': Colors.grey.withOpacity(0.3),
          'bgColor': Colors.grey.withOpacity(0.3),
        }
      ]);
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
         home: MenuScreen(),
        //home: CalendarPage(task),
      ),
    );
  }

  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Firebase'),
  //       ),
  //       floatingActionButton: FloatingActionButton(
  //         onPressed: () => FirebaseFirestore.instance
  //             .collection('testing')
  //             .add({'timestamps': Timestamp.fromDate(DateTime.now())}),
  //         child: Icon(Icons.add),
  //       ),
  //       body: StreamBuilder(
  //         stream:
  //             FirebaseFirestore.instance.collection('testing').snapshots(),
  //         builder: (
  //           BuildContext content,
  //           AsyncSnapshot<QuerySnapshot> snapshot,
  //         ) {
  //           if (!snapshot.hasData) return const SizedBox.shrink();
  //           return ListView.builder(
  //             itemCount: snapshot.data.docs.length,
  //             itemBuilder: (BuildContext content, int index) {
  //               final docData = snapshot.data.docs[index];
  //               print('executed!');
  //               final dateTime =
  //                   (docData['timestamp'].data() as Timestamp).toDate();
  //               return ListTile(
  //                 title: Text(dateTime.toString()),
  //               );
  //             },
  //           );
  //         },
  //       ),
  //     ),

  //   ),
  // );
}
