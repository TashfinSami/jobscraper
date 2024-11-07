import 'package:flutter/cupertino.dart';
import 'package:job_scraper/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:job_scraper/utils/constants/colors.dart';

class TRoundedClip extends StatelessWidget {
  const TRoundedClip({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.dots,
    required this.dTop,
    required this.dLeft,
    required this.color,
  });

  final String title, subtitle, image, dots;
  final double dTop, dLeft;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: TRoundedContainer(
        height: 184,
        width: 172,
        showRadius: false,
        backgroundColor: color,
        child: Stack(
          children: [
            Positioned(
              bottom: -30,
              right: -20,
              child: SizedBox(
                width: 140,
                height: 140,
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(image),
                ),
              ),
            ),
            Positioned(
              top: dTop,
              left: dLeft,
              child: SizedBox(
                width: 40,
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(dots),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 24,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 38,
                  color: TColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: TColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
