
/*
 * Generated file. Do not edit.
 *
 * Locales: 5
 * Strings: 25 (5.0 per locale)
 *
 * Built on 2022-07-19 at 10:03 UTC
 */

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/widgets.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<_StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	enUs(languageCode: 'en', countryCode: 'US', build: _StringsEnUs.build),
	jaJp(languageCode: 'ja', countryCode: 'JP', build: _StringsJaJp.build),
	zhCn(languageCode: 'zh', countryCode: 'CN', build: _StringsZhCn.build),
	zhHk(languageCode: 'zh', countryCode: 'HK', build: _StringsZhHk.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<_StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

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

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(
		initLocale: LocaleSettings.instance.currentLocale,
		initTranslations: LocaleSettings.instance.currentTranslations,
	);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(
		locales: AppLocale.values,
		baseLocale: _baseLocale,
		utils: AppLocaleUtils.instance,
	);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
	static AppLocale setLocaleRaw(String rawLocale) => instance.setLocaleRaw(rawLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	final PluralResolver? _cardinalResolver; // ignore: unused_field
	final PluralResolver? _ordinalResolver; // ignore: unused_field

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get hello => 'hello, world';
	String get msg => '{} are written in the {} language';
	String get login => 'login';
	String get logout => 'logout';
	String get setting => 'setting';
}

// Path: <root>
class _StringsEnUs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEnUs.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override final PluralResolver? _cardinalResolver; // ignore: unused_field
	@override final PluralResolver? _ordinalResolver; // ignore: unused_field

	@override late final _StringsEnUs _root = this; // ignore: unused_field

	// Translations
	@override String get hello => 'hello, world';
	@override String get msg => '{} are written in the {} language';
	@override String get login => 'login';
	@override String get logout => 'logout';
	@override String get setting => 'setting';
}

// Path: <root>
class _StringsJaJp implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJaJp.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override final PluralResolver? _cardinalResolver; // ignore: unused_field
	@override final PluralResolver? _ordinalResolver; // ignore: unused_field

	@override late final _StringsJaJp _root = this; // ignore: unused_field

	// Translations
	@override String get hello => 'こんにちは、世界！';
	@override String get msg => '{} are written in the {} language';
	@override String get login => 'ログイン';
	@override String get logout => 'ログアウト';
	@override String get setting => '設定';
}

// Path: <root>
class _StringsZhCn implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhCn.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override final PluralResolver? _cardinalResolver; // ignore: unused_field
	@override final PluralResolver? _ordinalResolver; // ignore: unused_field

	@override late final _StringsZhCn _root = this; // ignore: unused_field

	// Translations
	@override String get hello => '你好，世界！';
	@override String get msg => '{} are written in the {} language';
	@override String get login => '登录';
	@override String get logout => '退出登录';
	@override String get setting => '设定';
}

// Path: <root>
class _StringsZhHk implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhHk.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override final PluralResolver? _cardinalResolver; // ignore: unused_field
	@override final PluralResolver? _ordinalResolver; // ignore: unused_field

	@override late final _StringsZhHk _root = this; // ignore: unused_field

	// Translations
	@override String get hello => '你好，世界';
	@override String get msg => '{} are written in the {} language';
	@override String get login => '登錄';
	@override String get logout => '退出登錄';
	@override String get setting => '設定';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': 'hello, world',
			'msg': '{} are written in the {} language',
			'login': 'login',
			'logout': 'logout',
			'setting': 'setting',
		};
	}
}

extension on _StringsEnUs {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': 'hello, world',
			'msg': '{} are written in the {} language',
			'login': 'login',
			'logout': 'logout',
			'setting': 'setting',
		};
	}
}

extension on _StringsJaJp {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': 'こんにちは、世界！',
			'msg': '{} are written in the {} language',
			'login': 'ログイン',
			'logout': 'ログアウト',
			'setting': '設定',
		};
	}
}

extension on _StringsZhCn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': '你好，世界！',
			'msg': '{} are written in the {} language',
			'login': '登录',
			'logout': '退出登录',
			'setting': '设定',
		};
	}
}

extension on _StringsZhHk {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'hello': '你好，世界',
			'msg': '{} are written in the {} language',
			'login': '登錄',
			'logout': '退出登錄',
			'setting': '設定',
		};
	}
}
