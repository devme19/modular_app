import 'package:get_storage/get_storage.dart';
import 'package:mvvm_app/core/client/exception.dart';

abstract class BaseLocalDataSource{
  String getToken();
  String getRefreshToken();
  bool saveRefreshToken(String refreshToken);
  bool saveToken(String token);
}
class BaseLocalDataSourceImpl implements BaseLocalDataSource{
  GetStorage box = GetStorage();
  String tokenKey = "tokenKey";
  String refreshTokenKey = "refreshTokenKey";

  @override
  String getRefreshToken() {
    try {
      return box.read(refreshTokenKey);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  String getToken() {
    try {
      return box.read(tokenKey);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  bool saveRefreshToken(String refreshToken) {
    try {
      box.write(tokenKey, refreshToken);
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  bool saveToken(String token) {
    try {
      box.write(tokenKey, token);
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

}