import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import '../app/app.locator.dart';
import '../services/connectivity_service.dart';
import 'constants.dart';

class Utils {
  static final _secureStorage = locator<FlutterSecureStorage>();
  // static final _snackbarService = locator<SnackbarService>();
  static final _connectivityService = locator<ConnectivityService>();

  static Future<bool> isConnected() async {
    return await _connectivityService.isConnected();
  }

  static storeToSecure(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static getFromSecure(String key) async {
    return await _secureStorage.read(key: key);
  }

  static deleteSecure(String key) async {
    await _secureStorage.delete(key: key);
  }

  static deleteAllSecure() async {
    await _secureStorage.deleteAll();
  }

  static deleteUser() async {
    await Utils.deleteSecure(Constants.userInfo);
    await Utils.deleteSecure(Constants.userToken);
  }

  static String comaSeparation(
    String amount, {
    bool withOutDecimal = false,
  }) {
    if (amount == '' || amount == ' ') {
      return '0';
    } else {
      // Remove any non-digit characters from the input string
      final numericString = amount.replaceAll(RegExp(r'[^0-9.]'), '');
      // Convert the numeric string to a double
      final numericValue = double.tryParse(numericString) ?? 0.0;
      // Format the numeric value as a string with comma separators and two decimal places
      final formattedAmount = numericValue.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},');
      if (withOutDecimal) {
        return formattedAmount.replaceAll(RegExp(r'\.\d+'), '');
      } else {
        return formattedAmount.toString();
      }
    }
  }

  static String getInitials(String name) {
    if (name != '') {
      String trimmedName = name.trim();
      List<String> splitedName = trimmedName.split(" ");
      String initialName = '';
      if (splitedName.length > 1) {
        for (var i = 0; i < 2; i++) {
          if (splitedName[i] != '' && splitedName[i] != '-') {
            initialName += splitedName[i][0];
          }
        }
        return initialName.toUpperCase();
      } else {
        initialName = splitedName[0][0].toUpperCase();
        return initialName.toUpperCase();
      }
    } else {
      return name;
    }
  }

  static String capitalize(String sentence, {bool inititialOnly = false}) {
    if (sentence.isEmpty) {
      return sentence;
    } else if (inititialOnly) {
      return sentence.isEmpty
          ? sentence
          : "${sentence[0].toUpperCase()}${sentence.substring(1)}";
    } else {
      List<String> words = sentence.split(" ");
      for (int i = 0; i < words.length; i++) {
        words[i] = "${words[i][0].toUpperCase()}${words[i].substring(1)}";
      }
      String capitalizedSentence = words.join(" ");
      return capitalizedSentence;
    }
  }

  static getUniqueTimeStamp() {
    var dated = DateTime.now();
    return '${dated.year.toString().substring(2)}${dated.month}${dated.day}${dated.hour}${dated.minute}${dated.second}';
  }

  static getFormatedDate(String dueDate) {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var inputDate = inputFormat.parse(dueDate);

    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate); //
    //  debugPrint(outputDate);
    return outputDate;
  }

  static bool validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
