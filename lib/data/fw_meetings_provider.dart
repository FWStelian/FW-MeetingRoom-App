import 'package:fw_meetings/models/booking_model.dart';
import 'package:fw_meetings/models/room_model.dart';

class FwMeetingsProvider {
  Future<List<BookingModel>> getMeetingsForRoom(String roomName) async {
//    final response = await client.request(endpoint);
    return _buildBookingModelList(Iterable.empty());
  }

//  Future<BookingModel> getMeetingsForRoom(Endpoint endpoint, String roomName) async {
//    final apiKey = await kNewsApiKey();
//    final client = NewsapiClient(apiKey);
//    final response = await client.request(endpoint);
//    return ArticleCollectionModel.fromJson(response);
//  }

  static List<BookingModel> _buildBookingModelList(List meetings) {
    List<BookingModel> temp = [];
    for (Map _booking in meetings) {
      final BookingModel meeting = BookingModel.fromJson(_booking);
      temp.add(meeting);
    }
    return temp;
  }
}
