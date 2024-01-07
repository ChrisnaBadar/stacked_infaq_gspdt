// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String AmmountValueKey = 'ammount';
const String NameValueKey = 'name';
const String LastNameValueKey = 'lastName';
const String EmailValueKey = 'email';
const String PhoneValueKey = 'phone';
const String AddressValueKey = 'address';
const String DoaValueKey = 'doa';

final Map<String, TextEditingController> _DonateDialogTextEditingControllers =
    {};

final Map<String, FocusNode> _DonateDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _DonateDialogTextValidations = {
  AmmountValueKey: null,
  NameValueKey: null,
  LastNameValueKey: null,
  EmailValueKey: null,
  PhoneValueKey: null,
  AddressValueKey: null,
  DoaValueKey: null,
};

mixin $DonateDialog {
  TextEditingController get ammountController =>
      _getFormTextEditingController(AmmountValueKey);
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get phoneController =>
      _getFormTextEditingController(PhoneValueKey);
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);
  TextEditingController get doaController =>
      _getFormTextEditingController(DoaValueKey);

  FocusNode get ammountFocusNode => _getFormFocusNode(AmmountValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get phoneFocusNode => _getFormFocusNode(PhoneValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);
  FocusNode get doaFocusNode => _getFormFocusNode(DoaValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_DonateDialogTextEditingControllers.containsKey(key)) {
      return _DonateDialogTextEditingControllers[key]!;
    }

    _DonateDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DonateDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DonateDialogFocusNodes.containsKey(key)) {
      return _DonateDialogFocusNodes[key]!;
    }
    _DonateDialogFocusNodes[key] = FocusNode();
    return _DonateDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    ammountController.addListener(() => _updateFormData(model));
    nameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    doaController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    ammountController.addListener(() => _updateFormData(model));
    nameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    doaController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AmmountValueKey: ammountController.text,
          NameValueKey: nameController.text,
          LastNameValueKey: lastNameController.text,
          EmailValueKey: emailController.text,
          PhoneValueKey: phoneController.text,
          AddressValueKey: addressController.text,
          DoaValueKey: doaController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _DonateDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DonateDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _DonateDialogTextEditingControllers.clear();
    _DonateDialogFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get ammountValue => this.formValueMap[AmmountValueKey] as String?;
  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get phoneValue => this.formValueMap[PhoneValueKey] as String?;
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;
  String? get doaValue => this.formValueMap[DoaValueKey] as String?;

  set ammountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AmmountValueKey: value}),
    );

    if (_DonateDialogTextEditingControllers.containsKey(AmmountValueKey)) {
      _DonateDialogTextEditingControllers[AmmountValueKey]?.text = value ?? '';
    }
  }

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_DonateDialogTextEditingControllers.containsKey(NameValueKey)) {
      _DonateDialogTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_DonateDialogTextEditingControllers.containsKey(LastNameValueKey)) {
      _DonateDialogTextEditingControllers[LastNameValueKey]?.text = value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_DonateDialogTextEditingControllers.containsKey(EmailValueKey)) {
      _DonateDialogTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  set phoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneValueKey: value}),
    );

    if (_DonateDialogTextEditingControllers.containsKey(PhoneValueKey)) {
      _DonateDialogTextEditingControllers[PhoneValueKey]?.text = value ?? '';
    }
  }

  set addressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AddressValueKey: value}),
    );

    if (_DonateDialogTextEditingControllers.containsKey(AddressValueKey)) {
      _DonateDialogTextEditingControllers[AddressValueKey]?.text = value ?? '';
    }
  }

  set doaValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DoaValueKey: value}),
    );

    if (_DonateDialogTextEditingControllers.containsKey(DoaValueKey)) {
      _DonateDialogTextEditingControllers[DoaValueKey]?.text = value ?? '';
    }
  }

  bool get hasAmmount =>
      this.formValueMap.containsKey(AmmountValueKey) &&
      (ammountValue?.isNotEmpty ?? false);
  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasPhone =>
      this.formValueMap.containsKey(PhoneValueKey) &&
      (phoneValue?.isNotEmpty ?? false);
  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);
  bool get hasDoa =>
      this.formValueMap.containsKey(DoaValueKey) &&
      (doaValue?.isNotEmpty ?? false);

  bool get hasAmmountValidationMessage =>
      this.fieldsValidationMessages[AmmountValueKey]?.isNotEmpty ?? false;
  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey]?.isNotEmpty ?? false;
  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;
  bool get hasDoaValidationMessage =>
      this.fieldsValidationMessages[DoaValueKey]?.isNotEmpty ?? false;

  String? get ammountValidationMessage =>
      this.fieldsValidationMessages[AmmountValueKey];
  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get phoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey];
  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
  String? get doaValidationMessage =>
      this.fieldsValidationMessages[DoaValueKey];
}

extension Methods on FormStateHelper {
  setAmmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmmountValueKey] = validationMessage;
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneValueKey] = validationMessage;
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;
  setDoaValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DoaValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    ammountValue = '';
    nameValue = '';
    lastNameValue = '';
    emailValue = '';
    phoneValue = '';
    addressValue = '';
    doaValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AmmountValueKey: getValidationMessage(AmmountValueKey),
      NameValueKey: getValidationMessage(NameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
      DoaValueKey: getValidationMessage(DoaValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _DonateDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _DonateDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AmmountValueKey: getValidationMessage(AmmountValueKey),
      NameValueKey: getValidationMessage(NameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
      DoaValueKey: getValidationMessage(DoaValueKey),
    });
