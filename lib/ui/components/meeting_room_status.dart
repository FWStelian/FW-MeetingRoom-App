import 'package:flutter/material.dart';
import 'package:fw_meetings/models/booking_model.dart';
import 'package:fw_meetings/ui/theme/colors.dart';
import 'package:intl/intl.dart';

enum RoomStatus { FREE, MEETING_ABOUT_TO_START, MEETING_IN_PROGRESS }

/// This widget will show a different UI depending if the room is free, a meeting is in progress, or a meeting is about to start.
class RoomStatusWidget extends StatefulWidget {
  @override
  RoomState createState() => RoomState();
}

///this is where the state is actually updated
class RoomState extends State<RoomStatusWidget> {
  RoomStatus status = RoomStatus.FREE;

  /// display room name, time & date
  Widget _roomInfoWidget = _createRoomInfoWidget();

  /// is the room free,etc.
  Widget _roomStatusWidget = _createRoomStatusWidget();

  /// details about the meeting in progress
  Widget _roomCurrentBookingWidget = _createRoomCurrentBookingWidget();

  /// quickly book the meeting room
  Widget _quickBookWidget = _createQuickBooking();

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case RoomStatus.FREE:
        return _createFreeRoomUI();
      case RoomStatus.MEETING_ABOUT_TO_START:
        return _createAboutToStartUI();
      case RoomStatus.MEETING_IN_PROGRESS:
        return _createMeetingInProgressUI();
    }
  }

  /// book the meeting room starting now for the given duration
  void _handleQuickBook(Duration meetingDuration) {
//    Duration fastestMarathon = new Duration(hours:2, minutes:3, seconds:2);
  }

  void handleIncomingUpdate(List<BookingModel> roomBookings) {
    // determine if the
  }

  Widget _createFreeRoomUI() {
    return Container(
        padding: const EdgeInsets.all(32),
        color: freedomGreen,
        alignment: Alignment.center,
        child: Column(
          children: [
            _roomInfoWidget,
            _roomStatusWidget,
          ],
        ));
  }

  Widget _createAboutToStartUI() {}

  Widget _createMeetingInProgressUI() {}

  static Widget _createRoomInfoWidget() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Mordor(2.4), London',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 64.0,
                    ),
                  ),
                ),
                Text(
                  getCurrnetDateTime(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );
  }

  static Widget _createRoomStatusWidget() {
    return Container(
      child: Text(
        'Room is Available',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 124.0,
        ),
      ),
    );
  }

  static Widget _createRoomCurrentBookingWidget() {}

  static Widget _createQuickBooking() {}

  static String getCurrnetDateTime() {
    var dateFormatter = new DateFormat.yMMMMd("en_US");
    return dateFormatter.format(DateTime.now());
  }
}
