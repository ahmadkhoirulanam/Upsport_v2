// data id
// 0 = semua dokter
// 1 = bidan
// 2 = perawat
// 3 = fisioterapis
// 4 = ahli gizi
// 5 = terapis wicara
// 6 = akupunturis
// 7 = psikolog
// 8 = lainnya
// 9 = semua nakes

// ignore: must_be_immutable
// ignore: camel_case_types

import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/6_main_view/4_profil_view/3_riwayat_materi_view/widget/textstyle_manager.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import '../../../../0_global/3_custom_widget/custom_button.dart';

class CustomStaticDropdown extends StatefulWidget {
  final List? itemList;
  final String? title;
  final Function(String value)? onSelectedItem;
  final bool? enabled;
  final int? styleId;
  final double? width;
  final double? height;
  CustomStaticDropdown(
      {@required this.itemList,
      @required this.title,
      this.enabled,
      @required this.onSelectedItem,
      this.styleId,
      this.width,
      this.height});
  @override
  _CustomStaticDropdownState createState() => _CustomStaticDropdownState();
}

// ignore: must_be_immutable
// ignore: camel_case_types

class _CustomStaticDropdownState extends State<CustomStaticDropdown> {
  String initText = '';
  int initStyleId = 1;
  @override
  void initState() {
    super.initState();
    initText =
        (widget.styleId != null && widget.styleId == 2) ? '' : widget.title!;
    initStyleId = widget.styleId != null ? widget.styleId! : 1;
  }

  specialistFilter(BuildContext context) {
    List data = widget.itemList!;
    list() {
      return Container(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: getW(context, 0.03)),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return RawMaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.only(
                    left: getW(context, 0.03),
                    right: getW(context, 0.03),
                    top: getW(context, 0.03)),
                onPressed: () {
                  setState(() {
                    initText = data[index];
                  });
                  widget.onSelectedItem!(data[index]);
                  Navigator.pop(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          size: getW(context, 0.025),
                          color: Warna().accentColor(),
                        ),
                        spacingW(context, 0.02),
                        Expanded(
                            child: CustomText(txt: data[index], size: 0.037))
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            }),
      );
    }

    return NAlertDialog(
      dialogStyle: DialogStyle(
          titleDivider: true,
          backgroundColor: Warna().buttonColor1Background()),
      content: Container(
        height: getW(context, 1.4),
        width: getW(context, 0.7),
        margin: EdgeInsets.only(top: getW(context, 0.04)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title!,
              textAlign: TextAlign.center,
              style: helveticaNeue(context,
                  txtColor: Warna().fontColor1(),
                  txtWeight: FontWeight.bold,
                  txtSize: getW(context, 0.04)),
            ),
            Expanded(
              child: list(),
            )
          ],
        ),
      ),
      blur: 0,
    ).show(context,
        transitionType: DialogTransitionType.BottomToTop,
        transitionDuration: Duration(milliseconds: 200));
  }

  style1() {
    return CustomButton(
      styleId: 3,
      onPress: () => specialistFilter(context),
      text: initText,
      suffixIcon: Icons.arrow_drop_down,
    );
  }

  style2() {
    return GestureDetector(
      onTap: () => specialistFilter(context),
      child: Container(
        width: widget.width != null ? getW(context, widget.width!) : null,
        margin: EdgeInsets.symmetric(vertical: getW(context, 0.01)),
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: getW(context, 0.125)),
              margin: EdgeInsets.only(top: getW(context, 0.015)),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: getW(context, 0.006),
                      color: Warna().buttonColor1Background()),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      // width: getW(context, 0.7),
                      child: Padding(
                          padding: EdgeInsets.only(left: getW(context, 0.03)),
                          child: CustomText(
                              txt: initText,
                              overflow: TextOverflow.ellipsis,
                              size: 0.04,
                              color: (widget.enabled != null &&
                                      widget.enabled == true)
                                  ? Colors.grey
                                  : Warna().fontColor1()))),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getW(context, 0.02)),
                    child: Icon(Icons.keyboard_arrow_down_rounded,
                        color:
                            (widget.enabled != null && widget.enabled == true)
                                ? Colors.grey
                                : Warna().fontColor1()),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: getW(context, 0.02)),
              padding: EdgeInsets.symmetric(horizontal: getW(context, 0.01)),
              decoration:
                  BoxDecoration(color: Warna().buttonColor1Foreground()),
              child: CustomText(
                  txt: widget.title != null ? widget.title! : "",
                  bold: true,
                  color: Warna().accentColor70()),
            ),
          ],
        ),
      ),
    );
  }

  styleSelect() {
    if (initStyleId == 1) {
      return style1();
    } else
      return style2();
  }

  @override
  Widget build(BuildContext context) {
    return styleSelect();
  }
}
