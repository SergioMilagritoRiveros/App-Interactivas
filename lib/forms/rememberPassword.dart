import 'package:animapp/widgets/InputWidget.dart';
import 'package:flutter/material.dart';

class RememberPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RememberPasswordState();
  }
}

class _RememberPasswordState extends State<RememberPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Align(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            SizedBox(height: 50),
            Text(
              "Recupera Tu contraseña",
              style: TextStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Image.network(
                "https://lh3.googleusercontent.com/proxy/_sySLcJFcXYMC5fQUrzEqgyzWqsw7FQbjFlkhfisnLg2uQ4kX0CUpQHHFUHA9-2M0Fz3nXlrZqeYXqsHpON5ikM92j98FAP9vWDMJeQL4jW9G3oa5C0",
                width: 150),
            SizedBox(height: 50),
            Container(
                child: InputWidget(
                    labelText: 'Ingresa tu correo electronico',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress),
                    width: MediaQuery.of(context).size.width /1.1),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.green[300],
                    onPressed: () => '',
                    child: Container(
                      child: new Text("  Enviar"),
                      width: MediaQuery.of(context).size.width / 7,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => '',
                  textColor: Colors.white,
                  color: Colors.red[300],
                  child: Container(
                    child: new Text("Cancelar"),
                    width: MediaQuery.of(context).size.width / 7,
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
