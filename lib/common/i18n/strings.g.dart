/*
 * Generated file. Do not edit.
 *
 * Locales: 5
 * Strings: 10 (2.0 per locale)
 *
 * Built on 2022-05-17 at 10:11 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
  en, // 'en' (base locale, fallback)
  enUs, // 'en-US'
  jaJp, // 'ja-JP'
  zhCn, // 'zh-CN'
  zhHk, // 'zh-HK'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
  Translations._(); // no constructor

  static _StringsEn of(BuildContext context) {
    final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
    if (inheritedWidget == null) {
      throw 'Please wrap your app with "TranslationProvider".';
    }
    return inheritedWidget.translations;
  }
}

class LocaleSettings {
  LocaleSettings._(); // no constructor

  /// Uses locale of the device, fallbacks to base locale.
  /// Returns the locale which has been set.
  static AppLocale useDeviceLocale() {
    final locale = AppLocaleUtils.findDeviceLocale();
    return setLocale(locale);
  }

  /// Sets locale
  /// Returns the locale which has been set.
  static AppLocale setLocale(AppLocale locale) {
    _currLocale = locale;
    _t = _currLocale.translations;

    // force rebuild if TranslationProvider is used
    _translationProviderKey.currentState?.setLocale(_currLocale);

    return _currLocale;
  }

  /// Sets locale using string tag (e.g. en_US, de-DE, fr)
  /// Fallbacks to base locale.
  /// Returns the locale which has been set.
  static AppLocale setLocaleRaw(String rawLocale) {
    final locale = AppLocaleUtils.parse(rawLocale);
    return setLocale(locale);
  }

  /// Gets current locale.
  static AppLocale get currentLocale {
    return _currLocale;
  }

  /// Gets base locale.
  static AppLocale get baseLocale {
    return _baseLocale;
  }

  /// Gets supported locales in string format.
  static List<String> get supportedLocalesRaw {
    return AppLocale.values.map((locale) => locale.languageTag).toList();
  }

  /// Gets supported locales (as Locale objects) with base locale sorted first.
  static List<Locale> get supportedLocales {
    return AppLocale.values.map((locale) => locale.flutterLocale).toList();
  }
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
  AppLocaleUtils._(); // no constructor

  /// Returns the locale of the device as the enum type.
  /// Fallbacks to base locale.
  static AppLocale findDeviceLocale() {
    final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
    if (deviceLocale != null) {
      final typedLocale = _selectLocale(deviceLocale);
      if (typedLocale != null) {
        return typedLocale;
      }
    }
    return _baseLocale;
  }

  /// Returns the enum type of the raw locale.
  /// Fallbacks to base locale.
  static AppLocale parse(String rawLocale) {
    return _selectLocale(rawLocale) ?? _baseLocale;
  }
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsEnUs _translationsEnUs = _StringsEnUs.build();
late _StringsJaJp _translationsJaJp = _StringsJaJp.build();
late _StringsZhCn _translationsZhCn = _StringsZhCn.build();
late _StringsZhHk _translationsZhHk = _StringsZhHk.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {
  /// Gets the translation instance managed by this library.
  /// [TranslationProvider] is using this instance.
  /// The plural resolvers are set via [LocaleSettings].
  _StringsEn get translations {
    switch (this) {
      case AppLocale.en:
        return _translationsEn;
      case AppLocale.enUs:
        return _translationsEnUs;
      case AppLocale.jaJp:
        return _translationsJaJp;
      case AppLocale.zhCn:
        return _translationsZhCn;
      case AppLocale.zhHk:
        return _translationsZhHk;
    }
  }

  /// Gets a new translation instance.
  /// [LocaleSettings] has no effect here.
  /// Suitable for dependency injection and unit tests.
  ///
  /// Usage:
  /// final t = AppLocale.en.build(); // build
  /// String a = t.my.path; // access
  _StringsEn build() {
    switch (this) {
      case AppLocale.en:
        return _StringsEn.build();
      case AppLocale.enUs:
        return _StringsEnUs.build();
      case AppLocale.jaJp:
        return _StringsJaJp.build();
      case AppLocale.zhCn:
        return _StringsZhCn.build();
      case AppLocale.zhHk:
        return _StringsZhHk.build();
    }
  }

  String get languageTag {
    switch (this) {
      case AppLocale.en:
        return 'en';
      case AppLocale.enUs:
        return 'en-US';
      case AppLocale.jaJp:
        return 'ja-JP';
      case AppLocale.zhCn:
        return 'zh-CN';
      case AppLocale.zhHk:
        return 'zh-HK';
    }
  }

  Locale get flutterLocale {
    switch (this) {
      case AppLocale.en:
        return const Locale.fromSubtags(languageCode: 'en');
      case AppLocale.enUs:
        return const Locale.fromSubtags(languageCode: 'en', countryCode: 'US');
      case AppLocale.jaJp:
        return const Locale.fromSubtags(languageCode: 'ja', countryCode: 'JP');
      case AppLocale.zhCn:
        return const Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN');
      case AppLocale.zhHk:
        return const Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK');
    }
  }
}

extension StringAppLocaleExtensions on String {
  AppLocale? toAppLocale() {
    switch (this) {
      case 'en':
        return AppLocale.en;
      case 'en-US':
        return AppLocale.enUs;
      case 'ja-JP':
        return AppLocale.jaJp;
      case 'zh-CN':
        return AppLocale.zhCn;
      case 'zh-HK':
        return AppLocale.zhHk;
      default:
        return null;
    }
  }
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
  TranslationProvider({required this.child}) : super(key: _translationProviderKey);

  final Widget child;

  @override
  _TranslationProviderState createState() => _TranslationProviderState();

  static _InheritedLocaleData of(BuildContext context) {
    final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
    if (inheritedWidget == null) {
      throw 'Please wrap your app with "TranslationProvider".';
    }
    return inheritedWidget;
  }
}

class _TranslationProviderState extends State<TranslationProvider> {
  AppLocale locale = _currLocale;

  void setLocale(AppLocale newLocale) {
    setState(() {
      locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedLocaleData(
      locale: locale,
      child: widget.child,
    );
  }
}

class _InheritedLocaleData extends InheritedWidget {
  final AppLocale locale;
  Locale get flutterLocale => locale.flutterLocale; // shortcut
  final _StringsEn translations; // store translations to avoid switch call

  _InheritedLocaleData({required this.locale, required Widget child})
      : translations = locale.translations,
        super(child: child);

  @override
  bool updateShouldNotify(_InheritedLocaleData oldWidget) {
    return oldWidget.locale != locale;
  }
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
  final match = _localeRegex.firstMatch(localeRaw);
  AppLocale? selected;
  if (match != null) {
    final language = match.group(1);
    final country = match.group(5);

    // match exactly
    selected = AppLocale.values
        .cast<AppLocale?>()
        .firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

    if (selected == null && language != null) {
      // match language
      selected = AppLocale.values
          .cast<AppLocale?>()
          .firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
    }

    if (selected == null && country != null) {
      // match country
      selected = AppLocale.values
          .cast<AppLocale?>()
          .firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
    }
  }
  return selected;
}

// translations

// Path: <root>
class _StringsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsEn.build();

  /// Access flat map
  dynamic operator [](String key) => _flatMap[key];

  // Internal flat map initialized lazily
  late final Map<String, dynamic> _flatMap = _buildFlatMap();

  late final _StringsEn _root = this; // ignore: unused_field

  // Translations
  String get hello => 'hello, world';
  String get msg => '{} are written in the {} language';
}

// Path: <root>
class _StringsEnUs implements _StringsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsEnUs.build();

  /// Access flat map
  @override
  dynamic operator [](String key) => _flatMap[key];

  // Internal flat map initialized lazily
  @override
  late final Map<String, dynamic> _flatMap = _buildFlatMap();

  @override
  late final _StringsEnUs _root = this; // ignore: unused_field

  // Translations
  @override
  String get hello => 'hello, world';
  @override
  String get msg => '{} are written in the {} language';
}

// Path: <root>
class _StringsJaJp implements _StringsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsJaJp.build();

  /// Access flat map
  @override
  dynamic operator [](String key) => _flatMap[key];

  // Internal flat map initialized lazily
  @override
  late final Map<String, dynamic> _flatMap = _buildFlatMap();

  @override
  late final _StringsJaJp _root = this; // ignore: unused_field

  // Translations
  @override
  String get hello => 'こんにちは、世界！';
  @override
  String get msg => '{} are written in the {} language';
}

// Path: <root>
class _StringsZhCn implements _StringsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsZhCn.build();

  /// Access flat map
  @override
  dynamic operator [](String key) => _flatMap[key];

  // Internal flat map initialized lazily
  @override
  late final Map<String, dynamic> _flatMap = _buildFlatMap();

  @override
  late final _StringsZhCn _root = this; // ignore: unused_field

  // Translations
  @override
  String get hello => '你好，世界！';
  @override
  String get msg => '{} are written in the {} language';
}

// Path: <root>
class _StringsZhHk implements _StringsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsZhHk.build();

  /// Access flat map
  @override
  dynamic operator [](String key) => _flatMap[key];

  // Internal flat map initialized lazily
  @override
  late final Map<String, dynamic> _flatMap = _buildFlatMap();

  @override
  late final _StringsZhHk _root = this; // ignore: unused_field

  // Translations
  @override
  String get hello => '你好，世界！~~~~';
  @override
  String get msg => '{} are written in the {} language';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
  Map<String, dynamic> _buildFlatMap() {
    return <String, dynamic>{
      'hello': 'hello, world',
      'msg': '{} are written in the {} language',
    };
  }
}

extension on _StringsEnUs {
  Map<String, dynamic> _buildFlatMap() {
    return <String, dynamic>{
      'hello': 'hello, world',
      'msg': '{} are written in the {} language',
    };
  }
}

extension on _StringsJaJp {
  Map<String, dynamic> _buildFlatMap() {
    return <String, dynamic>{
      'hello': 'こんにちは、世界！',
      'msg': '{} are written in the {} language',
    };
  }
}

extension on _StringsZhCn {
  Map<String, dynamic> _buildFlatMap() {
    return <String, dynamic>{
      'hello': '你好，世界！',
      'msg': '{} are written in the {} language',
    };
  }
}

extension on _StringsZhHk {
  Map<String, dynamic> _buildFlatMap() {
    return <String, dynamic>{
      'hello': '你好，世界！~~~~',
      'msg': '{} are written in the {} language',
    };
  }
}
