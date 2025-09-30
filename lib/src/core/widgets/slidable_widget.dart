import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants.dart';
import 'button.dart';

class SlidableWidget extends StatelessWidget {
  const SlidableWidget({
    super.key,
    required this.child,
    this.active = true,
    required this.onDelete,
  });

  final Widget child;
  final bool active;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: true,
      endActionPane: active
          ? ActionPane(
              extentRatio: 100 / MediaQuery.of(context).size.width,
              motion: const ScrollMotion(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Button(
                    onPressed: onDelete,
                    child: Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        color: AppColors.tile,
                        borderRadius: BorderRadius.circular(Constants.radius),
                      ),
                      child: const Center(
                        child: Icon(Icons.delete_rounded),
                      ),
                    ),
                  ),
                )
              ],
            )
          : null,
      child: child,
    );
  }
}
