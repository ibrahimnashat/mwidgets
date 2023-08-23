// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:math' as _i10;

import 'package:flutter/material.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mwidgets/injection/injectable.dart' as _i13;
import 'package:mwidgets/src/consts/validation.dart' as _i12;
import 'package:mwidgets/src/extensions/context.dart' as _i11;
import 'package:mwidgets/src/usecases/phone_validate.dart' as _i9;
import 'package:mwidgets/src/widgets/buttons/buttons_cubit.dart' as _i3;
import 'package:mwidgets/src/widgets/dropdown/dropdown_cubit.dart' as _i4;
import 'package:mwidgets/src/widgets/password/password_cubit.dart' as _i8;
import 'package:mwidgets/src/widgets/range_item_widget.dart' as _i7;
import 'package:mwidgets/src/widgets/viewer/images_viewer_cubit.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factory<_i3.ButtonsCubit>(() => _i3.ButtonsCubit());
    gh.factory<_i4.DropdownCubit>(() => _i4.DropdownCubit());
    gh.factory<_i5.GlobalKey<_i5.NavigatorState>>(() => injectionModule.nav);
    gh.factory<_i5.GlobalKey<_i5.FormState>>(() => injectionModule.globalKey);
    gh.factory<_i6.ImagesViewerCubit>(() => _i6.ImagesViewerCubit());
    gh.factory<List<String>>(() => injectionModule.strings);
    gh.factory<_i7.MRangeItemWidgetCubit>(() => _i7.MRangeItemWidgetCubit());
    gh.factory<_i8.PasswordCubit>(() => _i8.PasswordCubit());
    gh.factory<_i9.PhoneValidator>(() => _i9.PhoneValidator());
    gh.factory<_i10.Random>(() => injectionModule.random);
    gh.factory<_i11.Root>(
        () => _i11.Root(nav: gh<_i5.GlobalKey<_i5.NavigatorState>>()));
    gh.factory<_i5.ScrollController>(() => injectionModule.scrollController);
    gh.factory<String>(() => injectionModule.string);
    gh.factory<_i5.TextEditingController>(
        () => injectionModule.textEditingController);
    gh.factory<_i12.Validate>(() => _i12.Validate());
    gh.factory<int>(() => injectionModule.number);
    return this;
  }
}

class _$InjectionModule extends _i13.InjectionModule {}
