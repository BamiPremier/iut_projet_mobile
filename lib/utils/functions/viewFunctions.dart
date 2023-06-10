import 'package:Fahkap/styles/textStyle.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; 

class ViewFunctions {
  snackBar(String title, String body, bool correct) {
    // return Get.snackbar(
    //   title,
    //   body,
    //   icon: Icon(correct ? FontAwesomeIcons.check : Icons.error,
    //       color: correct ? Colors.greenAccent : Colors.red),
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.grey[500],
    //   borderRadius: 20,
    //   margin: EdgeInsets.all(20),
    //   colorText: Colors.white,
    //   duration: Duration(seconds: 5),
    //   // isDismissible: true,
    //   dismissDirection: DismissDirection.horizontal,
    //   forwardAnimationCurve: Curves.linear,
    // );

    Color? color = correct ? Colors.green : Colors.orange[600];
    return Get.snackbar(title, body,
        // icon: Icon(
        //   correct ? Icons. : Icons.wifi_off_sharp,
        //   color: correct ? Colors.greenAccent : Colors.red,
        // ),
        borderRadius: 5,
        isDismissible: true,
        onTap: (getBar) {},
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 10),
        barBlur: 20,
        shouldIconPulse: true,
        maxWidth: 1450,
        snackStyle: SnackStyle.FLOATING,
        leftBarIndicatorColor: color,
        backgroundColor: Colors.white);
  }

  void loading(title, description) {
    Get.snackbar(
      ' ', '',
      titleText: Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'OpenSan',
                fontWeight: FontWeight.w600,
                fontSize: 15),
          )),
      messageText: Container(
          margin: EdgeInsets.only(bottom: 5, left: 3),
          child: Text(
            description,
            style: TextStyle(fontFamily: 'OpenSan', fontSize: 12),
          )),
      icon: Container(
        margin: EdgeInsets.all(9),
        child: SpinKitWave(color: Colors.blueAccent, size: 23.0),
      ),
      borderRadius: 5,
      isDismissible: true,
      onTap: (getBar) {},
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 10),
      barBlur: 200,
      shouldIconPulse: true,
      // maxWidth: 1450,
      snackStyle: SnackStyle.FLOATING,
      leftBarIndicatorColor: Colors.green,
      backgroundColor: Colors.white,
      maxWidth: kWidth,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,

      borderWidth: 100,
      // showProgressIndicator: true,
    );
  }

  closeSnack() {
    //print('*****************************${Get.isSnackbarOpen}');
    Get.closeCurrentSnackbar();
    // Get.closeAllSnackbars();
  }

  toast(
    title,
  ) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    Get.snackbar(
      'Notification',
      'This is a WhatsApp Toast',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[600],
      colorText: Colors.white,
      margin: EdgeInsets.all(16),
      borderRadius: 16,
      duration: Duration(seconds: 3),
    );
  }  
  showToast(bool status) {
    Color? color = status ? Colors.green : Colors.orange[600];
    String message = !status
        ? "Votre appareil n'es pas connecté à Internet."
        : "Vous ête connecté.";
    Get.snackbar(
      status ? 'vous êtes en ligne maintenant' : 'vous êtes hors ligne',
      message,
      icon: Icon(
        status ? Icons.wifi : Icons.wifi_off_sharp,
        color: color,
      ),
      borderRadius: 5,
      isDismissible: true,
      onTap: (getBar) {},
      snackPosition: SnackPosition.TOP,
      duration:
          status ? const Duration(seconds: 4) : const Duration(seconds: 10),
      barBlur: 200,
      shouldIconPulse: true,
      maxWidth: kWidth,
      snackStyle: SnackStyle.GROUNDED,
      leftBarIndicatorColor: color,
      backgroundColor: Colors.white,
      margin: EdgeInsets.zero,
      // padding: EdgeInsets.zero,
      borderWidth: 100,
    );
  }

  showIndisponible() {
    Color? color = Colors.green;

    Get.snackbar('fonctionnalite', 'Bientot disponible...',
        icon: Icon(
          Icons.warning,
          color: color,
        ),
        borderRadius: 5,
        isDismissible: true,
        onTap: (getBar) {},
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        shouldIconPulse: true,
        maxWidth: 450,
        snackStyle: SnackStyle.GROUNDED,
        leftBarIndicatorColor: color,
        backgroundColor: Colors.white);
  }

  GetStorage box = GetStorage();

  getTheme(context) {
    //print("sarttttttttttttt----------------${box.read('isDark')}");

    return box.read('isDark') == null ? false : box.read('isDark');
  }

  changeTheme(context) {
    //print("----------------${box.read('isDark')}");
    if (Theme.of(context).brightness == Brightness.dark) {
      box.write('isDark', false);
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
      box.write('isDark', true);
    }
  }
}
