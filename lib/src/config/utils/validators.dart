

import 'package:alpha_12_task/src/config/utils/strings.dart';

mixin AlphaValidators{

  String? validateName(String? text){
    if(text == null || text.isEmpty){
      return AlphaStrings.EMPTY_FIELD;
    }
    return null;
  }


  String? validatePhone(String? phoneNo){
    if(phoneNo == null || phoneNo.isEmpty){
      return AlphaStrings.EMPTY_FIELD;
    }

    final phoneRegex = RegExp(r'^(\+?\d{1,3}[- ]?)?\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}$');
    if(!phoneRegex.hasMatch(phoneNo)){
      return AlphaStrings.INVALID_PHONE_NO;
    }
    return null;
  }
}
