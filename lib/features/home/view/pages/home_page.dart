import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/config/common.dart';
import 'package:rodillo_app/features/auth/domain/entities/user.dart';
import 'package:rodillo_app/features/auth/view/controllers/user_controller.dart';
import 'package:rodillo_app/features/home/view/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          const SizedBox(height: kTopPadding),
          const _Header(),
          const DisplayBurntCalories(),
          Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Amigos",
                  style: Get.textTheme.headline4,
                ),
              )),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  height: 80,
                  decoration: BoxDecoration(
                    color: RodilloColors.white,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(0.05),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            image: DecorationImage(
                              image:
                                  Image.asset("assets/Nietzsche187a.jpg").image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Friedrich Nietzsche",
                          style: Get.textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "1st",
                          style: Get.textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    final User user = userController.user;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: RodilloColors.lightGrey,
                    borderRadius: BorderRadius.circular(kBorderRadius / 2),
                    image: DecorationImage(
                      image: Image.asset("assets/bike.jpg").image,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: Get.textTheme.bodyText2,
                  ),
                  Text(
                    user.lastName,
                    style: Get.textTheme.bodyText1,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10 KM",
                    style: Get.textTheme.bodyText1,
                  ),
                  Text(
                    "Recorridos hoy",
                    style: Get.textTheme.bodyText2!.copyWith(
                      color: RodilloColors.grey,
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
                    "+4 KM",
                    style: Get.textTheme.bodyText1,
                  ),
                  Text(
                    "Más que ayer",
                    style: Get.textTheme.bodyText2!.copyWith(
                      color: RodilloColors.grey,
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
                    "1ro",
                    style: Get.textTheme.bodyText1,
                  ),
                  Text(
                    "Entre amigos",
                    style: Get.textTheme.bodyText2!.copyWith(
                      color: RodilloColors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
