// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:MoveGreen/component/textfield/shake_widget.dart';
import 'package:MoveGreen/constant/one_colors.dart';
import 'package:MoveGreen/constant/one_icons.dart';
import 'package:MoveGreen/constant/one_theme.dart';
import 'package:MoveGreen/shared/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

part 'one_textfield_controller.dart';
part 'one_textfield_value.dart';

enum OneTextFieldStyle { underline, outline, none, border }

enum OneIconStyle { svg, image }

class OneTextField extends StatefulWidget {
  const OneTextField({
    Key? key,
    this.titleText,
    this.titleStyle,
    this.hintText,
    this.hintStyle,
    this.errorText,
    this.textStyle,
    this.enable,
    this.keyboardType = TextInputType.text,
    this.visibility = OneVisibility.VISIBLE,
    this.padding,
    this.controller,
    this.isRequired,
    this.isAlwaysShowTitle = true,
    this.clearable = false,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
    this.onTapClear,
    this.suffixIconAssetPath,
    this.suffixIconStyle = OneIconStyle.svg,
    this.suffixColor,
    this.suffixIconOnTap,
    this.prefixIconStyle = OneIconStyle.svg,
    this.prefixIconAssetPath,
    this.prefixColor,
    this.onEditingCompleted,
    this.onChanged,
    this.onFocusChanged,
    this.onFiltered,
    this.filterDuration,
    this.orientation = OneOrientation.VERTICAL,
    this.labelFlex = 1,
    this.errorMaxLines = 1,
    this.textFlex = 1,
    this.textAlign = TextAlign.start,
    this.style = OneTextFieldStyle.underline,
    this.borderColor,
    this.inputFormatters,
    this.maxLength,
    this.enableInteractiveSelection = true,
    this.autofillHints,
    this.counterText,
    this.errorShake,
  })  : assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
        super(key: key);

  final String? titleText;
  final TextStyle? titleStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final bool? errorShake;
  final TextStyle? textStyle;
  final bool? enable;
  final TextInputType keyboardType;
  final OneVisibility visibility;
  final EdgeInsetsGeometry? padding;
  final OneTextFieldController? controller;
  final bool? isRequired;
  final bool isAlwaysShowTitle;
  final bool clearable;
  final bool readOnly;
  final bool obscureText;
  final int? maxLines;
  final int minLines;
  final VoidCallback? onTap;
  final VoidCallback? onTapClear;
  final String? suffixIconAssetPath;
  final OneIconStyle? suffixIconStyle;
  final Color? suffixColor;
  final VoidCallback? suffixIconOnTap;
  final String? prefixIconAssetPath;
  final OneIconStyle? prefixIconStyle;
  final Color? prefixColor;
  final ValueChanged<String>? onEditingCompleted;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<String>? onFiltered;
  final Duration? filterDuration;
  final OneOrientation orientation;
  final int labelFlex;
  final int textFlex;
  final int errorMaxLines;
  final TextAlign textAlign;
  final OneTextFieldStyle style;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool enableInteractiveSelection;
  final Iterable<String>? autofillHints;
  final String? counterText;
  @override
  _OneTextFieldState createState() => _OneTextFieldState();
}

class _OneTextFieldState extends State<OneTextField> with TickerProviderStateMixin {
  late OneTextFieldController _controller;
  OneTextFieldController get _effectiveController => widget.controller ?? _controller;

  late final TextEditingController _txtController;
  late final StreamController<String> _textUpdates;
  late final ValueNotifier<bool> _hasText;
  late final FocusNode _focusNode;

  TextStyle? get _titleStyle {
    // if (widget.orientation == OneOrientation.HORIZONTAL) {
    //   if (widget.titleStyle != null && widget.style == OneTextFieldStyle.none) return widget.titleStyle;
    //   if (!enable) return OneTheme.of(context).textFieldLabelHorizDisabled;
    //   if (_focusNode.hasFocus) return OneTheme.of(context).textFieldLabelHorizFocused;
    //   return OneTheme.of(context).textFieldLabelHoriz;
    // }
    // if (widget.titleStyle != null && widget.style == OneTextFieldStyle.none) return widget.titleStyle;
    // if (!enable) return OneTheme.of(context).textFieldLabelDisabled;
    // if (_focusNode.hasFocus) return OneTheme.of(context).textFieldLabelFocused;
    return OneTheme.of(context).textFieldLabel;
  }

  TextStyle? get _textStyle {
    if (widget.textStyle != null && widget.style == OneTextFieldStyle.none) return widget.textStyle;
    if (!enable) return OneTheme.of(context).textFieldTextDisabled;
    return OneTheme.of(context).textFieldText;
  }

  String? get _titleText {
    if (widget.style != OneTextFieldStyle.none) return widget.titleText;
    return null;
  }

  InputBorder? get _enabledBorder {
    switch (widget.style) {
      case OneTextFieldStyle.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.textGrey1.withOpacity(0.5)),
        );
      case OneTextFieldStyle.outline:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.textGrey1.withOpacity(0.5)),
        );
      case OneTextFieldStyle.none:
        return const UnderlineInputBorder(
          borderSide: BorderSide.none,
        );
      case OneTextFieldStyle.border:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.textGrey1.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(22.0),
        );
    }
  }

  InputBorder? get _disabledBorder {
    switch (widget.style) {
      case OneTextFieldStyle.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.textGrey1.withOpacity(0.5)),
        );
      case OneTextFieldStyle.outline:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.textGrey1.withOpacity(0.5)),
        );
      case OneTextFieldStyle.none:
        return const UnderlineInputBorder(
          borderSide: BorderSide.none,
        );
      case OneTextFieldStyle.border:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.textGrey1.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(22.0),
        );
    }
  }

  InputBorder? get _focusedBorder {
    switch (widget.style) {
      case OneTextFieldStyle.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.brandVNPT),
        );
      case OneTextFieldStyle.outline:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.brandVNPT),
        );
      case OneTextFieldStyle.none:
        return const UnderlineInputBorder(
          borderSide: BorderSide.none,
        );
      case OneTextFieldStyle.border:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.readOnly ? OneColors.textGrey1.withOpacity(0.5) : OneColors.brandVNPT),
          borderRadius: BorderRadius.circular(22.0),
        );
    }
  }

  InputBorder? get _errorBorder {
    switch (widget.style) {
      case OneTextFieldStyle.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.error),
        );
      case OneTextFieldStyle.outline:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.error),
        );
      case OneTextFieldStyle.none:
        return const UnderlineInputBorder(
          borderSide: BorderSide.none,
        );
      case OneTextFieldStyle.border:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.error),
          borderRadius: BorderRadius.circular(22.0),
        );
    }
  }

  InputBorder? get _focusedErrorBorder {
    switch (widget.style) {
      case OneTextFieldStyle.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.error),
        );
      case OneTextFieldStyle.outline:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.error),
        );
      case OneTextFieldStyle.none:
        return const UnderlineInputBorder(
          borderSide: BorderSide.none,
        );
      case OneTextFieldStyle.border:
        return OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? OneColors.error),
          borderRadius: BorderRadius.circular(22.0),
        );
    }
  }

  EdgeInsets? get _contentPadding {
    switch (widget.style) {
      case OneTextFieldStyle.underline:
        return EdgeInsets.fromLTRB(_hasPrefixIcon ? 25 : 0, 2, hasSuffix ? 24 : 0, 6);
      case OneTextFieldStyle.outline:
        return EdgeInsets.fromLTRB(_hasPrefixIcon ? 35 : 10, 10, hasSuffix ? 24 : 10, 10);
      case OneTextFieldStyle.none:
        return EdgeInsets.fromLTRB(_hasPrefixIcon ? 25 : 0, hasSuffix ? 3 : 0, hasSuffix ? 30 : 10, hasSuffix ? 4 : 0);
      case OneTextFieldStyle.border:
        return EdgeInsets.fromLTRB(_hasPrefixIcon ? 35 : 20, 10, hasSuffix ? 24 : 20, 10);
    }
  }

  Duration get filterDuration => widget.filterDuration ?? const Duration(milliseconds: 500);

  bool? _enable;
  bool get enable => _enable ?? _effectiveController.enable;

  OneVisibility? _visibility;
  OneVisibility get visibility => _visibility ?? _effectiveController.visibility;

  bool get isClearVisible => widget.clearable && enable;
  bool get hasSuffix => isClearVisible || widget.suffixIconAssetPath != null;
  bool get hasTitle => widget.titleText != null;
  bool get isTitleVisible => widget.titleText != null && (widget.isAlwaysShowTitle || _focusNode.hasFocus || _hasText.value);

  String? _errorText;
  String? get errorText => _errorText?.trim();
  bool get hasError => errorText != null && errorText!.isNotEmpty;
  bool? _isRequired;
  bool get isRequired => _isRequired ?? _effectiveController.isRequired;

  late final ShakeController _shakeController;

  Color? get _prefixColor => widget.prefixColor;
  String? get _prefixIconAssetPath => widget.prefixIconAssetPath?.trim();
  bool get _hasPrefixIcon => _prefixIconAssetPath?.isNotEmpty ?? false;

  @override
  void initState() {
    super.initState();
    _shakeController = ShakeController(vsync: this);
    _txtController = TextEditingController();
    _txtController.addListener(_handleTxtControllerChanged);
    _textUpdates = StreamController<String>();
    _textUpdates.stream.distinct().debounceTime(filterDuration).forEach(_onFiltered);
    _hasText = ValueNotifier(false);
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChanged);
    _enable = widget.enable;
    _isRequired = widget.isRequired;
    _errorText = widget.errorText;

    if (widget.controller == null) {
      _controller = OneTextFieldController(
        text: _txtController.text,
        visibility: widget.visibility,
        enable: widget.enable ?? true,
        isRequired: widget.isRequired ?? false,
      );
    } else {
      widget.controller!.shake = _shake;
      widget.controller!.hasFocus = _hasFocus;
      widget.controller!.setSelection = _setSelection;
      widget.controller!.addListener(_handleControllerChanged);
      _txtController.text = widget.controller!.text;
      _visibility = widget.visibility;
      if (widget.isRequired != null) widget.controller!.isRequired = widget.isRequired!;
      if (widget.enable != null) widget.controller!.enable = widget.enable!;
    }
  }

  @override
  void didUpdateWidget(OneTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller = OneTextFieldController.fromValue(oldWidget.controller!.value);
      }
      if (widget.controller != null) {
        _txtController.text = widget.controller!.text;
        if (oldWidget.controller == null) {
          _controller = OneTextFieldController(
            enable: widget.enable ?? true,
            text: _txtController.text,
            visibility: widget.visibility,
          );
        }
      }
    }
    _errorText = widget.errorText ?? _effectiveController.errorText;
  }

  @override
  Widget build(BuildContext context) {
    return ShakeWidget(
      controller: _shakeController,
      child: widget.orientation == OneOrientation.HORIZONTAL ? _buildHorizontal(context) : _buildVertical(context),
    );
  }

  Widget _buildVertical(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (hasTitle && widget.style == OneTextFieldStyle.none) ...[_buildTitle(), const SizedBox(height: 7)],
        _buildTitle(),
        const SizedBox(height: 10),
        Stack(
          clipBehavior: Clip.none,
          children: [
            if (_hasPrefixIcon) _buildPrefixIcon(),
            _buildTextfield(context),
            _buildSuffix(),
          ],
        ),
      ],
    );
  }

  Widget _buildHorizontal(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasTitle && widget.style == OneTextFieldStyle.none) ...[
          Expanded(
            flex: widget.labelFlex,
            child: _buildTitle(OneOrientation.HORIZONTAL),
          ),
          const SizedBox(width: 7)
        ],
        Expanded(
          flex: widget.textFlex,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (_hasPrefixIcon) _buildPrefixIcon(),
              _buildTextfield(context),
              _buildSuffix(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTitle([OneOrientation orientation = OneOrientation.VERTICAL]) {
    return ValueListenableBuilder(
      valueListenable: _hasText,
      builder: (context, value, child) {
        return !isTitleVisible
            ? const SizedBox(height: 15)
            : Text.rich(
                TextSpan(
                  style: _titleStyle,
                  children: [
                    TextSpan(text: widget.titleText),
                    if (isRequired && isTitleVisible) TextSpan(text: ' * ', style: _titleStyle!.copyWith(color: OneColors.error)),
                  ],
                ),
                maxLines: widget.maxLines ?? 1,
                overflow: TextOverflow.fade,
              );
      },
    );
  }

  Widget _buildTextfield(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: _txtController,
      focusNode: _focusNode,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      onTap: widget.onTap,
      scrollPadding: const EdgeInsets.only(bottom: 100),
      enableInteractiveSelection: widget.enableInteractiveSelection,
      autofillHints: widget.autofillHints,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: OneTheme.of(context).s16w4GreyBlur,
        hintText: widget.hintText,
        hintMaxLines: widget.maxLines,
        errorText: errorText,
        errorStyle: OneTheme.of(context).textFieldError,
        errorMaxLines: widget.errorMaxLines,
        focusColor: OneColors.brandVNPT,
        focusedBorder: _focusedBorder,
        enabledBorder: _enabledBorder,
        disabledBorder: _disabledBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _focusedErrorBorder,
        isDense: true,
        contentPadding: _contentPadding,
        enabled: enable,
        counterText: widget.counterText,
      ),
      inputFormatters: widget.inputFormatters,
      textAlign: widget.textAlign,
      style: _textStyle,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.done,
      obscureText: widget.obscureText,
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        _focusNode.unfocus();
        if (widget.onEditingCompleted != null) {
          widget.onEditingCompleted!(_txtController.text);
        }
      },
    );
  }

  Widget _buildSuffix() {
    final suffixIcon = widget.suffixIconAssetPath != null
        ? Padding(
            padding: (widget.style == OneTextFieldStyle.none || widget.style == OneTextFieldStyle.underline) ? const EdgeInsets.all(0) : const EdgeInsets.all(6),
            child: SizedBox(
              height: hasError ? 19 : null,
              width: hasError ? 19 : null,
              child: widget.suffixIconStyle == OneIconStyle.svg
                  ? SvgPicture.asset(
                      widget.suffixIconAssetPath!,
                      color: widget.suffixColor,
                    )
                  : Image.asset(
                      widget.suffixIconAssetPath!,
                      color: widget.suffixColor,
                    ),
            ),
          )
        : const SizedBox();

    final suffixIconWidget = InkWell(
        onTap: widget.suffixIconOnTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: suffixIcon,
        ));
    return Positioned.fill(
      right: -3.0,
      child: Align(
        alignment: Alignment.topRight,
        child: isClearVisible
            ? ValueListenableBuilder<bool>(
                valueListenable: _hasText,
                builder: (context, value, child) {
                  return value
                      ? InkWell(
                          onTap: widget.onTapClear ?? (!widget.readOnly ? () => _txtController.clear() : null),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                            child: SvgPicture.asset(OneIcons.ic_cancel),
                          ),
                        )
                      : suffixIconWidget;
                },
              )
            : suffixIconWidget,
      ),
    );
  }

  Widget _buildPrefixIcon() {
    final _prefixIcon = widget.prefixIconStyle == OneIconStyle.svg
        ? SvgPicture.asset(
            _prefixIconAssetPath!,
            color: _prefixColor,
          )
        : Image.asset(
            _prefixIconAssetPath!,
            color: _prefixColor,
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.style == OneTextFieldStyle.outline || widget.style == OneTextFieldStyle.border) const SizedBox(height: 7),
        if (widget.style == OneTextFieldStyle.none) const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5),
            _prefixIcon,
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _txtController.removeListener(_handleTxtControllerChanged);
    _textUpdates.close();
    _focusNode.removeListener(_handleFocusChanged);
    _focusNode.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  void _handleTxtControllerChanged() {
    final _txtTrim = _txtController.text.trim();
    _hasText.value = _txtTrim.isNotEmpty;
    if (_effectiveController.text.trim() != _txtTrim) {
      _effectiveController.text = _txtTrim;
    }
    _textUpdates.add(_txtTrim);
    if (widget.onChanged != null) {
      widget.onChanged!(_txtTrim);
    }
  }

  void _handleControllerChanged() {
    if (_effectiveController.text.trim() != _txtController.text.trim()) {
      _txtController.text = _effectiveController.text.trim();
    }

    setState(() {
      _enable = _effectiveController.enable;
      _errorText = _effectiveController.errorText?.trim();
      _visibility = _effectiveController.visibility;
      _isRequired = _effectiveController.isRequired;
    });
  }

  void _onFiltered(String s) {
    if (!mounted) return;
    if (widget.onFiltered != null) {
      widget.onFiltered!(s.trim());
    }
  }

  void _handleFocusChanged() {
    final _txtTrim = _txtController.text.trim();
    if (!_focusNode.hasFocus) if (_txtController.text != _txtTrim) _txtController.text = _txtTrim;
    if (widget.onFocusChanged != null) widget.onFocusChanged!(_focusNode.hasFocus);
  }

  void _shake({String? errorText}) {
    setState(() {
      _focusNode.requestFocus();
      _errorText = errorText?.trim();
      _effectiveController.errorText = errorText?.trim();
      _shakeController.shake();
    });
  }

  bool _hasFocus() => _focusNode.hasFocus;
  void _setSelection(TextSelection selection) => _txtController.selection = selection;
}
