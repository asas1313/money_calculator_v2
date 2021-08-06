import 'package:get/get.dart';

class CustomDropdownController extends GetxController {
  final String? labelText;
  final double? width;
  final List<String> list;
  var selectedValue = Rxn<String>();

  final Function(String? value) onChanged;

  CustomDropdownController({
    this.labelText,
    this.width,
    required this.list,
    required this.onChanged,
  });

  changeValue(String? value) {
    selectedValue.value = value;
    onChanged(value);
    notifyChildrens();
  }
}
