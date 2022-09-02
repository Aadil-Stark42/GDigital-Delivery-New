import 'package:flutter/services.dart';

void hideKeyBoard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}
