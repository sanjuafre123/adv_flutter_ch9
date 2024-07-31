import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  Future<String?> fetchApiData() async {
    Uri url = Uri.parse('https://dummyjson.com/products');

    Response response = await http.get(url);

    if (response.statusCode == 200) {
      final json = response.body;
      return json;
    } else {
      return null;
    }
  }
}
