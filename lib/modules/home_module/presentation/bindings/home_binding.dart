import 'package:get/get.dart';
import 'package:mvvm_app/core/base_data_sources/base_remote_data_source.dart';
import 'package:mvvm_app/modules/home_module/data/repository/home_repository_impl.dart';
import 'package:mvvm_app/modules/home_module/domain/repository/home_repository.dart';
import 'package:mvvm_app/modules/home_module/domain/usecases/get_all_coins_usecase.dart';
import 'package:mvvm_app/modules/home_module/presentation/controllers/home_page_controller.dart';

import '../../data/data_sources/home_local_data_source.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // Get.put<HomeLocalDataSource>(HomeLocalDataSourceImpl());
    // Get.lazyPut(()=>HomeLocalDataSourceImpl());
    Get.lazyPut<HomeRepository>(()=>HomeRepositoryImpl(
        // baseRemoteDataSource: Get.find<BaseRemoteDataSource>(),
        // homeLocalDataSource: Get.find<HomeLocalDataSourceImpl>()
      )
    );
    Get.lazyPut<GetAllCoinsUseCase>(() => GetAllCoinsUseCase(
      repository: Get.find<HomeRepository>()
    ));
    Get.lazyPut(()=>HomePageController());
  }

}