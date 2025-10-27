import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/widgets/primary_button.dart';
import 'package:prologue/features/fyp/pages/fyp_page.dart';

import '../controller/tutorial_controller.dart';
import '../data/tutorial_steps.dart';
import '../widgets/tutorial_step_block.dart';
import '../widgets/tutorial_step_indicator.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});
  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  late final TutorialController ctrl = TutorialController(tutorialSteps.length);

  void _onNext() => ctrl.isLast
      ? Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FypPage()),
        )
      : ctrl.next();
  void _onBack() => ctrl.isFirst ? Navigator.pop(context) : ctrl.back();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.darkBg,
            size: 34,
          ),
          onPressed: _onBack,
        ),
      ),
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: AnimatedBuilder(
            animation: ctrl,
            builder: (context, _) {
              final step = tutorialSteps[ctrl.index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TutorialStepIndicator(
                    total: ctrl.total,
                    currentIndex: ctrl.index,
                  ),
                  Expanded(
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        child: TutorialStepBlock(
                          key: ValueKey(ctrl.index),
                          color: step.color,
                          title: step.title,
                          text: step.text,
                        ),
                      ),
                    ),
                  ),
                  PrimaryButton(
                    label: ctrl.isLast ? 'Son' : 'Devam',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: _onNext,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
