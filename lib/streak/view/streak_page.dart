import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winning_streak_app/auth/cubit/authorization_cubit.dart';
import 'package:winning_streak_app/multiple_choice_question/fetcher/mock_question_fetch_demo.dart';
import 'package:winning_streak_app/multiple_choice_question/multiple_choice_question.dart';

import '../streak.dart';
import 'streak_view.dart';

/// Stateless widget responsible for providing StreakCubit to StreakView
class StreakPage extends StatelessWidget {
  const StreakPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider<StreakCubit>(
          create: (_) => StreakCubit(),
        ),
        BlocProvider<QuestionCubit>(
          create: (_) => QuestionCubit(MockQuestionFetch()),
        ),
        BlocProvider<AuthorizationCubit>(
          create: (_) => AuthorizationCubit(),
        )
      //provide the authorization cubit
      ],
      child: StreakView(),
    );
  }
}