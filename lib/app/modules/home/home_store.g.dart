// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$realControllerAtom =
      Atom(name: 'HomeStoreBase.realController', context: context);

  @override
  TextEditingController get realController {
    _$realControllerAtom.reportRead();
    return super.realController;
  }

  @override
  set realController(TextEditingController value) {
    _$realControllerAtom.reportWrite(value, super.realController, () {
      super.realController = value;
    });
  }

  late final _$dolarControllerAtom =
      Atom(name: 'HomeStoreBase.dolarController', context: context);

  @override
  TextEditingController get dolarController {
    _$dolarControllerAtom.reportRead();
    return super.dolarController;
  }

  @override
  set dolarController(TextEditingController value) {
    _$dolarControllerAtom.reportWrite(value, super.dolarController, () {
      super.dolarController = value;
    });
  }

  late final _$euroControllerAtom =
      Atom(name: 'HomeStoreBase.euroController', context: context);

  @override
  TextEditingController get euroController {
    _$euroControllerAtom.reportRead();
    return super.euroController;
  }

  @override
  set euroController(TextEditingController value) {
    _$euroControllerAtom.reportWrite(value, super.euroController, () {
      super.euroController = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: 'HomeStoreBase.formKey', context: context);

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  late final _$infoTextAtom =
      Atom(name: 'HomeStoreBase.infoText', context: context);

  @override
  String get infoText {
    _$infoTextAtom.reportRead();
    return super.infoText;
  }

  @override
  set infoText(String value) {
    _$infoTextAtom.reportWrite(value, super.infoText, () {
      super.infoText = value;
    });
  }

  late final _$dolarValueAtom =
      Atom(name: 'HomeStoreBase.dolarValue', context: context);

  @override
  double get dolarValue {
    _$dolarValueAtom.reportRead();
    return super.dolarValue;
  }

  @override
  set dolarValue(double value) {
    _$dolarValueAtom.reportWrite(value, super.dolarValue, () {
      super.dolarValue = value;
    });
  }

  late final _$euroValueAtom =
      Atom(name: 'HomeStoreBase.euroValue', context: context);

  @override
  double get euroValue {
    _$euroValueAtom.reportRead();
    return super.euroValue;
  }

  @override
  set euroValue(double value) {
    _$euroValueAtom.reportWrite(value, super.euroValue, () {
      super.euroValue = value;
    });
  }

  late final _$makeGetRequestAsyncAction =
      AsyncAction('HomeStoreBase.makeGetRequest', context: context);

  @override
  Future<void> makeGetRequest() {
    return _$makeGetRequestAsyncAction.run(() => super.makeGetRequest());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void resetFields() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetFields');
    try {
      return super.resetFields();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
realController: ${realController},
dolarController: ${dolarController},
euroController: ${euroController},
formKey: ${formKey},
infoText: ${infoText},
dolarValue: ${dolarValue},
euroValue: ${euroValue}
    ''';
  }
}
