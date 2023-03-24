import 'package:flutter/cupertino.dart';

int getTextScale(BuildContext context) {
  return MediaQuery.of(context).textScaleFactor.floor();
}
