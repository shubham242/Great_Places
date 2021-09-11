import 'APIs.dart';
import 'dart:convert';
import 'package:http/http.dart';

class LocationHelper {
  static String genLocImg({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    Uri url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY',
    );
    final res = await get(url);
    return json.decode(res.body)['results'][0]['formatted_address'];
  }
}
