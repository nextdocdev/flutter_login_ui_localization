import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpageui/utilities/constants.dart';
import '../localizations.dart';
import '../Helpers/LocaleHelper.dart';

class LoginPage extends StatefulWidget {

  final String title;

  LoginPage({this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _remember = false;

  Widget _buildEmail() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(AppLocalizations.of(context).lblEmail, style: kLabelStyle),
          SizedBox(height: 10.0,),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: AppLocalizations.of(context).lblEmailHint,
                hintStyle: kHintTextStyle
              ),
            ),
          )
        ],
    );
  }

  Widget _buildPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(AppLocalizations.of(context).lblPassword, style: kLabelStyle),
          SizedBox(height: 10.0,),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: AppLocalizations.of(context).lblPasswordHint,
                hintStyle: kHintTextStyle
              ),
            ),
          )
        ],
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("recuperar minha senha..."),
        child: Text(
          AppLocalizations.of(context).lblForgotPassword,
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRemember() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _remember, 
              checkColor: Colors.green, 
              activeColor: Colors.white, 
              onChanged: (value) {
                setState(() {
                  _remember = value; 
                });
              })
          ),
          Text(AppLocalizations.of(context).lblRememberMe, style: kLabelStyle)
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print("Botão entrar pressionado!"),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text(
          AppLocalizations.of(context).btnSubmit, 
          style: TextStyle(
            color: Color(0xFF527DAA), 
            letterSpacing: 3.0,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: "OpenSans"
          ),
        ),
      ),
    );
  }

  Widget _buildEntrarComText() {
    return Column(
      children: <Widget>[
        Text("- " + AppLocalizations.of(context).lblLoginWithText + " -", 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
      return GestureDetector(
              onTap: () => onTap,
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0
                  )
                  ],
                  image: DecorationImage(
                    image: logo
                  )
                ),
              ),
            );
  }

  Widget _buildLanguageBtn({String languageText}) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      onPressed: () {
        setState(() {
          helper.onLocaleChanged(new Locale(languageText));
        });
      },
      child: Text(languageText),
      color: AppLocalizations.of(context).locale == languageText ? Colors.green : Colors.blue,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5)
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9]
                  )
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 60.0
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).headTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "OpenSans",
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      _buildEmail(),
                      SizedBox(height: 20.0,),
                      _buildPassword(),
                      _buildForgotPassword(),
                      _buildRemember(),
                      _buildLoginBtn(),
                      _buildEntrarComText(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildSocialBtn(() => print("Facebook login"), AssetImage("assets/logos/facebook.jpg")),
                            _buildSocialBtn(() => print("Google login"), AssetImage("assets/logos/google.jpg")),
                          ]
                        )
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildLanguageBtn(languageText: "pt"),
                            _buildLanguageBtn(languageText: "en")
                          ],
                        ),
                      ),
                    ],
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}
