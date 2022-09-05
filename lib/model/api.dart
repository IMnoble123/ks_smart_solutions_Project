import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:usermodel/model/api_mode.dart';

class Project {
 getProductApi() async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      //log(sinInModelListFromJson(response.data)[2].address.street.toString());
      // List<String> city = [];
      // List<String> websites = [];
      // List<Company> companies = [];
      // List<User> users = userFromJson(response.data);
      // log('${users.length}');
      // for (User user in users) {
      //   city.add(user.address.city);
      //   websites.add(user.website);
      //   companies.add(user.company);
      // }
      // log('city ${city.length}');
      // log('web ${websites.length}');
      // log('comp ${companies.length}');
      // log(city.last);
      return response;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        log('Connection Refused !');
      }
      return 'Something went wrong !';
    }
  }
}
