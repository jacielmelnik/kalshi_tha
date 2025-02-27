import 'package:flutter/material.dart';
import 'package:kalshi_tha/constants.dart';
import 'package:kalshi_tha/result/result_bloc.dart';
import 'package:kalshi_tha/result/result_constants.dart';
import 'package:kalshi_tha/result/widget/result_progress_bar.dart';
import 'package:kalshi_tha/theme/theme_constants.dart';
import 'package:kalshi_tha/widgets/cta_button.dart';
import 'package:kalshi_tha/widgets/disclaimer_footer.dart';
import 'package:kalshi_tha/widgets/financial_wellness_icon.dart';

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
    //This value is the total padding that a component inside the card
    //Used to optimize the screen size calculation for the result progress bar
    const double cardInternalHorizontalPadding = 64.0;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(kalshiLogo),
        centerTitle: true,
        backgroundColor: color.white,
      ),
      backgroundColor: color.scaffoldBackgroundColor,
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
                  shape: RoundedRectangleBorder(borderRadius: border.all8),
                  child: Padding(
                    padding: padding.all16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FinancialWellnessIcon(),
                        spacing.v24,
                        ResultProgressBar(
                          widgetSize:
                              (MediaQuery.of(context).size.width -
                                  cardInternalHorizontalPadding),
                          firstSegmentColor: _getSegmentColorForIndex(index: 0),
                          secondSegmentColor: _getSegmentColorForIndex(
                            index: 1,
                          ),
                          thirdSegmentColor: _getSegmentColorForIndex(index: 2),
                        ),
                        spacing.v24,
                        Text(
                          _getCardTitleByResultStatus(),
                          style: typography.headingSmall,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: resultScreenCardSubtitlePart1,
                                style: typography.paragraph.copyWith(
                                  color: color.darkGray,
                                ),
                              ),
                              TextSpan(
                                text: _getCardSubtitleByResultStatus(),
                                style: typography.paragraphSemiBold,
                              ),
                            ],
                          ),
                        ),
                        spacing.v32,
                        CtaButton(
                          buttonText: returnButtonText,
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

  String _getCardTitleByResultStatus() {
    switch (_status) {
      case ResultStatus.healthy:
        return resultScreenCardTitleHealthy;
      case ResultStatus.average:
        return resultScreenCardTitleAverage;
      case ResultStatus.unhealthy:
        return resultScreenCardTitleUnhealthy;
    }
  }

  String _getCardSubtitleByResultStatus() {
    switch (_status) {
      case ResultStatus.healthy:
        return resultScreenCardSubtitlePart2Healthy;
      case ResultStatus.average:
        return resultScreenCardSubtitlePart2Average;
      case ResultStatus.unhealthy:
        return resultScreenCardSubtitlePart2Unhealthy;
    }
  }
}
