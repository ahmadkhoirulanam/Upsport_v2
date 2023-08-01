// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/6_main_view/5_user_view/widget/organisasi_diikuti.dart';
import 'package:sport/view/6_main_view/5_user_view/widget/user_info.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> with TickerProviderStateMixin {
  late Animation<double> sampulTween;
  late AnimationController sampulAnim;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    initial();
    super.initState();
  }

  initial() {
    GlobalTweenAnimation.zeroToOneTween(context, this, setValue: (tween, anim) {
      sampulTween = tween;
      sampulAnim = anim;
    }, timerFunc: () {});
  }

  double scrollValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().backgroundColor(),
      body: StatefulBuilder(builder: (context, minSetstate) {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotif) {
            if (scrollController.position.pixels <= getW(context, 0.5)) {
              print(scrollController.position.pixels);
              minSetstate(() {
                scrollValue = scrollController.position.pixels;
              });
            }
            return true;
          },
          child: Stack(
            children: [
              WidgetTween(
                y: -scrollValue / 2,
                child: SizedBox(
                    height: getW(context, 0.6),
                    width: getW(context, 1),
                    child: ClipRRect(
                      child: Image.network(
                        "https://lh4.googleusercontent.com/proxy/4neeG_iGWi0U38kUMnFYUFilVXfmQjt5JEY6yJtiVmgFJNZCUScfLPNJqPrP0z4E-qcQXeXP8pgp_sKdbH1lXVSOqEN5aMdSxsS9m1blDlef1Dl_cCRjoe5URs6o8IVuQe1R9pyngCG9ADfzy26dSRDlmCjurorLtR9pUIGE8w=s0-d",
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.only(top: getW(context, 0.5)),
                child: Container(
                  width: getW(context, 1),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
                  decoration: BoxDecoration(
                      color: Warna().backgroundColor(),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(getW(context, 0.05)),
                          topRight: Radius.circular(getW(context, 0.05)))),
                  child: WidgetTween(
                    y: -getW(context, 0.13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserInfo(),
                        OrganisasiDiikuti(),
                        Padding(
                          padding: EdgeInsets.only(
                              top: getW(context, 0.05),
                              bottom: getW(context, 0.03)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacingH(context, 0.01),
                              CustomButton(
                                onPress: () {},
                                height: 0.1,
                                botMargin: 0.03,
                                borderRadius: 0.03,
                                text: "Edit Profil",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
