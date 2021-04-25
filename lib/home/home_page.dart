import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getUser();
    controller.getQuizzess();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: LevelButtonWidgetTypes.facil,
                  ),
                  LevelButtonWidget(
                    label: LevelButtonWidgetTypes.medio,
                  ),
                  LevelButtonWidget(
                    label: LevelButtonWidgetTypes.dificil,
                  ),
                  LevelButtonWidget(
                    label: LevelButtonWidgetTypes.perito,
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (question) => QuizCardWidget(
                          title: question.title,
                          completed: '${question.questionAnswered}/${question.questions.length}',
                          percent: question.questionAnswered / question.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  title: question.title,
                                  questions: question.questions,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        ),
      ),
    );
  }
}
