import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension OnContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get mWidth {
    return MediaQuery.of(this).size.width;
  }

  double get mHeight {
    return MediaQuery.of(this).size.height;
  }

  dynamic push(Widget widget) {
    return Navigator.push(
      this,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }

  dynamic pushReplacement(Widget widget) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }

  dynamic pushReplacementNamed(String name, {dynamic args}) {
    return Navigator.pushReplacementNamed(this, name, arguments: args);
  }

  dynamic pushAndRemoveUntil(Widget widget) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => widget),
      (_) => false,
    );
  }

  dynamic pushNamedAndRemoveUntil(String name, {dynamic args}) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      name,
      (_) => false,
      arguments: args,
    );
  }

  dynamic pushNamed(String screenName, {dynamic args}) {
    return Navigator.pushNamed(
      this,
      screenName,
      arguments: args,
    );
  }

  dynamic pop({dynamic data}) {
    return Navigator.pop(
      this,
      data,
    );
  }

  Future<bool> get maybePop async {
    return await Navigator.maybePop(this);
  }

  bool get canPop {
    return Navigator.canPop(this);
  }

  Orientation get mOrientation {
    return MediaQuery.of(this).orientation;
  }

  double get width => mWidth;

  double get height => mHeight;

  double get textMaxWidth => 450;

  // AppLocalizations get tr => AppLocalizations.of(this)!;
}

abstract class MainContext {
  late GlobalKey<NavigatorState> nav;
  late GlobalKey<ScaffoldState> scaffoldKey;

  BuildContext get context;

  dynamic push(Widget widget);

  dynamic pop({dynamic data});

  void pushAndRemoveUntil(Widget widget);

  void pushNamed(String name);

  void pushReplacement(Widget widget);

  Future<bool> get maybePop;

  bool get canPop;

  Orientation get mOrientation;

  double get width;

  double get height;

  double get textMaxWidth => 450;

  // AppLocalizations get tr;
}

@Injectable(as: MainContext)
class Root implements MainContext {
  Root({required this.nav});

  @override
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  GlobalKey<NavigatorState> nav;

  @override
  BuildContext get context => nav.currentContext!;

  @override
  dynamic push(Widget widget) {
    return context.push(widget);
  }

  @override
  dynamic pop({dynamic data}) {
    return context.pop(data: data);
  }

  @override
  void pushAndRemoveUntil(Widget widget) {
    context.pushAndRemoveUntil(widget);
  }

  @override
  void pushNamed(String name) {
    context.pushNamed(name);
  }

  @override
  void pushReplacement(Widget widget) {
    context.pushReplacement(widget);
  }

  @override
  Future<bool> get maybePop async {
    return await Navigator.maybePop(context);
  }

  @override
  bool get canPop {
    return Navigator.canPop(context);
  }

  @override
  Orientation get mOrientation {
    return MediaQuery.of(context).orientation;
  }

  @override
  double get width => context.mWidth;

  @override
  double get height => context.mHeight;

  @override
  double get textMaxWidth => 450;

  // @override
  // AppLocalizations get tr => AppLocalizations.of(context)!;
}
