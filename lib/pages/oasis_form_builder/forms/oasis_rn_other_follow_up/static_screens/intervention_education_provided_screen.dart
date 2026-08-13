import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/constants/constant_import.dart';
import 'package:clinician_app/pages/oasis_form_builder/services/api/managers/form_builder_manager.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/form_builder_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/question_wapper_provider.dart';
import 'package:clinician_app/pages/oasis_form_builder/ui_components/common_divider.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/model/question_data_model.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_action_button.dart';
import 'package:clinician_app/pages/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_option_section.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class InterventionEducationProvidedScreen extends StatefulWidget {
  final int id;
  final int formId;

  const InterventionEducationProvidedScreen({
    super.key,
    required this.id,
    required this.formId,
  });

  @override
  State<InterventionEducationProvidedScreen> createState() =>
      _InterventionEducationProvidedScreenState();
}

class _InterventionEducationProvidedScreenState
    extends State<InterventionEducationProvidedScreen> {
  late Future<List<QuestionWrapper>> _formFuture;

  @override
  void initState() {
    super.initState();
    _formFuture = getForm(context, patientId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child: FutureBuilder(
          future: _formFuture,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Loading Questions...'));
            }
            if (snap.data == null) {
              return const Center(child: Text('No Data Found!'));
            }
            if (snap.data != null || snap.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        final formProvider = Provider.of<FormBuilderProvider>(
                            context,
                            listen: false);
                        print(formProvider.toJson());
                      },
                      child: const Text('JSON')),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      'Interventions/Education Provided',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.separated(
                    itemCount: (snap.data?.length ?? 0).clamp(0, 5),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CommonDivider(),
                          if (index == 0) customHeight(50.h)
                        ],
                      );
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: 10.h, right: 20.w, top: 10.h),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Html(
                                    data: snap.data?[index].question.title ??
                                        "")),
                            Expanded(
                                child: Row(
                              children: [
                                DynamicOptionSection(
                                    questionWrapper: snap.data?[index] ??
                                        QuestionWrapper(
                                            question:
                                                QuestionDataModel.fromJson(
                                                    {}))),
                              ],
                            ))
                          ],
                        ),
                      );
                    },
                  ),
                  const CommonDivider(),
                  customHeight(20.h),
                  if ((snap.data?.length ?? 0) > 5)
                    SizedBox(
                      width: 200.w,
                      child: DynamicActionButton(
                          questionWrapper: snap.data?[5] ??
                              QuestionWrapper(
                                  question: QuestionDataModel.fromJson({}))),
                    ),
                  SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.primaryAppColor, width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            child: Text(
                              "Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: AppColors.primaryAppColor,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryAppColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            child: Text(
                              "Save",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            if (snap.hasError) {
              return Center(child: Text("Error : ${snap.error}"));
            } else {
              return const Center(child: Text("Error"));
            }
          }),
    );
  }

  Future<List<QuestionWrapper>> getForm(BuildContext context,
      {required int patientId}) async {
    List<QuestionDataModel> response = await FormBuilderManager()
        .getDummyDataPatientFormByID(
            formId: widget.formId, context, patientId: patientId);

    final formProvider =
        Provider.of<FormBuilderProvider>(context, listen: false);
    formProvider.clear();
    formProvider.wrapperQuestions =
        response.map((q) => QuestionWrapper(question: q)).toList();
    return formProvider.wrapperQuestions;
  }
}
