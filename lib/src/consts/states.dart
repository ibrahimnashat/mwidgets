// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class ProcessState extends Equatable {}

class InitialState<T> extends ProcessState {
  InitialState({
    this.data,
  });

  T? data;

  @override
  List<Object?> get props => [];
}

class LoadingState extends ProcessState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends ProcessState {
  @override
  List<Object?> get props => [];
}

class EmptyState extends ProcessState {
  @override
  List<Object?> get props => [];
}

class SuccessState<T> extends ProcessState {
  T? data;

  SuccessState({
    this.data,
  });

  @override
  List<Object?> get props => [];
}
