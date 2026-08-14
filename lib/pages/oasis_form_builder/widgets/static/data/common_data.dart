import 'package:clinician_app/pages/oasis_form_builder/constants/app_asset.dart';
import 'package:clinician_app/pages/oasis_form_builder/model/icon_with_label.dart';

class CommonData {
  static IconWithLabel getBedgeIconData(String flag) {
    switch (flag) {
      case "*":
        return IconWithLabel(
            iconPath: AppAsset.starBedgeIcon, label: 'Star Rating');
      case "P":
        return IconWithLabel(
            iconPath: AppAsset.pBedgeIcon, label: 'Process Measure');
      case "!":
        return IconWithLabel(
            iconPath: AppAsset.explanationBedgeIcon,
            label: 'Potentially Avoidable');
      case "V":
        return IconWithLabel(iconPath: AppAsset.vBedgeIcon, label: 'VBP');
      case "O":
        return IconWithLabel(
            iconPath: AppAsset.oBedgeIcon, label: 'Outcome Measure');
      case "CC":
        return IconWithLabel(
            iconPath: AppAsset.ccBedgeIcon, label: 'Care Compare');
      case "\$":
        return IconWithLabel(iconPath: AppAsset.dollarBedgeIcon, label: 'PDGM');
      default:
        return IconWithLabel(
            iconPath: AppAsset.starBedgeIcon, label: 'Star Rating');
    }
  }
}
