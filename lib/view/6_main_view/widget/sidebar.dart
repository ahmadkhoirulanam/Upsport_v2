// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:sport/controller/6_main_controller/func_mainview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SideBarProfile extends StatelessWidget {
  final Animation<double>? sideBarTween;
  final AnimationController? sideBarAnim;
  final AnimationController? navBarAnim;
  SideBarProfile(
      {@required this.sideBarTween,
      @required this.sideBarAnim,
      @required this.navBarAnim});

  modeTema(context) => FuncMainView.switchTema(context);
  modeBahasa(context) => FuncMainView.switchBahasa(context);
  logOut(context) => FuncMainView.logout(context, () {
        sideBarAnim!.reverse();
      });
  goToUserProfile(context) => FuncMainView.goToUserProfile(context);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController(
        initialScrollOffset: getW(context, 1.2), keepScrollOffset: false);

    bool sideBarVisibleStatus =
        sideBarAnim!.status == AnimationStatus.dismissed;

    buttonWidget(
        {@required String? text,
        @required IconData? icon,
        @required Color? iconColor,
        @required VoidCallback? function}) {
      return CustomButton(
        styleId: 7,
        onPress: () => function!(),
        alignLeft: true,
        text: text!,
        horPadding: 0.02,
        prefixIconPadding: 0.02,
        prefixIcon: icon!,
        colorIcon: iconColor!,
      );
    }

    return (sideBarVisibleStatus)
        ? const SizedBox()
        : Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: Color.fromARGB(
                  ((1.0 - sideBarTween!.value) * 100).toInt(), 0, 0, 0),
              width: getW(context, 1),
              child: NotificationListener<UserScrollNotification>(
                onNotification: (onScroll) {
                  final ScrollDirection direction = onScroll.direction;
                  if (direction == ScrollDirection.forward) {
                    scrollController.animateTo(
                        scrollController.initialScrollOffset,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                    sideBarAnim!.reverse();
                    navBarAnim!.forward();
                  }
                  return true;
                },
                child: WidgetTween(
                  x: sideBarTween!.value * getW(context, 1),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: getW(context, 1)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: getW(context, 0.55),
                      height: getH(context, 1),
                      margin: EdgeInsets.only(
                          top: getW(context, 0.05),
                          right: getW(context, 0.05),
                          bottom: getW(context, 0.05)),
                      decoration: BoxDecoration(
                          color: Warna().backgroundColor(),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: getW(context, 0.05),
                                color: Colors.black26)
                          ],
                          borderRadius: BorderRadius.circular(
                            getW(context, 0.05),
                          )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getW(context, 0.02)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () => goToUserProfile(context),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: getW(context, 0.1)),
                                    constraints: BoxConstraints(
                                        maxWidth: getW(context, 0.45),
                                        minHeight: getW(context, 0.15)),
                                    padding:
                                        EdgeInsets.all(getW(context, 0.02)),
                                    decoration: BoxDecoration(
                                        color: Warna()
                                            .transparentBWColor(aplha: 10),
                                        borderRadius: BorderRadius.circular(
                                            getW(context, 0.02))),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Warna()
                                              .accentTransparentColor(
                                                  aplha: 50),
                                          radius: getW(context, 0.05),
                                          child: ImgLoader.examplePhoto1mini,
                                        ),
                                        CustomText(
                                          leftpad: 0.02,
                                          txt: "Stephen William",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          semibold: true,
                                          size: 0.032,
                                          width: 0.28,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                CustomButton(
                                  styleId: 3,
                                  borderRadius: 0.02,
                                  leftMargin: 0.03,
                                  rightMargin: 0.03,
                                  onPress: () => logOut(context),
                                  text: "LOG OUT",
                                  prefixIconPadding: 0.02,
                                  prefixIcon: Icons.logout,
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buttonWidget(
                                  function: () => modeTema(context),
                                  text: themeModeId == 0
                                      ? "Mode Terang"
                                      : themeModeId == 1
                                          ? "Mode Gelap"
                                          : "Sistem",
                                  icon: themeModeId == 0
                                      ? Icons.light_mode
                                      : themeModeId == 1
                                          ? Icons.dark_mode
                                          : Icons.settings,
                                  iconColor: themeModeId == 0
                                      ? Colors.yellow
                                      : themeModeId == 1
                                          ? Colors.blue.shade300
                                          : Colors.white54,
                                ),
                                buttonWidget(
                                  function: () => modeBahasa(context),
                                  text: "Indonesia",
                                  icon: Icons.language,
                                  iconColor: Colors.green,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomText(
                                  align: Alignment.bottomCenter,
                                  txt: "Blumb v0.0.1-beta",
                                  size: 0.03,
                                ),
                                CustomText(
                                  align: Alignment.bottomCenter,
                                  txt: "© Abiseka 2022",
                                  size: 0.03,
                                  botpad: 0.03,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
