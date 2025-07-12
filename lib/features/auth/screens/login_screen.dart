import 'package:albanoon/core/assets/images/image_assets.dart';
import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/routes/app_routes.dart';
import 'package:albanoon/core/storage/token_storage.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:albanoon/core/widgets/form_fields/email_text_field.dart';
import 'package:albanoon/core/widgets/form_fields/password_text_field.dart';
import 'package:albanoon/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoAnimation;

  late AnimationController _sheetController;
  late Animation<double> _sheetAnimation;

  final _formKey = GlobalKey<FormBuilderState>();
  bool isValid = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _logoAnimation = Tween<double>(begin: 1.0, end: 0.1).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _sheetController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _sheetAnimation = Tween<double>(begin: 1.0, end: 0.25).animate(
      CurvedAnimation(parent: _sheetController, curve: Curves.easeInOut),
    );

    _startAnimation();
  }

  void _startAnimation() async {
    await _logoController.forward();
    await _sheetController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(PNGAssets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _logoAnimation,
              builder: (_, child) {
                return Positioned(
                  top: screenHeight * _logoAnimation.value,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SvgPicture.asset(
                      SVGAssets.logo,
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _sheetAnimation,
              builder: (_, child) {
                return Positioned(
                  top: screenHeight * _sheetAnimation.value,
                  left: 0,
                  right: 0,
                  child: _buildBottomSheet(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 35.5.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: AnimatedPadding(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(context.tr.translate("login"), style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 24.h),
                EmailTextField(
                  name: "email",
                  labelText: context.tr.translate("email_field"),
                  isRequired: true,
                ),
                SizedBox(height: 16.h),
                PasswordTextField(
                  name: "password",
                  labelText: context.tr.translate("password"),
                  isRequired: true,
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: _rememberMe,
                            onChanged: (value) async {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                              final TokenStorage storage = TokenStorage();
                              await storage.saveRemember(_rememberMe);
                            },
                            activeColor: AppTheme.primaryColor,
                            side: BorderSide(color: AppTheme.primaryColor)),
                        Text(
                          context.tr.translate('remember_me'),
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(context.tr.translate("forget_password_title"),
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppTheme.primaryColor)),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomMainButton(
                  onPressed: () async {
                    var formState = _formKey.currentState;
                    if (formState == null) return;
                    if (!formState.saveAndValidate()) {
                      return;
                    }

                    context.goNamed(AppRoutes.bottomBar);
                  },
                  title: context.tr.translate("login"),
                ),
                SizedBox(height: 12.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Expanded(child: Divider(color: AppTheme.formBordersColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        context.tr.translate('or_signup_with'),
                        style: TextStyle(
                          color: AppTheme.blackColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: AppTheme.formBordersColor)),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    border: Border.all(color: AppTheme.formBordersColor),
                    borderRadius: BorderRadius.circular(5.0.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.tr.translate("google"),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      SizedBox(width: 23.w),
                      SvgPicture.asset(SVGAssets.google),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Text(context.tr.translate("create_account"),
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppTheme.primaryColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
