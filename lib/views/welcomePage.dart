import 'package:animapp/blocs/darkThemeProvider.dart';
import 'package:animapp/views/forgottenPassword.dart';
import 'package:animapp/views/home.dart';
import 'package:animapp/widgets/InputWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Styles.dart';
import '../Styles.dart';
import 'loginPage.dart';
import 'signup.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var _tapLogin = false;
  var _tapSignUp = false;
  Size size;
  LoginPageState formulariosLogin = new LoginPageState();
  SignUpPageState formulariosSignUp = new SignUpPageState();
  DarkThemeProvider darkTheme = new DarkThemeProvider();

  changePositionLogin() {
    setState(() {
      _tapLogin = true;
      _tapSignUp = false;
    });
  }

  changePositionSignUp() {
    setState(() {
      _tapSignUp = true;
      _tapLogin = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    darkTheme.darkTheme = await darkTheme.darkThemePreference.getTheme();
  }

  Widget _submitButtonPortrait() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: darkTheme.darkTheme
                      ? Colors.lightBlue
                      : Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: darkTheme.darkTheme ? Colors.blue : Colors.white),
        child: Text(
          'Ingresar',
          style: TextStyle(
              fontSize: 20,
              color: darkTheme.darkTheme ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _submitButtonLandscape() {
    return InkWell(
      onTap: () {
        changePositionLogin();
      },
      child: Container(
        width: size.width / 2,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: darkTheme.darkTheme
                      ? Colors.lightBlue
                      : Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: darkTheme.darkTheme ? Colors.blue : Colors.white),
        child: Text(
          'Ingresar',
          style: TextStyle(
              fontSize: 20,
              color: darkTheme.darkTheme ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _signUpButtonPortrait() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Registrarse',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _signUpButtonLandscape() {
    return InkWell(
      onTap: () {
        changePositionSignUp();
      },
      child: Container(
        width: size.width / 2,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Registrarse',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _titlePortrait() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Animapp',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: size.width / 8,
          fontWeight: FontWeight.w700,
          color: darkTheme.darkTheme ? Colors.blue : Colors.white,
        ),
      ),
    );
  }

  Widget _titleLandscape() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Animapp',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: size.width / 10,
          fontWeight: FontWeight.w700,
          color: darkTheme.darkTheme ? Colors.blue : Colors.white,
        ),
      ),
    );
  }

  Widget _imagePortrait() {
    return Image.asset('images/huellita.png', height: size.height / 5);
  }

  Widget _imageLandscape() {
    return Image.asset('images/huellita.png', height: size.height / 2);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (_) {
          return darkTheme;
        },
        child: Scaffold(body: _layoutDetails()));
  }

  Widget _layoutDetails() {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: darkTheme.darkTheme ? fondoOscuro : fondoNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _titlePortrait(),
            SizedBox(
              height: 20,
            ),
            _imagePortrait(),
            SizedBox(
              height: 50,
            ),
            _submitButtonPortrait(),
            SizedBox(
              height: 20,
            ),
            _signUpButtonPortrait(),
          ],
        ),
      ));
    } else if (orientation == Orientation.landscape &&
        !_tapLogin &&
        !_tapSignUp) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: darkTheme.darkTheme ? fondoOscuro : fondoNormal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        SizedBox(
                          height: 60,
                        ),
                        _titleLandscape()
                      ]),
                      Row(children: [
                        SizedBox(
                          height: 20,
                        ),
                        _imageLandscape()
                      ]),
                    ]),
                SizedBox(width: size.width / 40),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _submitButtonLandscape(),
                      SizedBox(
                        height: size.width / 15,
                      ),
                      _signUpButtonLandscape(),
                    ]),
              ]));
    } else if (orientation == Orientation.landscape &&
        _tapLogin &&
        !_tapSignUp) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: darkTheme.darkTheme ? fondoOscuro : fondoNormal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _submitButtonLandscape(),
                          SizedBox(
                            height: size.width / 15,
                          ),
                          _signUpButtonLandscape(),
                        ])),
                Expanded(
                    flex: 6,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height / 5,
                            width: size.width / 1.5,
                            child: formulariosLogin.emailPasswordWidget(),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                                child: Text('¿Olvidaste tu contraseña?',
                                    style: TextStyle(fontSize: 14)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgottenPassword()));
                                }),
                          ),
                          SizedBox(
                            height: size.width / 20,
                          ),
                          Container(
                            height: size.height / 10,
                            width: size.width / 1.5,
                            child: RaisedButton(
                              elevation: 0,
                              color: Colors.transparent,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: darkTheme.darkTheme
                                              ? Colors.lightBlue
                                              : Color(0xffdf8e33)
                                                  .withAlpha(100),
                                          offset: Offset(2, 4),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ],
                                    gradient: darkTheme.darkTheme
                                        ? botonOscuro
                                        : botonNormal),
                                child: Text(
                                  'Confirmar',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: darkTheme.darkTheme
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ])),
              ]));
    } else if (orientation == Orientation.landscape &&
        _tapSignUp &&
        !_tapLogin) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: darkTheme.darkTheme ? fondoOscuro : fondoNormal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _submitButtonLandscape(),
                          SizedBox(
                            height: size.width / 15,
                          ),
                          _signUpButtonLandscape(),
                        ])),
                SizedBox(width: size.width / 40),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: formulariosSignUp.emailPasswordWidget(),
                      ),
                      SizedBox(
                        height: size.width / 15,
                      ),
                      RaisedButton(
                        elevation: 0,
                        color: Colors.transparent,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: darkTheme.darkTheme
                                        ? Colors.lightBlue
                                        : Color(0xffdf8e33).withAlpha(100),
                                    offset: Offset(2, 4),
                                    blurRadius: 5,
                                    spreadRadius: 2)
                              ],
                              gradient: darkTheme.darkTheme
                                  ? botonOscuro
                                  : botonNormal),
                          child: Text(
                            'Confirmar',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]));
    }
  }
}
