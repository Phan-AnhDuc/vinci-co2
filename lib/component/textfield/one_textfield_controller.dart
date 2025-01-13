part of 'one_textfield.dart';

class OneTextFieldController extends ValueNotifier<OneTextFieldValue> {
  OneTextFieldController({
    String text = '',
    bool enable = true,
    OneVisibility visibility = OneVisibility.VISIBLE,
    bool isRequired = false,
  }) : super(OneTextFieldValue(
          text: text,
          enable: enable,
          visibility: visibility,
          isRequired: isRequired,
        ));

  OneTextFieldController.fromValue(OneTextFieldValue value) : super(value);

  String get text => value.text.trim();
  bool get enable => value.enable;
  OneVisibility get visibility => value.visibility;
  String? get errorText => value.errorText?.trim();
  bool get isRequired => value.isRequired;

  late Function({String? errorText}) shake;
  late bool Function() hasFocus;
  late Function(TextSelection selection) setSelection;

  set text(String text) => value = value.copyWith(text: text.trim());
  set enable(bool enable) => value = value.copyWith(enable: enable);
  set visibility(OneVisibility visibility) => value = value.copyWith(visibility: visibility);
  set errorText(String? errorText) => value = value.copyWith(errorText: errorText?.trim());
  set isRequired(bool isRequired) => value = value.copyWith(isRequired: isRequired);

  @override
  set value(OneTextFieldValue newValue) {
    super.value = newValue;
  }

  void clear() => text = '';
}
