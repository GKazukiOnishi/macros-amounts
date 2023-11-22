import 'package:flutter/material.dart';
import 'package:macros_amounts/components/app_bar.dart';
import 'package:macros_amounts/constants/spacings.dart';
import 'package:macros_amounts/models/macros_model.dart';
import 'package:macros_amounts/pages/calculator_page.dart';
import 'package:macros_amounts/pages/modal/macros_modal.dart';
import 'package:macros_amounts/service/calculator_service.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String gender = '';
  String activityLevel = '';
  String goal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Macro Calculator'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.s16),
          child: CalculatorPage(
            onGenderSelected: (value) => gender = value,
            ageController: ageController,
            heightController: heightController,
            weightController: weightController,
            onActivityLevelSelected: (value) => activityLevel = value,
            onGoalSelected: (value) => goal = value,
            onCalculatePressed: () async {
              MacrosModel? macrosModel = await getMacros(
                gender: gender,
                age: int.parse(ageController.text),
                height: int.parse(heightController.text),
                weight: int.parse(weightController.text),
                activityLevel: activityLevel,
                goal: goal,
              );

              showMacrosDialog(
                context,
                data: macrosModel,
              );
            },
          ),
        ),
      ),
    );
  }
}
