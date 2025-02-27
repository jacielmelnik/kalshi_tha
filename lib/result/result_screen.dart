import 'package:flutter/material.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/result/result_bloc.dart';
import 'package:kalshi_tha/result/result_constants.dart';
import 'package:kalshi_tha/result/widget/result_progress_bar.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';
import 'package:kalshi_tha/widgets/cta_button.dart';
import 'package:kalshi_tha/widgets/disclaimer_footer.dart';

class ResultScreen extends StatefulWidget {
  final int annualIncome;
  final int monthlyCosts;

  const ResultScreen({
    super.key,
    required this.annualIncome,
    required this.monthlyCosts,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late final ResultBloc _bloc;
  late final ResultStatus _status;

  @override
  void initState() {
    _bloc = ResultBloc();
    _status = _bloc.calculateScore(
      annualIncome: widget.annualIncome,
      monthlyCosts: widget.monthlyCosts,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(kalshiLogo),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFF4F8FA),
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
                      TextSpan(
                        text: resultScreenTitlePart1,
                        style: typography.subtitle,
                      ),
                      TextSpan(
                        text: resultScreenTitlePart2,
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
                        spacing.v24,
                        ResultProgressBar(
                          widgetSize:
                              (MediaQuery.of(context).size.width - 64.0),
                          firstSegmentColor: _getSegmentColorForIndex(index: 0),
                          secondSegmentColor: _getSegmentColorForIndex(
                            index: 1,
                          ),
                          thirdSegmentColor: _getSegmentColorForIndex(index: 2),
                        ),
                        spacing.v24,
                        Text(
                          'Congratulations!',
                          style: typography.headingSmall,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Your financial wellness score is \n',
                                style: typography.paragraph.copyWith(
                                  color: Color(0xFF4D6475),
                                ),
                              ),
                              TextSpan(
                                text: 'Healthy',
                                style: typography.paragraphSemiBold,
                              ),
                            ],
                          ),
                        ),
                        spacing.v32,
                        CtaButton(
                          buttonText: 'Return',
                          onPressed: () => Navigator.pop(context),
                          style: CtaButtonStyles.outlined,
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

  Color _getSegmentColorForIndex({required int index}) {
    Color segmentColor = color.lightGray;

    switch (_status) {
      case ResultStatus.healthy:
        segmentColor = color.green;
        break;
      case ResultStatus.average:
        if (index < 2) segmentColor = color.yellow;
        break;
      case ResultStatus.unhealthy:
        if (index == 0) segmentColor = color.red;
        break;
    }

    return segmentColor;
  }
}
