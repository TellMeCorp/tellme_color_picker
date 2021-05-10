import 'package:flutter/material.dart';

class TellMeColorPicker {
  final BuildContext context;
  //callback
  final Function(Color) onSelected;

  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool shadow;
  //Title conf
  final bool showTitle;
  final String title;
  final TextStyle titleStyle;
  final TextAlign titleAlign;
  //Colors
  final List<Color> colors;
  final double colorSize;
  final double colorPadding;
  final Color overlayColor;
  //custom content
  final Widget child;

  TellMeColorPicker({
    @required this.context,
    //callback
    this.onSelected,
    //modal conf
    this.padding = const EdgeInsets.all(0),
    this.borderRadius = 20,
    this.shadow = false,
    //title conf
    this.showTitle = true,
    this.title = 'Select a color',
    this.titleStyle = _paragraphBold,
    this.titleAlign = TextAlign.start,
    //Colors
    this.colors,
    this.colorSize = 50,
    this.colorPadding = 8,
    this.overlayColor = Colors.white,
    //custom content
    this.child,
  }) {
    // assert(showTitle == true ? title != null : title == null,
    //     "If show title true, title can not be null");

    showAlert(context);
  }

  showAlert(BuildContext context) {
    showDialog(
      barrierColor: Colors.black26,
      context: context,
      builder: (_) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: this.padding,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(this.borderRadius),
                    topRight: Radius.circular(this.borderRadius),
                  ),
                  boxShadow: [
                    this.shadow
                        ? BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        : BoxShadow()
                  ],
                  color: Colors.white,
                ),
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      showTitle
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  this.title,
                                  textAlign: this.titleAlign,
                                  style: this.titleStyle,
                                ),
                              ),
                            )
                          : Container(),
                      child ?? Container(),
                      Wrap(
                        children: List.generate(this.colors.length, (index) {
                          Color color = this.colors[index];
                          return Padding(
                            padding: EdgeInsets.all(this.colorPadding),
                            child: SizedBox(
                              height: this.colorSize,
                              width: this.colorSize,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor:
                                      MaterialStateProperty.all(color),
                                  overlayColor: MaterialStateProperty.all(
                                      this.overlayColor),
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                ),
                                child: null,
                                onPressed: () {
                                  this.onSelected(color);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

const _paragraphBold = const TextStyle(
  fontWeight: FontWeight.w700,
  color: const Color(0xff102d42),
  fontStyle: FontStyle.normal,
  fontSize: 16.0,
);
