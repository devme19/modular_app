import 'package:get/get.dart';
import 'package:mvvm_app/modules/home_module/data/models/coin_model.dart';
import 'package:mvvm_app/utils/use_case.dart';

import '../../domain/usecases/get_all_coins_usecase.dart';

class HomePageController extends GetxController with StateMixin<List<CoinModel>>{

  getAllCoins(){
    GetAllCoinsUseCase getAllCoins = Get.find();
    getAllCoins.call(NoParams()).then((response) {
      if(response.isRight){
        change(response.right,status: RxStatus.success());
      }else if(response.isLeft){
        change(null,status: RxStatus.error());
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    getAllCoins();
  }
}