import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/app_text_style.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';

class SelfCareHistoryPopup extends StatelessWidget {
  const SelfCareHistoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Color(0x082EA3D4),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Title',
                    style: FormBuilderTextStyle.bold10Style,
                  ),
                ),
              ),
              Expanded(
                child: _getFillerInformation(
                    formName: 'SOC',
                    imageUrl: 'https://avatar.iran.liara.run/public/50',
                    name: 'Olivia Smith',
                    fillDate: '05/08/2025',
                    employeeType: 'RN'),
              ),Expanded(
                child: _getFillerInformation(
                    formName: 'ROC',
                    imageUrl: 'https://avatar.iran.liara.run/public/40',
                    name: 'Jeh Scott',
                    fillDate: '10/06/2025',
                    employeeType: 'RN'),
              ),Expanded(
                child: _getFillerInformation(
                    formName: 'Recert',
                    imageUrl: 'https://avatar.iran.liara.run/public/30',
                    name: 'Eva Watson',
                    fillDate: '04/12/2025',
                    employeeType: 'RN'),
              ),Expanded(
                child: _getFillerInformation(
                    formName: 'Discharge',
                    imageUrl: 'https://avatar.iran.liara.run/public/20',
                    name: 'John Williams',
                    fillDate: '09/05/2025',
                    employeeType: 'RN'),
              ),
            ],
          ),
        ),
        _getDataRow('Eating', '02', '01', '04', '01'),
        _getDivider(),
        _getDataRow('Oral Hygiene', '03', '01', '01', '03'),
        _getDivider(),
        _getDataRow('Toilet Hygiene', '04', '01', '01', '02'),
        _getDivider(),
        _getDataRow('Shower/bath self', '02', '04', 'N/A', '-'),
        _getDivider(),
        _getDataRow('Upper body dressing', '01', '02', '01', '01'),
        _getDivider(),
        _getDataRow('Lower body dressing', '01', '02', '04', '03'),
        _getDivider(),
        _getDataRow('Putting on/taking off footwear', '01', '03', '02', '03'),
        _getDivider(),
      ],
    );
  }

  Widget _getDivider()
  {
    return Divider();
  }

  Widget _getDataRow(String title, String score1, String score2, String score3, String score4){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: FormBuilderTextStyle.bold10Style,
              ),
            ),
          ),Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                score1,
                style: FormBuilderTextStyle.bold10Style,
                textAlign: TextAlign.center,
              ),
            ),
          ),Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                score2,
                style: FormBuilderTextStyle.bold10Style,
                textAlign: TextAlign.center,
              ),
            ),
          ),Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                score3,
                style: FormBuilderTextStyle.bold10Style,
                textAlign: TextAlign.center,
              ),
            ),
          ),Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                score4,
                style: FormBuilderTextStyle.bold10Style,
                textAlign: TextAlign.center,
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _getFillerInformation(
      {required String formName,
      required String imageUrl,
      required String name,
      required String fillDate,
      required String employeeType}) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formName,
          style: FormBuilderTextStyle.bold10Style,
        ),
        Row(
          spacing: 10,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    imageUrl,
                    height: 50,
                    width: 50,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -8,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: const Color(0xffB4DB4C),
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0.9),
                            blurRadius: 1.79,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ]),
                    child: Text(
                      employeeType,
                      style: FormBuilderTextStyle.normal10style
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            sbw(1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  name,
                  style: FormBuilderTextStyle.bold10Style,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Date of Form: ',
                    children: [
                      TextSpan(
                          text: fillDate,
                          style: FormBuilderTextStyle.normal10style)
                    ],
                    style: FormBuilderTextStyle.bold10Style,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
