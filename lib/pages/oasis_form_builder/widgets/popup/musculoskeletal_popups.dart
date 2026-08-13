import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/popup_template.dart';

import '../../constants/app_colors.dart';

class MusculoskeletalStrengthPopup extends StatelessWidget {
  MusculoskeletalStrengthPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupTemplate(
        maxWidth: 400.w,
        body: [
          Text(
            'MMT Grades',
            style: FormBuilderTextStyle.bold14style
                .copyWith(color: AppColors.primaryAppLightColor),
            textAlign: TextAlign.center,
          ),
          sbh(20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Grade',
                  textAlign: TextAlign.center,
                  style: FormBuilderTextStyle.bold10Style,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  'Explanation',
                  style: FormBuilderTextStyle.bold10Style,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Divider(
            indent: 10.w,
            endIndent: 10.w,
            height: 20.h,
          ),
          ...rowData.keys.map(
            (key) => Padding(
              padding: EdgeInsets.only(bottom: 11.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      key,
                      textAlign: TextAlign.center,
                      style: FormBuilderTextStyle.bold10Style,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      rowData[key]!,
                      style: FormBuilderTextStyle.bold10Style,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        bottomButtons: null,
        title: '');
  }

  final Map<String, String> rowData = {
    "5": "Holds test position against maximal resistance",
    "4+": "Holds test position against moderate to strong resistance",
    "4": "Holds test position against moderate resistance",
    "4-": "Holds test position against slight to moderate resistance",
    "3+": "Holds test position against slight resistance",
    "3": "Holds test position against gravity",
    "3-": "Gradual released from test position",
    "2+":
        "Moves through partial ROM against gravity OR moves through complete ROM gravity eliminated and hold against pressure",
    "2": "Able to move through full ROM gravity eliminated",
    "2-": "Moves through partial ROM gravity eliminated",
    "1":
        "NO visible movement; palpable or observable tendon prominence/ flicker contraction",
    "0": "NO palpaable or observable muscle contraction",
  };
}

class MusculoskeletalRomUpperBody extends StatelessWidget {
  MusculoskeletalRomUpperBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupTemplate(
        maxWidth: 250.w,
        headerWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Upper Body Site',
                  style: FormBuilderTextStyle.bold14style.copyWith(
                      color: AppColors.primaryAppLightColor, fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'Normal ROM',
                  style: FormBuilderTextStyle.bold14style.copyWith(
                      color: AppColors.primaryAppLightColor, fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: [
          ...rowData.keys.map(
            (key) => Padding(
              padding: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key,
                    style: FormBuilderTextStyle.bold10Style,
                  ),
                  const Divider(),
                  ...rowData[key]!.keys.map(
                        (subKey) => Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    subKey,
                                    style: FormBuilderTextStyle.bold10Style,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    rowData[key]![subKey]!,
                                    style: FormBuilderTextStyle.bold10Style,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
        bottomButtons: null,
        title: '');
  }

  final Map<String, Map<String, String>> rowData = {
    "Neck (Cervical)": {
      "Flexion": "0-45°",
      "Extension": "0-45°",
      "Lateral Flexion": "0-45°",
      "Rotation": "0-80°",
    },
    "Trunk (Lumbar)": {
      "Flexion": "0-75°",
      "Extension": "0-35°",
      "Lateral Flexion": "0-35°",
      "Rotation": "0-20°",
    },
    "Shoulder": {
      "Flexion": "0-180°",
      "Extension": "0-45°",
      "Abducation": "0-180°",
      "Adducation": "0-50°",
      "Internal Rotation": "0-70°",
    },
    "Elbow": {
      "Flexion": "0-145°",
      "Extension": "0-10°",
    },
    "Forearm": {
      "Pronation": "0-90°",
      "Supination": "0-90°",
    },
    "Wrist": {
      "Flexion": "0-80°",
      "Extension": "0-70°",
      "Radial Deviation": "0-20°",
      "Ulnar Deviation": "0-35°",
    },
    "Hand": {
      "Finger Flexion": "MP 0-90°, PIP\n0-110°, DIP 0-90°",
      "Finger Extension": "MP 0-45°",
    },
  };
}

class MusculoskeletalRomLowerBody extends StatelessWidget {
  MusculoskeletalRomLowerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupTemplate(
        maxWidth: 250.w,
        headerWidget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Upper Body Site',
                  style: FormBuilderTextStyle.bold14style.copyWith(
                      color: AppColors.primaryAppLightColor, fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'Normal ROM',
                  style: FormBuilderTextStyle.bold14style.copyWith(
                      color: AppColors.primaryAppLightColor, fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: [
          ...rowData.keys.map(
            (key) => Padding(
              padding: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key,
                    style: FormBuilderTextStyle.bold10Style,
                  ),
                  const Divider(),
                  ...rowData[key]!.keys.map(
                        (subKey) => Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    subKey,
                                    style: FormBuilderTextStyle.bold10Style,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    rowData[key]![subKey]!,
                                    style: FormBuilderTextStyle.bold10Style,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
        bottomButtons: null,
        title: '');
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SizedBox(
        width: 250.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryAppLightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            sbh(15),
            sbh(20),
            Expanded(
              child: ListView(
                children: [],
              ),
            ),
            sbh(10)
          ],
        ),
      ),
    );
  }

  final Map<String, Map<String, String>> rowData = {
    "Hip": {
      "Flexion": "0-125°",
      "Extension": "0-10°",
      "Abduction": "0-45°",
      "Adduction": "0-35°",
      "Internal Rotation": "0-45°",
      "External Rotation": "0-45°",
    },
    "Knee": {
      "Flexion": "0-140°",
      "Extension": "0-10°",
    },
    "Ankle/Foot": {
      "Doorsiflexion": "0-20°",
      "Plantarflexion": "0-50°",
      "Inversion": "0-35°",
      "Eversion": "0-20°",
      "Great Toe Flexion": "0-45°",
      "Great Toe Extension": "0-45°",
    },
  };
}

class MusculoskeletalSitting extends StatelessWidget {
  final String sittingName;

  MusculoskeletalSitting({super.key, required this.sittingName});

  @override
  Widget build(BuildContext context) {
    final rowData = sittingName == "Static Sitting"
        ? staticSittingRowData
        : sittingName == "Dynamic Sitting"
            ? dynamicSittingRowData
            : sittingName == "Static Standing"
                ? staticStandingRowData
                : dynamicStandingRowData;
    return PopupTemplate(
        maxWidth: 250.w,
        body: [
          sbh(15),
          Text(
            '$sittingName',
            style: FormBuilderTextStyle.bold14style.copyWith(
                color: AppColors.primaryAppLightColor, fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
          sbh(20),
          ...rowData.keys.map(
            (key) => Padding(
              padding: EdgeInsets.only(bottom: 15.h, left: 10.w, right: 10.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      key,
                      style: FormBuilderTextStyle.bold10Style,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      rowData[key]!,
                      style: FormBuilderTextStyle.normal10style,
                    ),
                  ),
                ],
              ),
            ),
          ),
          sbh(10)
        ],
        bottomButtons: null,
        title: '');
  }

  final Map<String, String> staticSittingRowData = {
    "Normal": "Able to maintain balance against maximal resistance",
    "Good": "Able to maintain balance against moderate resistance",
    "G-/F+": "Accepts minimal resistance",
    "Fair":
        "Able to sit unsupported without balance loss and without UE support",
    "Poor+ ":
        "Able to maintain with minimal assistance from individual or chair",
    "Poor":
        "Unable to maintain balance - requires mod max support from individual or chair",
  };
  final Map<String, String> dynamicSittingRowData = {
    "Normal": "Able to sit unsupported & weight shift across midline maximally",
    "G-/F+": "Able to sit unsupported & weight shift across midline moderately",
    "Fair": "Able to sit unsupported and weight shift across midline minimally",
    "Fair-":
        "Minimal weight shifting ipsilateral/ front, difficulty crossing midline",
    "Poor+": "Reach to ipsilateral side and unable to weight shift",
    "Poor":
        "Able to sit unsupported with min A and reach to ipsilateral side,  unable to weight shift",
  };
  final Map<String, String> staticStandingRowData = {
    "Normal": "Able to maintain standing balance against maximal resistance",
    "Good": "Able to maintain standing balance against moderate resistance",
    "G-/F+": "Able to maintain standing balance against minimal resistance",
    "Fair":
        "Able to sit unsupported without UE support and without LOB for 1 - 2 min",
    "Fair-":
        "Requires Min A or UE support to maintain standing without balance loss",
    "Poor+":
        "Require Mod A and IJE support to maintain standing without balance loss",
    "Poor":
        "Require Max A and IJE support to maintain standing balance without loss",
  };
  final Map<String, String> dynamicStandingRowData = {
    "Normal":
        "Stand independently unsupported, able to weight shift and cross midline maximally",
    "Good":
        "Stand independently unsupported, able to weight shift and cross midline moderately",
    "G-/F+":
        "Stand independently unsupported, able to weight shift across midline minimally",
    "Fair":
        "Stand independently unsupported, weight shift, and reach ipsilaterally LOB when crossing midline",
    "Poor+":
        "Able to stand with Min A and reach ipsilaterally, unable to weight shift",
    "Poor":
        "Able to stand with Mod A and minimally reach ipsilaterally,  unable to cross midline",
  };
}
