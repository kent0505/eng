import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/loading_widget.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.title,
    required this.asset,
    this.amount,
    this.loading = false,
    required this.onPressed,
  });

  final String title;
  final String asset;

  final int? amount;
  final bool loading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    logger(width);

    return Container(
      height: 84,
      width: width >= 420 ? (width / 3 - 16) : (width / 2 - 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.tile,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Button(
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  asset,
                  height: 30,
                  width: 30,
                ),
                const Spacer(),
                loading
                    ? const LoadingWidget()
                    : Text(
                        '${amount ?? ''}',
                        style: const TextStyle(
                          color: AppColors.hintColor,
                          fontSize: 14,
                          fontFamily: AppFonts.w400,
                        ),
                      ),
              ],
            ),
            const Spacer(),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.w500,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
