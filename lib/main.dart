import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loginpageui/Helpers/LocaleHelper.dart';
import 'package:loginpageui/localizations.dart';

import 'pages/login.page.dart';

void main() => runApp(LoginPageAppLocalization());

class LoginPageAppLocalization extends StatefulWidget {

  @override
  _LoginPageAppLocalizationState createState() => _LoginPageAppLocalizationState();
}

class _LoginPageAppLocalizationState extends State<LoginPageAppLocalization> {
  SpecificLocalizationDelegate _specificLocalizationDelegate;

  @override void initState() {
    super.initState();
    helper.onLocaleChanged = onLocaleChange;
    _specificLocalizationDelegate = SpecificLocalizationDelegate(new Locale("pt"));
  }

  onLocaleChange(Locale locale) {
    setState(() {
     _specificLocalizationDelegate = SpecificLocalizationDelegate(locale); 
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'Flutter Login UI + I18n',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _specificLocalizationDelegate,
      ],
      locale: _specificLocalizationDelegate.overriddenLocale,
      supportedLocales: [
        const Locale('en', ''),
        const Locale('pt', '')
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: "Flutter Login UI I18n")
    );    
  }
}
