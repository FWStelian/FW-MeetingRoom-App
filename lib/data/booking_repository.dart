import 'package:fw_meetings/data/fw_meetings_provider.dart';
import 'package:fw_meetings/models/booking_model.dart';

class BookingRepository {
  final fwMeetingProvider = FwMeetingsProvider();


  Future<List<BookingModel>> getMeetingsForRoom(String roomName) async {
    final response = await fwMeetingProvider.getMeetingsForRoom("Mordor");
    return response;
  }

}
