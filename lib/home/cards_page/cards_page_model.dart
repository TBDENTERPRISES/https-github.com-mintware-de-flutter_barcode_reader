import '/flutter_flow/flutter_flow_util.dart';
import '/home/nav_bar1/nav_bar1_widget.dart';
import 'cards_page_widget.dart' show CardsPageWidget;
import 'package:flutter/material.dart';

class CardsPageModel extends FlutterFlowModel<CardsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBar1Model.dispose();
  }
}
