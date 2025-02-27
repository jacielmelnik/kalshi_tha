import 'package:flutter/material.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/enter_values/enter_values_bloc.dart';
import 'package:kalshi_tha/enter_values/enter_values_constants.dart';
import 'package:kalshi_tha/enter_values/widget/enter_value_text_field.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';
import 'package:kalshi_tha/widgets/cta_button.dart';
import 'package:kalshi_tha/widgets/disclaimer_footer.dart';
import 'package:kalshi_tha/widgets/financial_wellness_icon.dart';

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
        title: Image.asset(kalshiLogo),
        centerTitle: true,
        backgroundColor: color.white,
      ),
      backgroundColor: color.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: padding.all16,
            child: Column(
              children: [
                spacing.v24,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: enterValuesTitlePart1,
                        style: typography.subtitle,
                      ),
                      TextSpan(
                        text: enterValuesTitlePart2,
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
                  shape: RoundedRectangleBorder(borderRadius: border.all8),
                  child: Padding(
                    padding: padding.all16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FinancialWellnessIcon(),
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
                          focusNode: _monthlyCostsFocusNode,
                          onSubmited: (_) => _didTapContinueButton(),
                        ),
                        spacing.v16,
                        CtaButton(
                          buttonText: continueButtonText,
                          onPressed: () => _didTapContinueButton(),
                        ),
                      ],
                    ),
                  ),
                ),
                spacing.v24,
                DisclaimerFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _didTapContinueButton() {
    if (_annualIncomeController.text.isNotEmpty &&
        _monthlyCostsController.text.isNotEmpty) {
      _bloc.didTapContinueButton(
        context: context,
        annualIncome: _annualIncomeController.text,
        monthlyCosts: _monthlyCostsController.text,
      );
    }
  }
}
