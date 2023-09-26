import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/extensions/widget.dart';
import 'package:mwidgets/src/widgets/image.dart';

class ImagesViewerScreen extends StatefulWidget {
  final List<String> urls;
  final int initialImage;

  const ImagesViewerScreen({
    super.key,
    required this.urls,
    required this.initialImage,
  });

  @override
  State<ImagesViewerScreen> createState() => _ImagesViewerScreenState();
}

class _ImagesViewerScreenState extends State<ImagesViewerScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  late AnimationController animationController;
  late Animation<double> position;
  int index = 0;

  @override
  void initState() {
    index = widget.initialImage;
    animationController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    position =
        Tween<double>(begin: 16.0, end: 35.0).animate(animationController)
          ..addListener(
            () {
              setState(() {});
            },
          );

    tabController = TabController(
        vsync: this,
        length: widget.urls.length,
        initialIndex: widget.initialImage)
      ..addListener(
        () async {
          index = tabController.index;
          animationController.reset();
          animationController.forward();
          setState(() {});
        },
      );
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: tabController,
              children: widget.urls.map(
                (item) {
                  if (item.contains('http')) {
                    return MNetworkImage(
                      url: item,
                    );
                  }
                  return MFileImage(file: item);
                },
              ).toList(),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: const Icon(
                Icons.clear,
                color: Coolors.black,
                size: 28.0,
              ).addAction(
                onGesture: () {
                  context.pop();
                },
                padding: const MPadding.set(all: 21.0),
              ),
            ),
            if (widget.urls.length > 1)
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.urls.length,
                    (index) {
                      final active = index == index;
                      return Container(
                        margin: const EdgeInsetsDirectional.only(start: 4.0),
                        width: active ? position.value : 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color: active ? Coolors.primaryColor : Coolors.grey,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      );
                    },
                  ),
                ).addPadding(bottom: 100.0),
              )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    animationController.dispose();
    super.dispose();
  }
}
