import 'package:flutter/material.dart';
import 'package:kalshi_tha/enter_values/enter_values_bloc.dart';

class EnterValuesScreen extends StatefulWidget {
  const EnterValuesScreen({super.key});

  @override
  State<EnterValuesScreen> createState() => _EnterValuesScreenState();
}

class _EnterValuesScreenState extends State<EnterValuesScreen> {
  late final EnterValuesBloc _bloc;

  @override
  void initState() {
    _bloc = EnterValuesBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Kalshi'))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Let\'s find out your financial wellness score.'),
              Text('Financial wellness test'),
              Text('Enter your financial information below'),
              Text('Annual income'),
              TextField(),
              Text('Monthly Costs'),
              TextField(),
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
