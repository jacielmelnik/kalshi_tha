import 'package:flutter/material.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/enter_values/enter_values_bloc.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Image.asset(kalshiLogo))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Let\'s find out your financial wellness score.'),
              Text('Financial wellness test'),
              Text('Enter your financial information below'),
              Text('Annual income'),
              TextField(
                controller: _annualIncomeController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (onlyNumbersMask.allMatches(value).length !=
                      value.length) {
                    _annualIncomeController.clear();
                  }
                },
                onSubmitted: (_) {
                  _monthlyCostsFocusNode.requestFocus();
                },
              ),
              Text('Monthly Costs'),
              TextField(
                controller: _monthlyCostsController,
                focusNode: _monthlyCostsFocusNode,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (onlyNumbersMask.allMatches(value).length !=
                      value.length) {
                    _monthlyCostsController.clear();
                  }
                },
                onSubmitted: (_) {
                  if (_annualIncomeController.text.isNotEmpty &&
                      _monthlyCostsController.text.isNotEmpty) {
                    _bloc.didTapContinueButton(context);
                  }
                },
              ),
              ElevatedButton(
                onPressed: () => _bloc.didTapContinueButton(context),
                child: Text('Continue'),
              ),
              Text(
                'Your financial information is encrypted and secure. We\'ll never share or sell any of your personal data.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
