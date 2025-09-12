import 'dart:convert';
import 'package:housing_flutter_app/confige/helper/api_helper.dart';
import 'package:http/http.dart' as http;


class GoogleMapApi {
  GoogleMapApi._();

  static final GoogleMapApi instance = GoogleMapApi._();
  Future<Map<String, dynamic>?> getPlacePredictions(String city) async {
    try {
      final Uri url = Uri.parse(
        "${ApiConfig.googleMapApi}&input=$city"
        
        ,
      );

      final http.Response response = await http.get(url,headers: {'Content-type' : 'application/json'});

      if (response.statusCode == 200) {
        print("Map respons=========${response.body}");

        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        print("❌ Failed with status: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Error fetching predictions: $e");
      return null;
    }
  }
}
