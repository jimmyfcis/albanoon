import 'package:flutter/material.dart';
class AppTheme {
  static const Color primaryColor = Color(0xFF22176D);
  static const Color primaryTextColor = Color(0xFF060415);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color errorColor = Color(0xFFE53935);
  static const Color greyColor = Color(0xFFE8E8E8);
  static const Color hintColor = Color(0xFF92979F);
  static const Color formBordersColor = Color(0xFFE2E8F0);
  static const Color textColor = Color(0xFF4D3BD0);
  static const Color gradientColor = Color(0xFF302294);
  static const Color dividerColor = Color(0xFFF1F5F9);
}

ThemeData appThemeData = ThemeData(
    primaryColor: AppTheme.primaryColor,
    primaryColorLight: AppTheme.primaryColor,
    primaryColorDark: AppTheme.primaryColor,
    fontFamily: 'IBMPlexSansArabic',
    listTileTheme: const ListTileThemeData(
      horizontalTitleGap: 4,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: AppTheme.primaryColor),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      // White background

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      /// AM/PM Section
      dayPeriodColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.primaryColor; // Selected background color (green)
        }
        return AppTheme.whiteColor; // Unselected background color (light green)
      }),
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Selected text color (white)
        }
        return AppTheme.primaryTextColor; // Unselected text color (black)
      }),
      dayPeriodTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      dayPeriodBorderSide: BorderSide(color: Colors.transparent),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      /// Hour & Minute Display
      hourMinuteColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppTheme.primaryColor; // Selected background color (green)
          }
          return AppTheme.whiteColor; // Unselected background color (light green)
        },
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return AppTheme.whiteColor; // Selected text color (white)
          }
          return AppTheme.primaryTextColor; // Unselected text color (black)
        },
      ),
      hourMinuteTextStyle: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),

      /// Dial Settings
      dialBackgroundColor: Colors.white,
      dialTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Selected text color (green)
        }
        return AppTheme.primaryTextColor; // Unselected text color (black)
      }),
      dialHandColor: AppTheme.primaryColor,
      dialTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),

      /// Time Separator
      entryModeIconColor: AppTheme.primaryColor,
      timeSelectorSeparatorTextStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 24,
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.bold,
          height: 3.0,
        ),
      ),
      helpTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        
      ),

      /// Buttons
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),

      confirmButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            
          ),
        ),
        backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      dividerColor: AppTheme.primaryColor,
      // todayBackgroundColor:
      //     MaterialStateProperty.all(AppTheme.primaryColor),

      // todayForegroundColor: MaterialStateProperty.all(AppTheme.whiteColor),
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.primaryColor; // Your custom theme color
        }
        return null; // Use default
      }),

      // ✅ Set the text color for the selected day
      dayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppTheme.whiteColor; // Ensure contrast with background
        }
        return null; // Use default
      }),
      rangeSelectionBackgroundColor: AppTheme.primaryColor,
      todayBackgroundColor: MaterialStateProperty.all(AppTheme.whiteColor),
      todayForegroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
      // Text color for selected day
      // dayForegroundColor:MaterialStateProperty.all(AppTheme.primaryColor),
      //  dayBackgroundColor:MaterialStateProperty.all(AppTheme.whiteColor) ,
      dayOverlayColor: MaterialStateProperty.all(AppTheme.whiteColor),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.primaryColor,
        ),
        helperStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.primaryColor,
          
        ),
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppTheme.primaryColor,
          // 
        ),
        constraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.primaryColor,
            // 
          ),
        ), // No ripple effect
      ),

      //todayBackgroundColor: MaterialStateProperty.all(whiteColor),
      yearStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.blueAccent,
        //
      ),
      // todayBorder: const BorderSide(
      //   color: Colors.brown,
      // ),
      headerHeadlineStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.yellow,
        //
      ),
      confirmButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.whiteColor,
            //
          ),
        ),
        backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
        // No ripple effect
        foregroundColor: MaterialStateProperty.all(AppTheme.whiteColor), // No ripple effect
      ),
      backgroundColor: AppTheme.whiteColor,
      dayStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.red,
      ),
      headerHelpStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.pinkAccent,
      ),
      dayShape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      // todayForegroundColor: MaterialStateProperty.all(primaryColor),

      weekdayStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppTheme.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));

