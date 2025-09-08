import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';

class MechanixTextInput<T> extends StatefulWidget {
  const MechanixTextInput.textInput({
    super.key,
    this.isPasswordField = false,
    this.onChanged,
    this.hintText,
    this.isFormField = false,
    this.inputDecoration,
    this.validator,
    this.onFieldSubmitted,
    this.label,
  });

  const MechanixTextInput.password({
    super.key,
    this.isPasswordField = true,
    this.onChanged,
    this.hintText,
    this.isFormField = false,
    this.inputDecoration,
    this.label,
    this.onFieldSubmitted,
    this.validator,
  });

  final String? label;

  final bool isPasswordField;

  final bool isFormField;

  final ValueChanged<String>? onChanged;

  final InputDecoration? inputDecoration;

  final String? hintText;

  // final FormFieldValidator<T>? validator;

  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  State<MechanixTextInput> createState() => _MechanixTextInputState();
}

class _MechanixTextInputState extends State<MechanixTextInput> {
  bool obscureText = true;
  late TextEditingController _controller;

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label ?? '',
            style: context.textTheme.labelMedium
                ?.copyWith(color: Color(0xFF898A8D)),
          ).padBottom(8),
        if (widget.isFormField)
          TextFormField(
            controller: _controller,
            obscureText: widget.isPasswordField ? obscureText : false,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
                fillColor: Color(0xFF2B2B2B),
                filled: true,
                contentPadding: Spacing.all(16),
                hintText: widget.hintText,
                hintStyle: context.textTheme.labelMedium
                    ?.copyWith(color: Color(0xFF898A8D)),
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: togglePasswordVisibility,
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                    borderRadius: CircularRadius.sm,
                    borderSide: context.borderSideXs),
                border: OutlineInputBorder(
                    borderRadius: CircularRadius.sm,
                    borderSide: context.borderSideXs)),
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            validator: widget.validator,
          )
        else
          TextField(
            controller: _controller,
            obscureText: widget.isPasswordField ? obscureText : false,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
                fillColor: Color(0xFF2B2B2B),
                filled: true,
                contentPadding: Spacing.all(16),
                hintText: widget.hintText,
                hintStyle: context.textTheme.labelMedium
                    ?.copyWith(color: Color(0xFF898A8D)),
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: togglePasswordVisibility,
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                    borderRadius: CircularRadius.sm,
                    borderSide: context.borderSideXs),
                border: OutlineInputBorder(
                    borderRadius: CircularRadius.sm,
                    borderSide: context.borderSideXs)),
            onChanged: widget.onChanged,
          ),
      ],
    );
  }
}
