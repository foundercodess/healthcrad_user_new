import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';


class TextFieldConst extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration = const InputDecoration();
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final bool expands = false;
  final int? maxLength;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Color? iconColor;
  final String? hint;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final void Function(String)? onChanged;
  final double? height;
  final double? width;
  final double? hintSize;
  final double? fontSize;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final Color? cursorColor;
  final Widget? prefix;
  final Widget? sufix;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final BorderRadius? fieldRadius;
  final bool? enabled;
  final void Function()? onTap;
  final bool? autofocus;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? hintColor;
  final String? errorText;
  final TextInputAction? textInputAction;
  final BorderSide? borderSide;
  final BorderSide? borderSideFocus;
  final Widget? label;
  final FontWeight? fontWeight;
  final bool outLineBorderEnabled;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatter;

  const TextFieldConst(
      {super.key,
      this.controller,
      this.style,
      this.strutStyle,
      this.textAlignVertical,
      this.textDirection,
      this.readOnly = false,
      this.minLines,
      this.maxLength,
      this.keyboardType,
      this.icon,
      this.iconColor,
      this.hint,
      this.filled,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.onChanged,
      this.height,
      this.width,
      this.hintSize,
      this.fontSize,
      this.border,
      this.borderRadius,
      this.boxShadow,
      this.contentPadding,
      this.cursorHeight,
      this.cursorColor,
      this.prefix,
      this.sufix,
      this.prefixIcon,
      this.sufixIcon,
      this.fieldRadius,
      this.enabled,
      this.maxLines,
      this.onTap,
      this.autofocus,
      this.onSaved,
      this.validator,
      this.margin,
      this.padding,
      this.hintColor,
      this.errorText,
      this.textInputAction,
      this.borderSide,
      this.borderSideFocus,
      this.obscureText,
      this.label,
      this.fontWeight,
      this.outLineBorderEnabled = true,
      this.textCapitalization = TextCapitalization.none, this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        // height: height,
        padding: padding,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: TextFormField(
          inputFormatters: inputFormatter,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction ?? TextInputAction.done,
          validator: validator,
          onSaved: onSaved,
          autofocus: autofocus ?? false,
          textAlignVertical: textAlignVertical ?? TextAlignVertical.top,
          enabled: enabled,
          controller: controller,
          cursorColor: cursorColor,
          cursorHeight: cursorHeight,
          onChanged: onChanged,
          maxLines: maxLines,
          maxLength: maxLength,
          expands: expands,
          readOnly: readOnly,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          style: style ??
              TextStyle(
                  fontSize: fontSize ?? 15,
                  fontWeight: fontWeight ?? FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  fontFamily:  "Poppins_Regular",
                  color: Colors.black),
          decoration: InputDecoration(
            constraints: BoxConstraints(
              maxHeight: height??55
            ),
            errorText: errorText,
            counterText: "",
            prefix: prefix,
            suffix: sufix,
            prefixIcon: prefixIcon,
            suffixIcon: sufixIcon,
            filled: filled ?? true,
            fillColor: fillColor ?? Colors.grey.shade100,
            hintText: hint,
            label: label,
            hintStyle:  TextStyle(
                fontSize: hintSize ?? AppConstant.fontSizeTwo,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                fontFamily:  "Poppins_Regular",
                color: hintColor ?? Colors.grey),
            contentPadding: contentPadding ??
                const EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 8),

            disabledBorder: outLineBorderEnabled
                ? OutlineInputBorder(
                    borderSide: borderSide ?? BorderSide.none,
                    borderRadius: fieldRadius == null
                        ? const BorderRadius.all(Radius.circular(8.0))
                        : fieldRadius!)
                : UnderlineInputBorder(
                    borderSide: borderSide ?? BorderSide.none,
                    borderRadius: fieldRadius ??
                        const BorderRadius.all(Radius.circular(8.0))),
            border: outLineBorderEnabled
                ? OutlineInputBorder(
                    borderSide: borderSide ?? BorderSide.none,
                    borderRadius: fieldRadius == null
                        ? const BorderRadius.all(Radius.circular(8.0))
                        : fieldRadius!)
                : UnderlineInputBorder(
                    borderSide: borderSide ?? BorderSide.none,
                    borderRadius: fieldRadius ??
                        const BorderRadius.all(Radius.circular(8.0))),
            enabledBorder: outLineBorderEnabled
                ? OutlineInputBorder(
                    borderSide: borderSide ?? BorderSide.none,
                    borderRadius: fieldRadius == null
                        ? const BorderRadius.all(Radius.circular(8.0))
                        : fieldRadius!)
                : UnderlineInputBorder(
                    borderSide: borderSide ?? BorderSide.none,
                    borderRadius: fieldRadius ??
                        const BorderRadius.all(Radius.circular(8.0))),
            focusedBorder: outLineBorderEnabled
                ? OutlineInputBorder(
                    borderSide:BorderSide(color: AppColor.primaryColor),
                    borderRadius: fieldRadius == null
                        ? const BorderRadius.all(Radius.circular(8.0))
                        : fieldRadius!)
                : UnderlineInputBorder(
                    borderSide: borderSideFocus ?? BorderSide.none,
                    borderRadius: fieldRadius ??
                        const BorderRadius.all(Radius.circular(8.0))),
          ),
        ),
      ),
    );
  }
}
