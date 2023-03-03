import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  late dynamic userLogado = '';

  late dynamic itensCarrinho = [];

  loginUser({required String email, required String senha}) async {
    var data = {'identifier': email, 'password': senha};
    await http
        .post(
      Uri.parse('https://adocao-production.up.railway.app/api'),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    )
        .then((Response) async {
      if (Response.statusCode == 200) {
        userLogado = jsonDecode(Response.body);

        notifyListeners();
      } else if (Response.statusCode == 400) {
        notifyListeners();
      }
    });
  }

  cadastroUser(
      {required String nome,
      required String email,
      required String senha,
      required String contato}) async {
    var data = {
      'username': nome,
      'email': email,
      'contato': contato,
      'password': senha
    };
    await http
        .post(
      Uri.parse(
          'https://adocao-production.up.railway.app/api/auth/local/register'),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    )
        .then((Response) async {
      if (Response.statusCode == 200) {
        userLogado = jsonDecode(Response.body);

        notifyListeners();
      } else if (Response.statusCode == 400) {
        notifyListeners();
      }
    });
  }

  void signIn({
    required String email,
    required String pass,
    required void Function() onSuccess,
    required void Function() onFail,
  }) async {
    final url =
        Uri.parse('https://adocao-production.up.railway.app/api/auth/local');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'identifier': email,
        'password': pass,
      }),
    );

    if (response.statusCode == 200) {
      // Login bem sucedido
      onSuccess();
    } else {
      // Login falhou
      onFail();
    }
  }
}
