import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api/api_service.dart';
import '../../../data/local/hive/beasts_hive.dart';
import '../../../data/repository/api_repository.dart';
import '../bloc/tailed_beasts_bloc.dart';
import '../bloc/tailed_beasts_event.dart';
import '../bloc/tailed_beasts_state.dart';
import 'widgets/tailed_beast_tile.dart';

class TailedBeastsPage extends StatelessWidget {
  const TailedBeastsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiRepository>(
          create: (_) => ApiRepository(ApiService(Dio())),
        ),
        RepositoryProvider<BeastsHive>(
          create: (_) => BeastsHive(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final api = context.read<ApiRepository>();
          final hive = context.read<BeastsHive>();
          return BlocProvider(
            create: (_) => TailedBeastsBloc(api, hive)
              ..add(LoadFromHiveRequested()),
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
      appBar: AppBar(
        title: const Text('Список Хвостатых!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud_download),
            tooltip: 'Загрузить из сети',
            onPressed: () => context
                .read<TailedBeastsBloc>()
                .add(LoadOnlineRequested()),
          ),
        ],
      ),
      body: BlocBuilder<TailedBeastsBloc, TailedBeastsState>(
        builder: (context, state) {
          switch (state.status) {
            case TailedBeastsStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case TailedBeastsStatus.failure:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.error ?? 'Ошибка загрузки'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context
                          .read<TailedBeastsBloc>()
                          .add(LoadOnlineRequested()),
                      child: const Text('Повторить'),
                    ),
                  ],
                ),
              );
            case TailedBeastsStatus.success:
              final items = state.items;
              return ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) => TailedBeastTile(item: items[i]),
              );
            case TailedBeastsStatus.empty:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Пусто. Нажми, чтобы загрузить из сети.'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context
                          .read<TailedBeastsBloc>()
                          .add(LoadOnlineRequested()),
                      child: const Text('Загрузить'),
                    ),
                  ],
                ),
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
