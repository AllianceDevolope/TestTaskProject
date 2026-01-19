import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_project/application/markets/presentation/bloc/markets_bloc.dart';
import 'package:test_task_project/application/markets/presentation/bloc/markets_event.dart';
import 'package:test_task_project/application/markets/presentation/bloc/markets_state.dart';
import 'package:test_task_project/application/markets/presentation/widgets/coins_list_container_view.dart';
import 'package:test_task_project/core/services/dependency_service.dart';
import 'package:test_task_project/core/styles/styles.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(15),
          child: BlocProvider<MarketsBloc>(
            create: (context) =>
                dependencyService()..add(GetMarketsEvent(limit: 15, offset: 0)),
            child: BlocBuilder<MarketsBloc, MarketsState>(
              builder: (context, state) {
                if (state is MarketsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is MarketsLoadFailedState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.red),
                      const SizedBox(height: 10),
                      Text(state.message, style: bold),
                    ],
                  );
                }

                if (state is MarketsLoadedState) {
                  return CoinsListContainerView(state.markets);
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
