import 'package:custom_tooltip/custom_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/overlays/popup_template.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/static/data/common_data.dart';

class AppHoverTooltip extends StatefulWidget {
  const AppHoverTooltip(
      {super.key, required this.tooltipTxt, required this.child});
  final String tooltipTxt;
  final Widget child;

  @override
  State<AppHoverTooltip> createState() => _AppHoverTooltipState();
}

class _AppHoverTooltipState extends State<AppHoverTooltip> {
  @override
  Widget build(BuildContext context) {
    return CustomTooltip(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
      tooltip: Text(
        widget.tooltipTxt,
        style: FormBuilderTextStyle.normal12style,
        textAlign: TextAlign.center,
      ),
      tooltipHeight: 35.h,
      hoverShowDelay: Duration.zero,
      hideDuration: Duration.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [commonShadow.copyWith(color: AppColors.grey100)],
      ),
      child: widget.child,
    );
  }
}

class FlagOverlayWidget extends StatelessWidget {
  const FlagOverlayWidget({super.key, required this.flagList});
  final List<String> flagList;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: flagList.map(
          (e) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PopupTemplate(
                              maxWidth: 400,
                              body: flagList.asMap().entries.map((entry) {
                                final index = entry.key;
                                final e = entry.value;
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 40,
                                      right: 40,
                                      top: index == 0 ? 30 : 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            CommonData.getBedgeIconData(e)
                                                .iconPath,
                                            width: 35,
                                            height: 35,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(
                                            width: 70,
                                          ),
                                          Text(
                                            CommonData.getBedgeIconData(e)
                                                .label,
                                            style: FormBuilderTextStyle
                                                .bold10Style
                                                .copyWith(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 30),
                                        child: Divider(),
                                      )
                                    ],
                                  ),
                                );
                              }).toList(),
                              bottomButtons: null,
                              title: "Details");
                        },
                      );
                    },
                    child: AppHoverTooltip(
                        tooltipTxt: CommonData.getBedgeIconData(e).label,
                        child: Image.asset(
                          CommonData.getBedgeIconData(e).iconPath,
                          width: 15.w,
                          height: 18.h,
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                customWidth(2.w),
              ],
            );
          },
        ).toList());
  }
}
