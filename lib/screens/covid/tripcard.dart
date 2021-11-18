import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/screens/booking/flight.dart';
import 'package:recipe_app/size_config.dart';

class TripCard extends StatefulWidget {
  String _tripNumber;
  String _destination;
  List<String> _destinationList;
  TripCard({String tripNumber, String destination, List<String> destinationList,}) : _tripNumber = tripNumber, _destination = destination, _destinationList = destinationList;

  @override
  _TripCardState createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  DateTimeRange initialDateRange = DateTimeRange(start: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day+7), end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day+14));
  DateTimeRange pickedDateRange;
  static DateFormat dateFormatEn = DateFormat('dd MMM');

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth*0.9,
        height: 180,
        padding: EdgeInsets.fromLTRB(16,16,16,24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage('assets/images/${widget._destination.toLowerCase().split(' ').first}.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 4),
                  child: Text(widget._tripNumber, style: TextStyle(fontSize: 32, color: AppColors.kPrimaryColor, fontWeight: FontWeight.w600),),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen()));
                    },
                    child: Icon(Icons.edit))
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(child: Text('Destination', style: TextStyle(fontWeight: FontWeight.w600),), padding: EdgeInsets.only(left: 8),),
                      SizedBox(height: 8,),
                      Container(
                        padding: EdgeInsets.fromLTRB(16,0,8,0),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            items: widget._destinationList.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14),),
                              );
                            }).toList(),
                            value: widget._destination,
                            onChanged: (val) => setState(() => widget._destination = val,
                          ),
                        ),
                      ))
                    ]
                  ),
                ),
                SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(child: Text('Date', style: TextStyle(fontWeight: FontWeight.w600),), padding: EdgeInsets.only(left: 8),),
                    SizedBox(height: 8,),
                    Container(
                      padding: EdgeInsets.fromLTRB(16,0,8,0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white, ),
                      child: Row(
                        children: [
                          //pickedDateRange!=null ? Text('${dateFormatEn.format(pickedDateRange.start)} - ${dateFormatEn.format(pickedDateRange.end)}') :
                          Text('${dateFormatEn.format(initialDateRange.start)} - ${dateFormatEn.format(initialDateRange.end)}'),
                          Container(
                              width: 32, height: 40,
                              child: IconButton(
                                  onPressed: () {dateTimeRangePicker();},
                                  icon: Icon(Icons.calendar_today, size: 20,)
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }

  dateTimeRangePicker() async {
    pickedDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: DateTimeRange(start: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day+7), end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day+14)),
        firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime.utc(2022, 12, 31),
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.8, maxHeight: 540),
                  child: child,
                ),
              )
            ],
          );
        });
    setState(() {
      pickedDateRange = pickedDateRange;
    });
    // print(pickedDateRange);
  }
}