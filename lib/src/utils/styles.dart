import 'package:srcds_tracker/src/utils/colors_utility.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme(BuildContext context) {
  final defaultTextTheme = Theme.of(context).textTheme;

  final customTextTheme = defaultTextTheme.copyWith(
    /// Extremely large text.
    /// Headline1
    displayLarge: defaultTextTheme.displayLarge?.apply(
      fontFamily: 'Comfortaa',
      color: const Color(0xDD000000),
    ),

    /// Very, very large text. Used for the date in the dialog shown by [showDatePicker].
    /// Headline2
    displayMedium: defaultTextTheme.displayMedium?.apply(
      fontFamily: 'Comfortaa',
      color: const Color(0xDD000000),
    ),

    /// Very large text.
    /// Headline3
    displaySmall: defaultTextTheme.displaySmall?.apply(
      fontFamily: 'Comfortaa',
      color: const Color(0xDD000000),
    ),

    /// Large text.
    /// Headline4
    headlineMedium: defaultTextTheme.headlineMedium?.apply(
      fontFamily: 'Comfortaa',
      color: const Color(0xDD000000),
    ),

    /// Used for large text in dialogs (e.g., the month and year in the dialog shown by [showDatePicker]).
    /// Headline5
    headlineSmall: defaultTextTheme.headlineSmall?.apply(
      fontFamily: 'Comfortaa',
      color: const Color(0xDD000000),
    ),

    /// Used for the primary text in app bars and dialogs (e.g., [AppBar.title] and [AlertDialog.title]).
    /// Headline6
    titleLarge: defaultTextTheme.titleLarge?.apply(
      fontFamily: 'Lato',
      color: const Color(0xDD000000),
    ),

    /// Used for the primary text in lists (e.g., [ListTile.title]).
    /// Subtitle1
    titleMedium: defaultTextTheme.titleMedium?.apply(
      fontFamily: 'OpenSans',
      color: const Color(0xDD000000),
    ),

    /// For medium emphasis text that's a little smaller than [subtitle1].
    /// Subtitle2
    titleSmall: defaultTextTheme.titleSmall?.apply(
      fontFamily: 'OpenSans',
      color: const Color(0xDD000000),
    ),

    /// Used for emphasizing text that would otherwise be [bodyText2].
    /// BodyText1
    bodyLarge: defaultTextTheme.bodyLarge?.apply(
      fontFamily: 'OpenSans',
      color: const Color(0xDD000000),
    ),

    /// The default text style for [Material].
    /// BodyText2
    bodyMedium: defaultTextTheme.bodyMedium?.apply(
      fontFamily: 'OpenSans',
      color: const Color(0xDD000000),
    ),

    /// Used for auxiliary text associated with images.
    /// Caption
    bodySmall: defaultTextTheme.bodySmall?.apply(
      fontFamily: 'OpenSans',
      color: const Color(0xDD000000),
    ),

    /// Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
    /// Button
    labelLarge: defaultTextTheme.labelLarge?.apply(
      fontFamily: 'OpenSans',
      color: const Color(0xDD000000),
    ),

    /// The smallest style. Typically used for captions or to introduce a (larger) headline.
    /// Overline
    labelSmall: defaultTextTheme.labelSmall?.apply(
      fontFamily: 'OpenSans',
      color: const Color(0xDD000000),
    ),
  );

  ThemeData themeData = ThemeData.light().copyWith(
    textTheme: customTextTheme,
    primaryColor: ColorsUtility.reddishFinch,
    scaffoldBackgroundColor: const Color(0xFFFAFAFA), // Default Scaffold Background color.
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      primarySwatch: ColorsUtility.reddishFinch,
      accentColor: ColorsUtility.vividCyan,
    ),
  );
  return themeData;
}

ThemeData getDarkTheme(BuildContext context) {
  final defaultTextTheme = Theme.of(context).textTheme;

  final customTextTheme = defaultTextTheme.copyWith(
    /// Extremely large text.
    /// Headline1
    displayLarge: defaultTextTheme.displayLarge?.apply(
      fontFamily: 'Comfortaa',
      color: Colors.white,
    ),

    /// Very, very large text. Used for the date in the dialog shown by [showDatePicker].
    /// Headline2
    displayMedium: defaultTextTheme.displayMedium?.apply(
      fontFamily: 'Comfortaa',
      color: Colors.white,
    ),

    /// Very large text.
    /// Headline3
    displaySmall: defaultTextTheme.displaySmall?.apply(
      fontFamily: 'Comfortaa',
      color: Colors.white,
    ),

    /// Large text.
    /// Headline4
    headlineMedium: defaultTextTheme.headlineMedium?.apply(
      fontFamily: 'Comfortaa',
      color: Colors.white,
    ),

    /// Used for large text in dialogs (e.g., the month and year in the dialog shown by [showDatePicker]).
    /// Headline5
    headlineSmall: defaultTextTheme.headlineSmall?.apply(
      fontFamily: 'Comfortaa',
      color: Colors.white,
    ),

    /// Used for the primary text in app bars and dialogs (e.g., [AppBar.title] and [AlertDialog.title]).
    /// Headline6
    titleLarge: defaultTextTheme.titleLarge?.apply(
      fontFamily: 'Lato',
      color: Colors.white,
    ),

    /// Used for the primary text in lists (e.g., [ListTile.title]).
    /// Subtitle1
    titleMedium: defaultTextTheme.titleMedium?.apply(
      fontFamily: 'OpenSans',
      color: Colors.white,
    ),

    /// For medium emphasis text that's a little smaller than [subtitle1].
    /// Subtitle2
    titleSmall: defaultTextTheme.titleSmall?.apply(
      fontFamily: 'OpenSans',
      color: Colors.white,
    ),

    /// Used for emphasizing text that would otherwise be [bodyText2].
    /// BodyText1
    bodyLarge: defaultTextTheme.bodyLarge?.apply(
      fontFamily: 'OpenSans',
      color: Colors.white,
    ),

    /// The default text style for [Material].
    /// BodyText2
    bodyMedium: defaultTextTheme.bodyMedium?.apply(
      fontFamily: 'OpenSans',
      color: Colors.white,
    ),

    /// Used for auxiliary text associated with images.
    /// Caption
    bodySmall: defaultTextTheme.bodySmall?.apply(
      fontFamily: 'OpenSans',
      color: Colors.white,
    ),

    /// Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
    /// Button
    labelLarge: defaultTextTheme.labelLarge?.apply(
      fontFamily: 'OpenSans',
      color: Colors.white,
    ),

    /// The smallest style. Typically used for captions or to introduce a (larger) headline.
    /// Overline
    labelSmall: defaultTextTheme.labelSmall?.apply(
      fontFamily: 'OpenSans',
      color: Colors.white,
    ),
  );

  // ThemeData themeData = ThemeData.dark().copyWith(
  //   textTheme: customTextTheme,
  //   primaryColor: A8Colors.reddishFinch,
  //   scaffoldBackgroundColor: A8Colors.mainDark,
  //   canvasColor: A8Colors.mainDark,
  //   cardColor: A8Colors.raisinBlack,
  //   colorScheme: ColorScheme.fromSwatch(
  //     brightness: Brightness.dark,
  //     primarySwatch: A8Colors.reddishFinch,
  //     accentColor: A8Colors.indigoishFinchAccent,
  //   ),
  // );

  ThemeData themeData = ThemeData.dark().copyWith(
    textTheme: customTextTheme,
    primaryColor: ColorsUtility.royalBlue,
    scaffoldBackgroundColor: ColorsUtility.mainDark,
    canvasColor: ColorsUtility.mainDark,
    cardColor: ColorsUtility.raisinBlack,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: ColorsUtility.royalBlue,
      accentColor: ColorsUtility.royalBlue,
    ),
  );

  return themeData;
}
