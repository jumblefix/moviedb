import 'package:flutter/material.dart';
import 'package:moviedb/flavors/DeviceInfoDialog.dart';
import 'package:moviedb/flavors/FlavorConfig.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final BannerConfig bannerConfig = BannerConfig(
    bannerName: FlavorConfig.instance.name,
    bannerColor: FlavorConfig.instance.color,
  );

  FlavorBanner({@required this.child});

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;
    return Stack(
      textDirection: TextDirection.ltr,
      children: <Widget>[
        child,
        _buildBanner(context),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
            message: bannerConfig.bannerName,
            textDirection: TextDirection.ltr,
            layoutDirection: TextDirection.ltr,
            location: BannerLocation.topStart,
            color: bannerConfig.bannerColor,
          ),
        ),
      ),
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DeviceInfoDialog();
          },
        );
      },
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;
  BannerConfig({
    @required this.bannerName,
    @required this.bannerColor,
  });
}
