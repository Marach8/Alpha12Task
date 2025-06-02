import '../global_export.dart';

class A12TextField extends StatelessWidget {  
  const A12TextField({
    super.key,
    this.enabled,
    this.onChanged,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.prefixIconConstraints,
    this.suffixIconConstraints
  });

  final bool? enabled;
  final Widget? suffixIcon, prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final BoxConstraints? prefixIconConstraints, suffixIconConstraints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled, 
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: Theme.of(context).textTheme.headlineMedium?.color,
      onChanged: onChanged,
      maxLines: 1,
      decoration: InputDecoration(
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon
      ),
    );
  }
}



