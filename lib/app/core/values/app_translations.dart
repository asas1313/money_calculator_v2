import 'package:get/get.dart';

import 'languages/en_US.dart';
import 'languages/lt_LT.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'lt_LT': lt_LT,
      };
}
