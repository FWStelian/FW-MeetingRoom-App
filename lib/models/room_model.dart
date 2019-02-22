import 'package:fw_meetings/models/booking_model.dart';

class MeetingRoomModel {
  MeetingRoomModel.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        description = parsedJson['description'],
        location = parsedJson['location'],
        meetings = _buildBookingModelList(parsedJson["meetings"]);

  final String name;
  final String description;
  final String location;
  final List<BookingModel> meetings;

  static List<BookingModel> _buildBookingModelList(List meetings) {
    List<BookingModel> temp = [];
    for (Map _booking in meetings) {
      final BookingModel meeting = BookingModel.fromJson(_booking);
      temp.add(meeting);
    }
    return temp;
  }
}
