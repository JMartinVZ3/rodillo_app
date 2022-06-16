part of 'widgets.dart';

class CustomSlide extends StatelessWidget {
  final String title;
  final Widget widget;
  const CustomSlide({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Expanded(
            child: widget,
          ),
          Text(
            title,
            style: Get.theme.textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
