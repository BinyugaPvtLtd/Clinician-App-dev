import 'package:flutter/material.dart';
import 'package:clinician_app/pages/oasis_form_builder/provider/sub_question_wrapper_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/question_wapper_provider.dart';

class Question10019004 extends StatelessWidget {
  final QuestionWrapper questionWrapper;

  Question10019004({
    super.key,
    required this.questionWrapper,
  });

  final GlobalKey _canvasKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubQuestionWrapper>.value(
      value: questionWrapper.subQuestionWrappers[0],
      child: Consumer<SubQuestionWrapper>(
        builder: (BuildContext context, subQuestionWrapper, Widget? child) {
          final options = subQuestionWrapper.subQuestion.options;

          final droppedLabels = options
              .where((option) => option.value.isNotEmpty)
              .map((option) => option.index)
              .toList();

          final availableLabels = options
              .where((option) => option.value.isEmpty)
              .map((option) => option.index)
              .toList();

          final droppedRelativePositions = options
              .where((option) => option.value.isNotEmpty)
              .map((option) {
            final parts = option.value.split(',');
            return Offset(
              double.tryParse(parts[0]) ?? 0,
              double.tryParse(parts[1]) ?? 0,
            );
          })
              .toList();

          return Column(
            children: [
              const SizedBox(height: 40),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: availableLabels.map((label) {
                  return Draggable<int>(
                    data: label,
                    feedback: _buildLabel(label, isDragging: true),
                    childWhenDragging: const SizedBox(width: 30, height: 30),
                    child: _buildLabel(label),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // Responsive container with LayoutBuilder
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageWidth = constraints.maxWidth;
                  final imageHeight = imageWidth; // Keep square aspect ratio

                  return Center(
                    child: Container(
                      key: _canvasKey,
                      width: imageWidth,
                      height: imageHeight,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/oasis_rn_soc/wound_body.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Drop target
                          Positioned.fill(
                            child: DragTarget<int>(
                              onWillAccept: (_) => true,
                              onAcceptWithDetails: (details) {
                                final RenderBox renderBox =
                                _canvasKey.currentContext!.findRenderObject()
                                as RenderBox;
                                final localOffset =
                                renderBox.globalToLocal(details.offset);

                                final relativeX = localOffset.dx / imageWidth;
                                final relativeY = localOffset.dy / imageHeight;

                                subQuestionWrapper.updateTextFieldValue(
                                  details.data,
                                  "$relativeX,$relativeY",
                                );
                              },
                              builder: (context, candidateData, rejectedData) {
                                return const SizedBox.expand();
                              },
                            ),
                          ),

                          // Re-draggable dropped labels
                          ...List.generate(droppedLabels.length, (index) {
                            final relativePosition = droppedRelativePositions[index];
                            final label = droppedLabels[index];

                            final dx = relativePosition.dx * imageWidth;
                            final dy = relativePosition.dy * imageHeight;

                            return Positioned(
                              left: dx,
                              top: dy,
                              child: Draggable<int>(
                                data: label,
                                feedback: _buildLabel(label, isDragging: true),
                                childWhenDragging:
                                const SizedBox(width: 25, height: 25),
                                child: _buildLabel(label),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLabel(int label, {bool isDragging = false}) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: isDragging ? 4 : 0,
      color: Colors.transparent,
      child: Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red[700],
          shape: BoxShape.circle,
        ),
        child: Text(
          '${label + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
