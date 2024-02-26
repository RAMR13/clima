import 'dart:convert';
import 'package:http/http.dart';

class NetworkingHelper {
  late final String Link;
  NetworkingHelper({required this.Link}) {}
  Future getData() async {
    Response response = await get(Uri.parse(Link));
    if (response.statusCode == 200) {
      String data = response.body;
      var decoded = jsonDecode(data);
      return decoded;
    }
  }
}
