import '/flutter_flow/flutter_flow_util.dart';
import 'pagoqr03_widget.dart' show Pagoqr03Widget;
import 'package:flutter/material.dart';

class Pagoqr03Model extends FlutterFlowModel<Pagoqr03Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
