import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodillo_app/config/common.dart';
import 'package:rodillo_app/config/routes/app_routes.dart';
import 'package:rodillo_app/core/services/auth_service.dart';
import 'package:rodillo_app/features/auth/view/controllers/user_controller.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Column(
      children: <Widget>[
        
        const _Header(),
        Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: RodilloColors.lightGrey,
          ),
          child: Material(
            color: RodilloColors.lightGrey,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bienvenid@",
                          style: Get.textTheme.bodyText1,
                        ),
                        Text(
                          userController.user.name +
                              " " +
                              userController.user.lastName,
                          style: Get.textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: RodilloColors.white,
                      ),
                      child: const Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Divider(
            color: RodilloColors.grey,
            thickness: 1,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: const Color(0xFFFFEDED),
          ),
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: const Color(0xFFFFEDED),
            child: InkWell(
              onTap: () async {
                await AuthService.deleteToken();
                Get.back();
                Get.back();
                Get.toNamed(Routes.SLIDESHOW);
              },
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text("Cerrar Sesión",
                        style: Get.textTheme.bodyText1!.copyWith(
                          color: const Color(0xFFFF0000),
                        )),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kTopPadding,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cuenta",
            style: Get.textTheme.headline3,
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 5,
                color: RodilloColors.blue.withOpacity(0.15),
              )
            ]),
            child: Material(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: RodilloColors.blue,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {},
                child: const Center(
                  child: Icon(
                    Icons.settings,
                    color: RodilloColors.white,
                    size: kIconSize - 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
