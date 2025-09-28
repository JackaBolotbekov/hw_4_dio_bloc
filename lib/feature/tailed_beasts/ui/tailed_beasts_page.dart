import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/api_repository.dart';
import '../bloc/tailed_beasts_bloc.dart';
import '../bloc/tailed_beasts_event.dart';
import '../bloc/tailed_beasts_state.dart';
import 'widgets/tailed_beast_tile.dart';

class TailedBeastsPage extends StatelessWidget {
  const TailedBeastsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ApiRepository(),
      child: Builder(
        builder: (context) {
          final repo = context.read<ApiRepository>();
          return BlocProvider(
            create: (_) => TailedBeastsBloc(repo)..add(TailedBeastsRequested()),
            child: const _TailedBeastsView(),
          );
        },
      ),
    );
  }
}

class _TailedBeastsView extends StatelessWidget {
  const _TailedBeastsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список Хвостатых!')),
      body: BlocBuilder<TailedBeastsBloc, TailedBeastsState>(
        builder: (context, state) {
          switch (state.status) {
            case TailedBeastsStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case TailedBeastsStatus.failure:
              return Center(child: Text(state.error ?? 'Error'));
            case TailedBeastsStatus.success:
              final items = state.items;
              if (items.isEmpty) {
                return const Center(child: Text('Empty'));
              }
              return ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) => TailedBeastTile(item: items[i]),
              );
            case TailedBeastsStatus.initial:
            default:
            // Можно показать заглушку, но сюда попадём лишь на миг
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
