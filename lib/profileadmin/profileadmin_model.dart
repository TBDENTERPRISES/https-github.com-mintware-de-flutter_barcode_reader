import '/flutter_flow/flutter_flow_util.dart';
import 'profileadmin_widget.dart' show ProfileadminWidget;
import 'package:flutter/material.dart';

class ProfileadminModel extends FlutterFlowModel<ProfileadminWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
