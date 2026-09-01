import 'package:flutter/cupertino.dart';
import 'package:clinician_app/pages/oasis_form_builder/side_drawer/side_drawer_item.dart';

class SideDrawerProvider with ChangeNotifier {
  late SideDrawerItem activeSideDrawerItem;
  void updateSideBarItem(SideDrawerItem newSideDrawerItem) {
    activeSideDrawerItem = newSideDrawerItem;
    notifyListeners();
  }
}
