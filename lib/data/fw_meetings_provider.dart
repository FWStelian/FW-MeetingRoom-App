import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fw_meetings/models/booking_model.dart';
import 'package:fw_meetings/models/room_model.dart';

class FwMeetingsProvider {
  Future<List<BookingModel>> getMeetingsForRoom(String roomName) async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      return _buildBookingModelList(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load booked meetings');
    }
  }

  static List<BookingModel> _buildBookingModelList(List meetings) {
    List<BookingModel> temp = [];
    for (Map _booking in meetings) {
      final BookingModel meeting = BookingModel.fromJson(_booking);
      temp.add(meeting);
    }
    return temp;
  }
}
