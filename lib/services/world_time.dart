import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WorldTime {
  late String location; // Location name for the UI
  late String time; //time for that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDayTime; // true or false if day time or not
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 16 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not get time now, Please try gain later !';
    }
  }
}
