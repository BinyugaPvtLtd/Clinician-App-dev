import 'dart:ui';

import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/model/key_value_model.dart';
import 'package:flutter/material.dart';

class VisitOverlayWidget extends StatefulWidget {
  const VisitOverlayWidget({super.key});

  @override
  State<VisitOverlayWidget> createState() => _VisitOverlayWidgetState();
}

class _VisitOverlayWidgetState extends State<VisitOverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: 80.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.primaryAppColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Visits',
                style: AppTextStyle.normal14style.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              customHeight(7.h),
              ListView.separated(
                itemCount: 4,
                shrinkWrap: true,
                separatorBuilder: (context, index) => customHeight(8.h),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var list = [
                    KeyValueModel(key: '5', value: 'Done'),
                    KeyValueModel(key: '4', value: 'Remaining'),
                    KeyValueModel(key: '\$451', value: 'Earned'),
                    KeyValueModel(key: '\$500', value: 'Expected'),
                  ];
                  return Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    // height: 64.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          list[index].key,
                          style: AppTextStyle.normal10style.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          list[index].value,
                          style: AppTextStyle.normal10style,
                        ),
                      ],
                    ),
                  );
                },
              ),
              customHeight(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
