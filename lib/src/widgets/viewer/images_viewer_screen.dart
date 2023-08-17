import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mwidgets/injection/injectable.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/states.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/extensions/widget.dart';
import 'package:mwidgets/src/widgets/image.dart';

import 'images_viewer_cubit.dart';

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
  final cubit = getIt<ImagesViewerCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return cubit
          ..init(
            vsync: this,
            length: widget.urls.length,
            initialIndex: widget.initialImage,
          );
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ImagesViewerCubit, ProcessState>(
            builder: (context, state) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  TabBarView(
                    physics: const BouncingScrollPhysics(),
                    controller: cubit.tabController,
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
                            final active = cubit.index == index;
                            return Container(
                              margin:
                                  const EdgeInsetsDirectional.only(start: 4.0),
                              width: active ? cubit.position.value : 12.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                color: active
                                    ? Coolors.primaryColor
                                    : Coolors.grey,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            );
                          },
                        ),
                      ).addPadding(bottom: 100.0),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
