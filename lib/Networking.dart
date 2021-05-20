import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  Network(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var finalData = jsonDecode(data);
      return finalData;
    } else{
      print(response.statusCode);
    }
  }
}