import 'package:flutter/material.dart';
import 'package:fw_meetings/data/booking_repository.dart';
import 'package:fw_meetings/models/booking_model.dart';

class UpcomingMeetingsWidget extends StatefulWidget {
  @override
  UpcomingMeetingsState createState() => UpcomingMeetingsState();
}

class UpcomingMeetingsState extends State<UpcomingMeetingsWidget> {
  List<BookingModel> upcomingMeetings = new List();
  BookingRepository repo = BookingRepository();

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
        itemCount: upcomingMeetings.length,
        itemBuilder: buildItem);
  }

  Widget buildItem(BuildContext ctxt, int index) {
    return Padding(
      child: new Text(upcomingMeetings[index].startDate.toIso8601String()),
      padding: EdgeInsets.all(16.0),
    );
  }

  void loadData() {
    repo.getMeetingsForRoom("Mordor").then((onValue) {
      this.setState(() {
        upcomingMeetings.addAll(onValue);
      });
    });
  }
}
