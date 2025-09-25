import 'package:commerce/app/data/response/products.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  Future<List<Products>> fetchData() async {
    final response = await http.get(
      Uri.parse("${dotenv.get("BASE_URL")}/products"),
    );

    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}
