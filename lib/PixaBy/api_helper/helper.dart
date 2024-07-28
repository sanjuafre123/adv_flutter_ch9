import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Helper
{
  Future<Map> fetchApiData(String search)
  async {
    Uri url = Uri.parse('https://pixabay.com/api/?key=45125752-380a2f3338a03301a149d0b54&q=$search&image_type=photo');

    Response response = await http.get(url);
    if(response.statusCode == 200)
    {
      final json = response.body;
      final Map data = jsonDecode(json);
      return data;
    }
    else {
      return {};
    }
  }
}