import 'package:base_practice/user_list/models/user_list_model.dart';
import 'package:base_practice/user_list/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch()<UserModel>();
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _ui(userViewModel),
          ],
        ));
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // if (usersViewModel.userError != null) {
    //   return Container();
    // }
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UserModel userModel = usersViewModel.userListModel[index];
            return Column(
              children: [
                Text(
                  userModel.name.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: usersViewModel.userListModel.length),
    );
  }
}
