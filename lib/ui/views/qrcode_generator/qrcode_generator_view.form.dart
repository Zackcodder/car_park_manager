// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String SubjectValueKey = 'subject';

final Map<String, TextEditingController>
    _QrcodeGeneratorViewTextEditingControllers = {};

final Map<String, FocusNode> _QrcodeGeneratorViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _QrcodeGeneratorViewTextValidations = {
  SubjectValueKey: null,
};

mixin $QrcodeGeneratorView {
  TextEditingController get subjectController =>
      _getFormTextEditingController(SubjectValueKey);
  FocusNode get subjectFocusNode => _getFormFocusNode(SubjectValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_QrcodeGeneratorViewTextEditingControllers.containsKey(key)) {
      return _QrcodeGeneratorViewTextEditingControllers[key]!;
    }

    _QrcodeGeneratorViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _QrcodeGeneratorViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_QrcodeGeneratorViewFocusNodes.containsKey(key)) {
      return _QrcodeGeneratorViewFocusNodes[key]!;
    }
    _QrcodeGeneratorViewFocusNodes[key] = FocusNode();
    return _QrcodeGeneratorViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    subjectController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    subjectController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          SubjectValueKey: subjectController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _QrcodeGeneratorViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _QrcodeGeneratorViewFocusNodes.values) {
      focusNode.dispose();
    }

    _QrcodeGeneratorViewTextEditingControllers.clear();
    _QrcodeGeneratorViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get subjectValue => this.formValueMap[SubjectValueKey] as String?;

  set subjectValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          SubjectValueKey: value,
        }),
    );

    if (_QrcodeGeneratorViewTextEditingControllers.containsKey(
        SubjectValueKey)) {
      _QrcodeGeneratorViewTextEditingControllers[SubjectValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasSubject =>
      this.formValueMap.containsKey(SubjectValueKey) &&
      (subjectValue?.isNotEmpty ?? false);

  bool get hasSubjectValidationMessage =>
      this.fieldsValidationMessages[SubjectValueKey]?.isNotEmpty ?? false;

  String? get subjectValidationMessage =>
      this.fieldsValidationMessages[SubjectValueKey];
}

extension Methods on FormViewModel {
  setSubjectValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SubjectValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    subjectValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      SubjectValueKey: getValidationMessage(SubjectValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _QrcodeGeneratorViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _QrcodeGeneratorViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      SubjectValueKey: getValidationMessage(SubjectValueKey),
    });
