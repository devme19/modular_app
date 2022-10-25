import 'package:get_storage/get_storage.dart';
import 'package:mvvm_app/core/client/exception.dart';

abstract class HomeLocalDataSource {
  String getProfile();
}
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  GetStorage homeBox = GetStorage();
  String profileKey = "profileKey";
  @override
  String getProfile() {
    try {
      return homeBox.read(profileKey);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

}

