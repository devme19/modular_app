import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_app/core/client/client.dart';
import 'package:mvvm_app/main_binding/main_binding.dart';
import 'package:mvvm_app/routes/app_routes.dart';

void main() async{
  Client().init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: App.pages,
      initialBinding: MainBinding(),
      initialRoute: AppRoutes.homePage,

    );
  }
}