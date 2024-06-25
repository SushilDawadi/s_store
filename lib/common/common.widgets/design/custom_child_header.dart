import 'package:flutter/material.dart';
import 'package:s_store/common/common.widgets/design/circular_design_container.dart';
import 'package:s_store/common/common.widgets/design/curved_edge_widget.dart';
import 'package:s_store/utils/constants/colors.dart';

class CustomDesignHeader extends StatelessWidget {
  const CustomDesignHeader({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
        child: Container(
      color: CColors.primary,
      child: Stack(
        children: [
          Positioned(
            top: -150,
            left: -250,
            child: CircularDesignContainer(
              backgroundColor: CColors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 100,
            left: -300,
            child: CircularDesignContainer(
              backgroundColor: CColors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 100,
            right: -300,
            child: CircularDesignContainer(
              backgroundColor: CColors.white.withOpacity(0.1),
            ),
          ),
          // app bar
          child,
        ],
      ),
    ));
  }
}
