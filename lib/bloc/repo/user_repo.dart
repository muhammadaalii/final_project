import 'dart:convert';

import 'package:http/http.dart';
import 'package:final_project/bloc/model/user_model.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=1';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
