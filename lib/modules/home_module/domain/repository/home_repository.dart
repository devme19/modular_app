import 'package:mvvm_app/core/client/failures.dart';
import 'package:mvvm_app/modules/home_module/data/models/coin_model.dart';
import 'package:mvvm_app/utils/either.dart';

abstract class HomeRepository{
  Future<Either<Failure, List<CoinModel>>> getAllCoins();
}