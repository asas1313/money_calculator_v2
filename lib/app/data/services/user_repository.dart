import 'package:money_calculator_v2/app/data/model/user_model.dart';
import 'package:money_calculator_v2/app/data/provider/user_fb_provider.dart';

class UserRepository {
  final UserFbProvider provider;

  UserRepository({required this.provider});

  getAll() {
    return provider.getAll();
  }

  getId(String id) {
    return provider.getId(id);
  }

  save(UserModel model) {
    return provider.save(model);
  }
}
