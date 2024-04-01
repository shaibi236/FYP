
import 'package:flutter/material.dart';
import 'package:flutter_practice/util/responsive.dart';
import 'package:flutter_practice/widgets/activity_details_card.dart';
import 'package:flutter_practice/widgets/bar_graph_widget.dart';
import 'package:flutter_practice/widgets/header_widget.dart';
import 'package:flutter_practice/widgets/line_chart_card.dart';
import 'package:flutter_practice/widgets/summary_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 18),
            const HeaderWidget(),
            const SizedBox(height: 18),
            const ActivityDetailsCard(),
            const SizedBox(height: 18),
            const LineChartCard(),
            const SizedBox(height: 18),
            const BarGraphCard(),
            const SizedBox(height: 18),
            if (Responsive.isTablet(context)) const SummaryWidget(),
          ],
        ),
      ),
    );
  }
}
