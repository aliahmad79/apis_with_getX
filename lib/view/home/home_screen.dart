import 'package:api_with_getx/controller/product_controller.dart';
import 'package:api_with_getx/view/home/widgets/product_shimmer.dart';
import 'package:api_with_getx/view/post_data/create_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Products"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => CreateData());
              },
              icon: Icon(Icons.forest)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcom Guest",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(child: Obx(
              () {
                return MasonryGridView.count(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var product = productController.productList[index];
                      if (productController.isLoading.value) {
                        return ProductShimmer();
                      } else {
                        return Card(
                          child: SizedBox(
                            height: 250,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    product.imageLink,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(product.name.toString()),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\$${product.price}"),
                                    Row(
                                      children: [
                                        Text(product.rating.toString()),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    });
              },
            )),
          ],
        ),
      ),
    );
  }
}
