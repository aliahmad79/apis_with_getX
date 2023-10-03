import 'package:api_with_getx/controller/product_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Text("data"),
          ElevatedButton(
            onPressed: () {
              Map<String, dynamic> data = {"name": "morpheus", "job": "leader"};
              productController.createProduct(data);
            },
            child: Text("Create"),
          ),
        ],
      )),
    );
  }
}
