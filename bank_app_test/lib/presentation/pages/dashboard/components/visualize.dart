import 'package:bank_app_test/domain/entities/transaction_list_entity.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Visualize extends StatelessWidget {
  final List<TransactionListEntity> transactionLists;
  const Visualize({
    required this.transactionLists,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Transaction Chart'), //Chart title.
              //legend: Legend(isVisible: true), // Enables the legend.
              tooltipBehavior:
                  TooltipBehavior(enable: true), // Enables the tooltip.
              series: <LineSeries<TransactionListEntity, String>>[
                LineSeries<TransactionListEntity, String>(
                    dataSource: [
                      transactionLists.reversed.toList()[30],
                      transactionLists.reversed.toList()[0],
                    ],
                    color: AppColor.kPrimaryColor,
                    xValueMapper: (TransactionListEntity date, _) =>
                        date.created.toString().substring(0, 10),
                    yValueMapper: (TransactionListEntity amount, _) =>
                        amount.amount,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      color: AppColor.kPrimaryColor,
                    ) // Enables the data label.
                    )
              ]),
        ),
      ),
    );
  }
}
