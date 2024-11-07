import 'package:flutter/material.dart';
import 'package:job_scraper/common/widgets/custom_shapes/curver_edges/curver_edges_widget.dart';
import 'package:job_scraper/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [TColors.primaryLighter, TColors.primary],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: SizedBox(
          height: 220,
          child: child,
        ),
      ),
    );
  }
}
