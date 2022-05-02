// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kiwi.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<AppService>((c) => AppServiceImpl())
      ..registerFactory<AppRepository>((c) => AppRepositoryImpl())
      ..registerFactory<ApiGetHelloWorld>((c) => ApiGetHelloWorldImpl());
  }
}
