import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_app/modules/home_module/presentation/controllers/home_page_controller.dart';
class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(
      child:
      controller.obx(
            (state) => ListView.builder(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: Colors.grey.withOpacity(0.1)
              ),
                child: Text(state[index].symbol!));
          },
        ),
        onLoading: Center(child: CircularProgressIndicator()), // optional
        onError: (error) => Center(                            // optional
          child: Text('Error: $error',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),));
  }
}
