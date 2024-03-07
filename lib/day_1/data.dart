
 import 'package:dio/dio.dart';

class DioHelper {

  // DioHelper({number});

  Future<void> getData() async {
    final dio = Dio();
    final response = await dio.get('https://fakestoreapi.com/products/');

    final List<dynamic> productList = [];

    final data = response.data as List; // Cast the data to a list

    for (int i = 0; i < data.length; i++) {
      // Access each product using data[i]
      final product = data[i];
      final title = product['title'] as String;

      productList.add(title);

      print(product);


    }
  }

 }