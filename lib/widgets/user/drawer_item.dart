import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DrawerItem({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      onPressed: onPressed,
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DrawerButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.only(left: 55, right: 55),
      color: Colors.white,
      child: Text(
        text,
      ),
      onPressed: onPressed,
    );
  }
}

class DrawerSubItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DrawerSubItem({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
      ),
      onPressed: onPressed,
    );
  }
}
