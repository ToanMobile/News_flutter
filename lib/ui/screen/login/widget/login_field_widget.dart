import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/generated/i18n.dart';
import 'package:news/res/colors.dart';
import 'package:news/res/dimens.dart';
import 'package:news/res/text_styles.dart';

class LoginTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;

  LoginTextField({
    this.label,
    this.icon,
    this.controller,
    this.obscureText: false,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  TextEditingController controller;

  ValueNotifier<bool> obscureNotifier;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    obscureNotifier = ValueNotifier(widget.obscureText);
    super.initState();
  }

  @override
  void dispose() {
    obscureNotifier.dispose();
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: obscureNotifier,
      builder: (context, value, child) => TextFormField(
        controller: controller,
        obscureText: value,
        validator: (text) {
          var validator = widget.validator ?? (_) => null;
          return text.trim().length > 0 ? validator(text) : S.of(context).fieldNotNull;
        },
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: theme.hintColor, size: DimensUtils.size20),
          hintText: widget.label,
          hintStyle: TextStylesUtils.styleAvenir14BlackW400,
          suffixIcon: LoginTextFieldSuffixIcon(
            controller: controller,
            obscureText: widget.obscureText,
            obscureNotifier: obscureNotifier,
          ),
          filled: true,
          fillColor: ColorsUtils.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DimensUtils.size30),
          ),
        ),
      ),
    );
  }
}

class LoginTextFieldSuffixIcon extends StatelessWidget {
  final TextEditingController controller;

  final ValueNotifier<bool> obscureNotifier;

  final bool obscureText;

  LoginTextFieldSuffixIcon({this.controller, this.obscureNotifier, this.obscureText});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DimensUtils.size8, vertical: DimensUtils.size4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Offstage(
            offstage: !obscureText,
            child: InkWell(
              onTap: () {
//              debugPrint('onTap');
                obscureNotifier.value = !obscureNotifier.value;
              },
              child: ValueListenableBuilder(
                valueListenable: obscureNotifier,
                builder: (context, value, child) => Icon(
                  Icons.remove_red_eye,
                  size: DimensUtils.size20,
                  color: value ? theme.hintColor : theme.accentColor,
                ),
              ),
            ),
          ),
          LoginTextFieldClearIcon(controller)
        ],
      ),
    );
  }
}

class LoginTextFieldClearIcon extends StatefulWidget {
  final TextEditingController controller;

  LoginTextFieldClearIcon(this.controller);

  @override
  _LoginTextFieldClearIconState createState() => _LoginTextFieldClearIconState();
}

class _LoginTextFieldClearIconState extends State<LoginTextFieldClearIcon> {
  ValueNotifier<bool> notifier;

  @override
  void initState() {
    notifier = ValueNotifier(widget.controller.text.isEmpty);
    widget.controller.addListener(() {
      notifier.value = widget.controller.text.isEmpty;
    });
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, bool value, child) {
        return Offstage(
          offstage: value,
          child: child,
        );
      },
      child: InkWell(
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.controller.clear();
            });
          },
          child: Icon(CupertinoIcons.clear, size: DimensUtils.size20, color: Theme.of(context).hintColor)),
    );
  }
}
