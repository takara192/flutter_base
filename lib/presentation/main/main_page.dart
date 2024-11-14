import 'package:auto_route/annotations.dart';
import 'package:base_bbs/application/example/example_cubit.dart';
import 'package:base_bbs/presentation/base/base_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../router/router_name.dart';
import '../../shared/shared_widget/app_scaffold.dart';

@RoutePage(name: RouterName.main)
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BasePageState<MainPage, ExampleCubit> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    cubit.getPosts();
  }

  @override
  Widget buildPage(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: BlocBuilder<ExampleCubit, ExampleState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.listExample.length,
            itemBuilder: (context, index) {
              final item = state.listExample[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.userId.toString()),
                  Text(item.id.toString()),
                  Text(item.title),
                  Text(item.body),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
