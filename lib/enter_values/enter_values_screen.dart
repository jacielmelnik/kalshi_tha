import 'package:flutter/material.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/enter_values/enter_values_bloc.dart';
import 'package:kalshi_tha/enter_values/enter_values_constants.dart';

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
                SizedBox(height: 24.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: titlePart1,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'WorkSans',
                          color: Color(0xFF001C95),
                        ),
                      ),
                      TextSpan(
                        text: titlePart2,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF001C95),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
                Card(
                  color: Colors.white,
                  shadowColor: Color(0x1E2A3214),
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
                        SizedBox(height: 16.0),
                        Text(
                          cardTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1E2A32),
                          ),
                        ),
                        Text(
                          cardSubtitle,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF708797),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Annual income',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1E2A32),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Row(
                              children: [
                                SizedBox(width: 16.0),
                                Image.asset(dolarSignIcon),
                              ],
                            ),
                            prefixIconConstraints: BoxConstraints.tight(
                              Size(44.0, 24.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                              borderSide: BorderSide(color: Color(0xFFE9EEF2)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4D6475),
                          ),
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
                        SizedBox(height: 16.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monthly Costs',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1E2A32),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Row(
                              children: [
                                SizedBox(width: 16.0),
                                Image.asset(dolarSignIcon),
                              ],
                            ),
                            prefixIconConstraints: BoxConstraints.tight(
                              Size(44.0, 24.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                              borderSide: BorderSide(color: Color(0xFFE9EEF2)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4D6475),
                          ),
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
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xFF001C95),
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
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Column(
                  children: [
                    Image.asset(lockIcon, height: 24.0, width: 24.0),
                    SizedBox(height: 16.0),
                    Text(
                      footerText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF708797),
                      ),
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
