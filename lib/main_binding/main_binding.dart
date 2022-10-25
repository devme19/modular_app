import 'package:get/get.dart';
import 'package:mvvm_app/core/base_data_sources/base_local_data_source.dart';
import 'package:mvvm_app/core/base_data_sources/base_remote_data_source.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<BaseLocalDataSource>(BaseLocalDataSourceImpl());
    Get.put<BaseRemoteDataSource>(BaseRemoteDataSourceImpl());
  }
  
}