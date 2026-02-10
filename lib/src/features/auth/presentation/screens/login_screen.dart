import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wonder_souls/src/config/core/assets/assets.dart';
import 'package:wonder_souls/src/features/auth/presentation/widget/social_login_button_icon.dart';
import 'package:wonder_souls/src/features/home/presentation/screens/home_bottom_bar.dart';
import 'package:wonder_souls/src/utils/common_widgets/common_button.dart';
import 'package:wonder_souls/src/utils/common_widgets/common_text_form_field.dart';
import 'package:wonder_souls/src/utils/common_widgets/size.dart';
import 'package:wonder_souls/src/utils/extensions/context_colors.dart';
import 'package:wonder_souls/src/utils/extensions/context_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = "/LoginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: 120.h,
                  height: 120.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.eco,
                    size: 70.r,
                    color: context.colors.primary,
                  ),
                ),

                SizedBox(height: 32.h),

                Text(
                  "Let's Get Started!",
                  style: context.text.titleLarge?.copyWith(
                    fontSize: 36,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                12.h.height,

                Text(
                  "Your Passport to Adventure Awaits",
                  style: context.text.labelMedium?.copyWith(
                    color: context.colors.onSurface.withAlpha(200),
                  ),
                  textAlign: TextAlign.center,
                ),

                40.h.height,

                Form(
                  child: Column(
                    children: [
                      CommonTextFormField(hintText: 'Enter Username'),
                      16.h.height,
                      CommonTextFormField(hintText: 'Enter Password'),
                      24.h.height,
                      CommonButton(
                        title: "Login",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            HomeBottomBar.routeName,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                32.h.height,
                Row(
                  children: [
                    Flexible(
                      child: Divider(
                        color: context.colors.onSurface.withAlpha(100),
                      ),
                    ),
                    4.w.width,
                    Text("OR", style: context.text.labelSmall),
                    4.w.width,
                    Flexible(
                      child: Divider(
                        color: context.colors.onSurface.withAlpha(100),
                      ),
                    ),
                  ],
                ),
                24.h.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginButtonIcon(
                      onPressed: () {},
                      icon: Image.asset(Assets.google, scale: 28),
                    ),
                    16.w.width,
                    SocialLoginButtonIcon(
                      onPressed: () {},
                      icon: Image.asset(
                        Assets.apple,
                        scale: 28,
                        color: context.colors.onSurfaceVariant,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ),
                    16.w.width,
                    SocialLoginButtonIcon(
                      onPressed: () {},
                      icon: Image.asset(Assets.facebook, scale: 28),
                    ),
                    16.w.width,
                    SocialLoginButtonIcon(
                      onPressed: () {},
                      icon: Image.asset(Assets.twitter, scale: 28),
                    ),
                  ],
                ),

                24.h.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Privacy Policy',
                        style: context.text.bodyMedium,
                      ),
                    ),
                    Text(' • ', style: context.text.bodyMedium),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Terms of Service',
                        style: context.text.bodyMedium,
                      ),
                    ),
                  ],
                ),
                24.h.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String text;

  const SocialLoginButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        height: 30.h,
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,

          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.colors.onSurface.withAlpha(100),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(8),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                icon,
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: context.text.titleMedium?.copyWith(
                        fontSize: 16,

                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
                28.w.width,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
