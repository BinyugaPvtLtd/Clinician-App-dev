import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class AppFooter extends StatefulWidget {
  const AppFooter({super.key});

  @override
  State<AppFooter> createState() => _AppFooterState();
}

class _AppFooterState extends State<AppFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            '#2031ABC01BA',
            style: FormBuilderTextStyle.normal10style
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          Text('Washington DC ',
              style: FormBuilderTextStyle.normal10style
                  .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w700)),
          Text('198.168.1.231',
              style: FormBuilderTextStyle.normal10style
                  .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400)),
          const Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAsset.symmetryLogoImg,
                width: 25.w,
              ),
              Text('Powered by',
                  style: FormBuilderTextStyle.normal10style
                      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}
