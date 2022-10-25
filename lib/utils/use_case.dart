import 'package:mvvm_app/core/client/failures.dart';
import 'package:mvvm_app/utils/either.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}

class Params {
  final bool? boolValue;
  final String? value;
  final String? title;
  final String? id;
  final Map<String, dynamic>? body;
  final String? contractAddress;
  final String? apiUrl;
  final String? assetPlatform;
  Params({this.value, this.title, this.body, this.boolValue,this.id,this.contractAddress,this.apiUrl,this.assetPlatform});
}