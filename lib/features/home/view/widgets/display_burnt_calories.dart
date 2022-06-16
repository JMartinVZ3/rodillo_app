part of "widgets.dart";


class DisplayBurntCalories extends StatelessWidget {
  const DisplayBurntCalories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      margin: const EdgeInsets.only(right: 50),
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      decoration: const BoxDecoration(
        color: RodilloColors.blue,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(kBorderRadius * 2),
          topRight: Radius.circular(kBorderRadius * 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Calorias",
            style: Get.textTheme.bodyText2!.copyWith(
              color: RodilloColors.white,
            ),
          ),
          Text(
            "Quemadas",
            style: Get.textTheme.bodyText1!.copyWith(
              color: RodilloColors.white,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10 KM",
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: RodilloColors.white,
                    ),
                  ),
                  Text(
                    "Quemadas",
                    style: Get.textTheme.bodyText2!.copyWith(
                      color: RodilloColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "70%",
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: RodilloColors.white,
                    ),
                  ),
                  Text(
                    "Del Objetivo",
                    style: Get.textTheme.bodyText2!.copyWith(
                      color: RodilloColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "30 min",
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: RodilloColors.white,
                    ),
                  ),
                  Text(
                    "Tiempo",
                    style: Get.textTheme.bodyText2!.copyWith(
                      color: RodilloColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 20,
                right: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Text(
                        "Lun",
                        style: Get.textTheme.bodyText2!.copyWith(
                          color: RodilloColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        child: Container(
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Text(
                        "Mar",
                        style: Get.textTheme.bodyText2!.copyWith(
                          color: RodilloColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Expanded(
                        child: Container(
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Text(
                        "Mie",
                        style: Get.textTheme.bodyText2!.copyWith(
                          color: RodilloColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Container(
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Text(
                        "Jue",
                        style: Get.textTheme.bodyText2!.copyWith(
                          color: RodilloColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Text(
                        "Vie",
                        style: Get.textTheme.bodyText2!.copyWith(
                          color: RodilloColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Text(
                        "Sab",
                        style: Get.textTheme.bodyText2!.copyWith(
                          color: RodilloColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: Container(
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Text(
                        "Dom",
                        style: Get.textTheme.bodyText2!.copyWith(
                          color: RodilloColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
