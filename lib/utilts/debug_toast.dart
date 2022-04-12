import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rudaelmoslem/constants/constants.dart';


class DebugToast {
  static void show(String? mesage, {bool force = false}) {
    if (force || GetStorage().read(kIsDebugMode)) {
      Fluttertoast.showToast(msg: mesage!);
    }
  }
}
