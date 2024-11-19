import 'package:flutter/material.dart';
import 'package:techpicks/widgets/left_panel.dart';
import 'package:techpicks/models/product_entry.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object Product
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }


@override
Widget build(BuildContext context) {
  final request = context.watch<CookieRequest>();
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Product List',
        style: TextStyle(
          fontFamily: 'Geist',
          fontWeight: FontWeight.w600,
          fontSize: 24,
          letterSpacing: -0.75,
          color: Colors.black,
        ),
      ),
    ),
    drawer: const LeftDrawer(),
    body: FutureBuilder(
      future: fetchProduct(request),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (!snapshot.hasData) {
            return const Column(
              children: [
                Text(
                  'No existing data in TechPicks. Try to add one.',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: -0.75,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}. ${snapshot.data![index].fields.name}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Geist',
                        letterSpacing: -0.75,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "${snapshot.data![index].fields.description}",
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: -0.75,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "IDR${NumberFormat("#,##0", "en_US").format(snapshot.data![index].fields.price)}",
                      style: TextStyle(
                        fontFamily: 'Geist',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: -0.75,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      },
    ),
  );
}
}