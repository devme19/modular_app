import 'package:mvvm_app/core/client/failures.dart';
import 'package:mvvm_app/modules/home_module/data/models/coin_model.dart';
import 'package:mvvm_app/modules/home_module/domain/repository/home_repository.dart';

import 'package:mvvm_app/utils/either.dart';
import 'package:mvvm_app/utils/use_case.dart';

class GetAllCoinsUseCase implements UseCase<List<CoinModel>,NoParams>{
  final HomeRepository? repository;

  GetAllCoinsUseCase({this.repository});

  @override
  Future<Either<Failure, List<CoinModel>>> call(NoParams params) {
    return repository!.getAllCoins();
  }
}