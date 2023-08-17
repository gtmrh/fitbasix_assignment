import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class WidgetUtil {
  static WidgetUtil? _instance;

  WidgetUtil._();

  factory WidgetUtil() {
    _instance ??= WidgetUtil._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }

  static int rotateH() {
    return 1;
  }

  static Widget loaderSpin() {
    return Center(
      child: SpinKitCircle(
        color: Colors.grey,
        // size: 140,
      ),
    );
  }

String toTitleCase(String input) {
  List<String> words = input.split(' ');
  String result = '';
  for (int i = 0; i < words.length; i++) {
    if (i > 0) {
      result += ' ';
    }
    if (words[i].isNotEmpty) {
      result += words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    }
  }
  return result;
}


  appLogo() {
    return const Image(
      image: AssetImage("assets/images/logo.jpg"),
      height: 130.0,
      width: 130.0,
      // color: Colors.white,

      alignment: AlignmentDirectional.center,
    );
  }

  appSmallLogo() {
    return const Image(
      image: AssetImage("assets/images/logo.jpg"),
      height: 100.0,
      width: 100.0,
      // color: Colors.white,

      alignment: AlignmentDirectional.center,
    );
  }

  closeApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit'),
          content: const Text('Are you sure you want to exit?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

}
