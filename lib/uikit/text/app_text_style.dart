part of 'text_theme.dart';

enum AppTextStyle{

  headlineLarge(text32),
  titleLarge(text20),
  labelLarge(text16),
  labelMedium(text12),
  labelSmall(text10);

  final TextStyle value;
  const AppTextStyle(this.value);
}

const text10 = TextStyle(
    color: Colors.white,
    fontSize: 10
);

const text12 = TextStyle(
    color: Colors.white,
    fontSize: 12
);

const text16 = TextStyle(
  color: Colors.white,
  fontSize: 16
);

const text20 = TextStyle(
    color: Colors.white,
    fontSize: 20
);

const text32 = TextStyle(
  color: Colors.white,
  fontSize: 32
);

