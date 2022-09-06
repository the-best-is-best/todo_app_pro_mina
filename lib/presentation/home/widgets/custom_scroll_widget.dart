import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScrollBarWidget extends StatefulWidget {
  final BoxScrollView Function(ScrollController controller) builder;
  const CustomScrollBarWidget({Key? key, required this.builder})
      : super(key: key);

  @override
  State<CustomScrollBarWidget> createState() => _CustomScrollBarWidgetState();
}

class _CustomScrollBarWidgetState extends State<CustomScrollBarWidget> {
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar(
      controller: controller,
      heightScrollThumb: 210.h,
      backgroundColor: Colors.black,
      scrollThumbBuilder: scrollThumbBuilder,
      child: widget.builder(controller),
    );
  }

  Widget scrollThumbBuilder(
    Color backgroundColor,
    Animation<double> thumbAnimation,
    Animation<double> labelAnimation,
    double? height, {
    BoxConstraints? labelConstraints,
    Text? labelText,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: backgroundColor,
        height: height,
        width: 4,
      ),
    );
  }
}
