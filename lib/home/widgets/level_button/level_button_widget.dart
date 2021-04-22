import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class LevelButtonWidgetTypes {
  static final String facil = 'Fácil';
  static final String medio = 'Médio';
  static final String dificil = 'Difícil';
  static final String perito = 'Perito';
}

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({
    required this.label,
  }) : assert(
          [
            LevelButtonWidgetTypes.facil,
            LevelButtonWidgetTypes.medio,
            LevelButtonWidgetTypes.dificil,
            LevelButtonWidgetTypes.perito
          ].contains(label),
        );

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    },
  };

  Color get color => config[label]!['color']!;

  Color get borderColor => config[label]!['borderColor']!;

  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.color,
        border: Border.fromBorderSide(
          BorderSide(
            color: this.borderColor,
          ),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 6,
        ),
        child: Text(
          this.label,
          style: GoogleFonts.notoSans(
            color: this.fontColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
