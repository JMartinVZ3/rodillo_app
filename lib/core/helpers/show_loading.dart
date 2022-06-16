part of 'helpers.dart';

/// Function That Shows The Default Loading Dialog
void showLoading() {
  Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          kBorderRadius,
        )),
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        backgroundColor: RodilloColors.blue,
        content: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius)),
          child: const LinearProgressIndicator(
            color: RodilloColors.blue,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
      barrierDismissible: false);
}
