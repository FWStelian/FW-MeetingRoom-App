import 'package:fw_meetings/models/booking_priority.dart';
import 'package:fw_meetings/models/booking_type.dart';
import 'package:fw_meetings/models/user_model.dart';

class BookingModel {
  BookingModel.fromJson(Map<String, dynamic> parsedJson)
      :
        id = parsedJson['id'],
        meetingRoomId = parsedJson['meeting_room_id'],
        ownerId = parsedJson['owner_id'],
        name = parsedJson['name'],
        startDate = _parsedDate(parsedJson['start_at']),
        endDate = _parsedDate(parsedJson['end_at']);

//        type = parsedJson['type'],
//        priority = parsedJson["priority"],
//        attendees = _buildUserModelList(parsedJson["attendees"]
// );

  final int id;
  final int meetingRoomId;
  final int ownerId;
  final String name;
  final DateTime startDate;
  final DateTime endDate;

//  final BookingType type;
//  final BookingPriority priority;
//  final List<UserModel> attendees;

  static DateTime _parsedDate(String timestamp) {
    DateTime parsed;
    try {
      parsed = DateTime.parse(timestamp);
    } catch (e) {
      parsed = DateTime.now();
    }
    return parsed;
  }

  static List<UserModel> _buildUserModelList(List users) {
    List<UserModel> temp = [];
    for (Map _user in users) {
      final UserModel article = UserModel.fromJson(_user);
      temp.add(article);
    }
    return temp;
  }
}
