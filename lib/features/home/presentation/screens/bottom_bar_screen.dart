import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:albanoon/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarScreen extends StatefulWidget {
  final int? index;

  const BottomBarScreen({super.key, this.index});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    if (widget.index != null) {
      pageIndex = widget.index!;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: widget.index ?? 0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        onPageChanged: (index) => setState(() {
          pageIndex = index;
          controller.jumpToPage(index);
        }),
        children: const [
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 8.h),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            selectedItemColor: AppTheme.primaryColor,
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            elevation: 0,
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(SVGAssets.homeNav),
                activeIcon: SvgPicture.asset(
                  SVGAssets.homeNav,
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.tr.translate("home"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(SVGAssets.homeNav),
                activeIcon: SvgPicture.asset(
                  SVGAssets.homeNav,
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.tr.translate("bookings"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(SVGAssets.homeNav),
                activeIcon: SvgPicture.asset(
                  SVGAssets.homeNav,
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.tr.translate("clinics"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(SVGAssets.homeNav),
                activeIcon: SvgPicture.asset(
                  SVGAssets.homeNav,
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.tr.translate("my_care"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(SVGAssets.homeNav),
                activeIcon: SvgPicture.asset(
                  SVGAssets.homeNav,
                  colorFilter: ColorFilter.mode(
                    AppTheme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: context.tr.translate("profile"),
              ),
            ],
            currentIndex: pageIndex,
            // Use state.selectedIndex
            onTap: (index) => setState(() {
              pageIndex = index;
              controller.jumpToPage(index);
            }),
          ),
        ),
      ),
    );
  }
}
