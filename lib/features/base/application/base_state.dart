import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState({@Default(false) bool isLoading, @Default(0) int pageIndex}) = _BaseState;

  const BaseState._();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
