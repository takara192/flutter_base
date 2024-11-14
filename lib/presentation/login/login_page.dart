import 'package:auto_route/annotations.dart';
import 'package:base_bbs/application/login/login_cubit.dart';
import 'package:base_bbs/presentation/base/base_page_state.dart';
import 'package:flutter/material.dart';

import '../../router/router_name.dart';

@RoutePage(name: RouterName.login)
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginCubit> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: ListView(),
    );
  }

}
