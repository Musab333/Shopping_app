import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.textController,
    required this.text,
    required this.keyPadType,
    required this.prefixIcon,
    this.suffixIcon,
    this.isPassword,
    this.enabled,
    this.onSubmit,
    this.onChanged,
    this.suffixPressed,
    this.validate,
  });

  final TextEditingController textController;
  final String text;
  final bool? isPassword;
  final TextInputType keyPadType;
  final Icon prefixIcon;
  final IconData? suffixIcon;
  final bool? enabled;
  final String? Function(String?)? validate;
  final Function? onSubmit;
  void Function(String x)? onChanged;
  final Function()? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: isPassword!,
      keyboardType: keyPadType,
      //textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(
            //color: AppColors.defaultColors,
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  //color: AppColors.defaultColors,
                ),
              )
            : null,
        //border: OutlineInputBorder(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      enabled: enabled,
      validator: validate,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: onChanged,
    );
  }
}
