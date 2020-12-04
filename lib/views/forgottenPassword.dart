import 'package:animapp/blocs/darkThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/InputWidget.dart';
import '../widgets/bezierContainer.dart';

class ForgottenPassword extends StatefulWidget {
  ForgottenPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ForgottenPasswordState createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  DarkThemeProvider darkTheme = new DarkThemeProvider();

  double _containerPaddingLeft = 20.0;
  double _animationValue;
  double _translateX = 0;
  double _translateY = 0;
  double _rotate = 0;
  double _scale = 1;

  bool show;
  bool sent = false;
  Color _color;

  void getCurrentAppTheme() async {
    darkTheme.darkTheme = await darkTheme.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    _color = Colors.orange;
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    show = true;
    _animationController.addListener(() {
      setState(() {
        show = false;
        _animationValue = _animationController.value;
        if (_animationValue >= 0.2 && _animationValue < 0.4) {
          _containerPaddingLeft = 100.0;
          _color = Colors.orangeAccent;
        } else if (_animationValue >= 0.4 && _animationValue <= 0.5) {
          _translateX = 80.0;
          _rotate = -20.0;
          _scale = 0.1;
        } else if (_animationValue >= 0.5 && _animationValue <= 0.8) {
          _translateY = -20.0;
        } else if (_animationValue >= 0.81) {
          _containerPaddingLeft = 20.0;
          sent = true;
        }
      });
    });
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Atrás',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Aviso"),
      content: Text("Se ha enviado un correo de recuperación de contraseña."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _submitButton() {
    return Center(
        child: GestureDetector(
            onTap: () {
              _animationController.forward();
            },
            child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                      color: _color,
                      blurRadius: 21,
                      spreadRadius: -15,
                      offset: Offset(
                        0.0,
                        20.0,
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.only(
                    left: _containerPaddingLeft,
                    right: 20.0,
                    top: 10.0,
                    bottom: 10.0),
                duration: Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    (!sent)
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            child: Icon(Icons.send),
                            curve: Curves.fastOutSlowIn,
                            transform: Matrix4.translationValues(
                                _translateX, _translateY, 0)
                              ..rotateZ(_rotate)
                              ..scale(_scale),
                          )
                        : Container(),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 600),
                      child: show ? SizedBox(width: 10.0) : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: show ? Text("Enviar") : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: sent ? Icon(Icons.done) : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      alignment: Alignment.topLeft,
                      duration: Duration(milliseconds: 600),
                      child: sent ? SizedBox(width: 10.0) : Container(),
                    ),
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 200),
                      child: sent ? Text("Enviado") : Container(),
                    ),
                  ],
                ))));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Animapp',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color:Color(0xffe46b10),
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        InputWidget(
          labelText: 'Correo electrónico',
          icon: Icons.email,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
