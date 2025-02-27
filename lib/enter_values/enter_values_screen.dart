import 'package:flutter/material.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/enter_values/enter_values_bloc.dart';
import 'package:kalshi_tha/enter_values/enter_values_constants.dart';
import 'package:kalshi_tha/enter_values/widget/enter_value_text_field.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';

class EnterValuesScreen extends StatefulWidget {
  const EnterValuesScreen({super.key});

  @override
  State<EnterValuesScreen> createState() => _EnterValuesScreenState();
}

class _EnterValuesScreenState extends State<EnterValuesScreen> {
  late final EnterValuesBloc _bloc;
  final TextEditingController _annualIncomeController = TextEditingController();
  final TextEditingController _monthlyCostsController = TextEditingController();
  final FocusNode _monthlyCostsFocusNode = FocusNode();

  @override
  void initState() {
    _bloc = EnterValuesBloc();
    super.initState();
  }

  @override
  void dispose() {
    _annualIncomeController.dispose();
    _monthlyCostsController.dispose();
    _monthlyCostsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset(kalshiLogo)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                spacing.v24,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: titlePart1, style: typography.subtitle),
                      TextSpan(
                        text: titlePart2,
                        style: typography.subtitleSemiBold,
                      ),
                    ],
                  ),
                ),
                spacing.v24,
                Card(
                  color: color.white,
                  shadowColor: color.shadowColor,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          financialWellnessIcon,
                          width: 48.0,
                          height: 48.0,
                        ),
                        spacing.v16,
                        Text(cardTitle, style: typography.headingSmall),
                        Text(cardSubtitle, style: typography.paragraph),
                        spacing.v16,
                        EnterValueTextField(
                          title: annualIncomeText,
                          controller: _annualIncomeController,
                          onSubmited: (_) {
                            _monthlyCostsFocusNode.requestFocus();
                          },
                        ),
                        spacing.v16,
                        EnterValueTextField(
                          title: monthlyCostText,
                          controller: _monthlyCostsController,
                          onSubmited: (_) {
                            if (_annualIncomeController.text.isNotEmpty &&
                                _monthlyCostsController.text.isNotEmpty) {
                              _bloc.didTapContinueButton(context);
                            }
                          },
                        ),
                        spacing.v16,
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              color.primary,
                            ),
                          ),
                          onPressed: () => _bloc.didTapContinueButton(context),
                          child: SizedBox(
                            height: 56.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  continueButtonText,
                                  style: typography.buttonText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                spacing.v24,
                Column(
                  children: [
                    Image.asset(lockIcon, height: 24.0, width: 24.0),
                    spacing.v16,
                    Text(
                      footerText,
                      textAlign: TextAlign.center,
                      style: typography.description,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
