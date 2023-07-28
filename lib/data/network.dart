import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_constant.dart';

/// ### This method is for post request
/// * [body] map of data to send in the body of the post request
/// * [endPoint] API url end point
/// * [isToken] bool type to check token
/// * [token] token to authentication the API call
/// * [isFullUrl] bool type to check that the endpoint is full URL

Future<dynamic> callPostApi(
    Map<String, dynamic> body,
    String endPoint, {
      String token = '',
      bool isFullUrl = false,
    }) async {
  print('URL Request ------------------------------->\n $baseURL$endPoint');
  print('API Request ------------------------------->\n ${jsonEncode(body)}');
  print('Request Body ------------------>\n ${body.toString()}');
  ///Create a map to send in the header
  final withToken = {
    "Content-Type": "application/json",
    "Authorization": token,
  };

  print(
      'API Request Header ------------------------------->\n ${jsonEncode(withToken)}');

  ///Merge the url
  String url = isFullUrl ? endPoint : '$baseURL$endPoint';
  try {
    ///Call the post API call
    final response = await http.post(
      Uri.parse(url),
      headers: withToken,
      // body: body,
      body: jsonEncode(body),
    );
    print(
        'API response ------------------------------->\n ${response.statusCode}');
    print('API response ------------------------------->\n ${response.body}');
    String finalResponse = response.body;
    print(
        'API final response ------------------------------->\n ${finalResponse.toString()}');
    print(
        'API request Header ------------------------------->\n ${response.headers}');

    ///return the response data
    return jsonDecode(finalResponse);
  } catch (e) {
    print('$e');
  }
}

/// ### This method is for get API call
/// * [endPoint] API url end point
/// * [token] token to authenticate API call
Future<dynamic> callGetApi(String endPoint, {String token = ''}) async {
  try {
    print('token ------------------>\n $token');

    ///Call the post API
    final response = await http.get(
      Uri.parse('$baseURL$endPoint'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );
    print('url ------------------>\n $baseURL$endPoint');
    print('Auth Token ------------------>\n $token');
    String finalResponse = response.body;
    print(
        'endPoint API request header ------------------>\n ${jsonDecode(finalResponse)}');
    print('endPoint API response ------------------>\n $finalResponse');

    ///Return the API response data
    return jsonDecode(finalResponse);
  } catch (e) {
    print('$e');
  }
}

/// ### This method is for multipart API call
/// * [endPoint] API url end point
/// * [imageFile] image file to send in the multipart
/// *[token] token to authentication the API call
Future<dynamic> callMultipartFileAPI(
    Map<String, String> body, {
      String? endPoint,
      // var fileName,
      // var imagePath,
      String token = '',
    }) async {
  print('url ------------------>\n $baseURL$endPoint');

  ///Create the map to send in the API call header
  var headers = {
    "Content-Type": "multipart/form-data",
    'accept': 'text/plain',
    // 'Authorization': token
  };
  print('Header ------------------>\n ${headers.toString()}');

  ///Create the multipart request
  var request = http.MultipartRequest('POST', Uri.parse('$baseURL$endPoint'));

  ///Add the file in the request
  // if (imagePath != null) {
  //   if (imagePath is String) {
  //     request.files
  //         .add(await http.MultipartFile.fromPath(fileName!, imagePath));
  //   }
  //   else {
  //     for (int i = 0; i < imagePath.length; i++) {
  //       request.files
  //           .add(await http.MultipartFile.fromPath(fileName!, imagePath[i]));
  //     }
  //   }
  // }

  // request.files.add(await http.MultipartFile.fromPath(fileName!, imagePath));

  if (body != null) {
    request.fields.addAll(body);
  }

  ///Add the header in the request
  request.headers.addAll(headers);

  ///Send the multipart request to the server
  http.StreamedResponse response = await request.send();
  print(response.reasonPhrase);
  if (response.statusCode == 200) {
    String data = await response.stream.bytesToString();
    print('Api Response data --> ${data.toString()}');
    print('Request Body ------------------>\n ${body.toString()}');

    ///Return the API response
    return jsonDecode(data);
  } else {
    print(response.reasonPhrase);
  }
}