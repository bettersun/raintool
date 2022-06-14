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
      ..registerFactory<ApiHelloWorld>((c) => ApiHelloWorldImpl())
      ..registerFactory<AppService>((c) => AppServiceImpl())
      ..registerFactory<AppRepository>((c) => AppRepositoryImpl())
      ..registerFactory<TabService>((c) => TabServiceImpl())
      ..registerFactory<TabRepository>((c) => TabRepositoryImpl());
  }
}
