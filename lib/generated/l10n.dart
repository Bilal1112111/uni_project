// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Categorries`
  String get categorries {
    return Intl.message(
      'Categorries',
      name: 'categorries',
      desc: '',
      args: [],
    );
  }

  /// `DailyDaels`
  String get dailydeals {
    return Intl.message(
      'DailyDaels',
      name: 'dailydeals',
      desc: '',
      args: [],
    );
  }

  /// `see all`
  String get seeAll {
    return Intl.message(
      'see all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get QR {
    return Intl.message(
      'QR',
      name: 'QR',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get settings {
    return Intl.message(
      'Setting',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `My Ads`
  String get myads {
    return Intl.message(
      'My Ads',
      name: 'myads',
      desc: '',
      args: [],
    );
  }

  /// `Your Favorit Is Impty`
  String get yourfavoritisimpty {
    return Intl.message(
      'Your Favorit Is Impty',
      name: 'yourfavoritisimpty',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Favorit Market Now`
  String get addyourfavoritmarketnow {
    return Intl.message(
      'Add Your Favorit Market Now',
      name: 'addyourfavoritmarketnow',
      desc: '',
      args: [],
    );
  }

  /// `Lets Start`
  String get letsstart {
    return Intl.message(
      'Lets Start',
      name: 'letsstart',
      desc: '',
      args: [],
    );
  }

  /// `All Stores`
  String get stores {
    return Intl.message(
      'All Stores',
      name: 'stores',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacypolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacypolicy',
      desc: '',
      args: [],
    );
  }

  /// `Frequently Asked Questions`
  String get faq {
    return Intl.message(
      'Frequently Asked Questions',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutus {
    return Intl.message(
      'About Us',
      name: 'aboutus',
      desc: '',
      args: [],
    );
  }

  /// `View More`
  String get viewmore {
    return Intl.message(
      'View More',
      name: 'viewmore',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Advertising Now`
  String get addyourads {
    return Intl.message(
      'Add Your Advertising Now',
      name: 'addyourads',
      desc: '',
      args: [],
    );
  }

  /// `Do not Wait??!!`
  String get dontwait {
    return Intl.message(
      'Do not Wait??!!',
      name: 'dontwait',
      desc: '',
      args: [],
    );
  }

  /// `Your Request Has Been Sent Successfully`
  String get yourrequesthasbeensentsuccessfully {
    return Intl.message(
      'Your Request Has Been Sent Successfully',
      name: 'yourrequesthasbeensentsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Thanks For Choosing Us`
  String get thanksforchoosingus {
    return Intl.message(
      'Thanks For Choosing Us',
      name: 'thanksforchoosingus',
      desc: '',
      args: [],
    );
  }

  /// `The payment details will be sent to you soon after`
  String get Thepaymentdetailswillbesenttoyousoonafter {
    return Intl.message(
      'The payment details will be sent to you soon after',
      name: 'Thepaymentdetailswillbesenttoyousoonafter',
      desc: '',
      args: [],
    );
  }

  /// `your order is reviewed by the administrators`
  String get yourorderisreviewedbytheadministrators {
    return Intl.message(
      'your order is reviewed by the administrators',
      name: 'yourorderisreviewedbytheadministrators',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
