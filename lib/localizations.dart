import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {

    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }
 
  String get headTitle {
    return Intl.message('System Access', name: 'headTitle');
  }

  String get btnSubmit {
    return Intl.message('Login', name: 'btnSubmit');
  }

  String get locale {
    return Intl.message('en', name: 'locale');
  }

  String get lblEmail {
    return Intl.message('Email', name: 'lblEmail');
  }

  String get lblEmailHint {
    return Intl.message('type your email', name: 'lblEmailHint');
  }

  String get lblPassword {
    return Intl.message('Password', name: 'lblPassword');
  }

  String get lblPasswordHint {
    return Intl.message('type your password', name: 'lblPasswordHint');
  }

  String get lblForgotPassword {
    return Intl.message('Forgot my password', name: 'lblForgotPassword');
  }

  String get lblRememberMe {
    return Intl.message('Remember me', name: 'lblRememberMe');
  }

  String get lblLoginWithText {
    return Intl.message('OR', name: 'lblLoginWithText');
  }
}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}

class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) => SynchronousFuture<_DefaultCupertinoLocalizations>(_DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;
  
  _DefaultCupertinoLocalizations(this.locale);
}
