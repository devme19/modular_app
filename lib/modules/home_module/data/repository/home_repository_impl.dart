import 'package:dio/dio.dart';
import 'package:mvvm_app/core/base_data_sources/base_local_data_source.dart';
import 'package:mvvm_app/core/base_data_sources/base_remote_data_source.dart';
import 'package:mvvm_app/core/client/exception.dart';
import 'package:mvvm_app/core/client/failures.dart';
import 'package:mvvm_app/modules/home_module/data/data_sources/home_local_data_source.dart';
import 'package:mvvm_app/modules/home_module/data/models/coin_model.dart';
import 'package:mvvm_app/modules/home_module/domain/repository/home_repository.dart';
import 'package:mvvm_app/utils/either.dart';

class HomeRepositoryImpl extends BaseLocalDataSourceImpl with BaseRemoteDataSourceImpl implements HomeRepository {
  // final BaseRemoteDataSource? baseRemoteDataSource;
  // final HomeLocalDataSource? homeLocalDataSource;
  //
  // HomeRepositoryImpl({this.baseRemoteDataSource, this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<CoinModel>>> getAllCoins() async{
    try {
      Response response = await get(url: "https://api.coingecko.com/api/v3/coins/list",queryParameters: {});
      if(response.statusCode == 200) {
        List<CoinModel> list = [];
        // Map<String,dynamic> data = response.data;
        for(var item in response.data){
          list.add(CoinModel.fromJson(item));
        }
        return Right(list);
      }else {
        return Left(
            ServerFailure(errorCode: response.statusCode, errorMessage: response.statusMessage));
      }
    } on ServerException catch (e) {
      return Left(
          ServerFailure(errorCode: e.errorCode, errorMessage: e.errorMessage));
    }
  }


}