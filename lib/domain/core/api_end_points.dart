import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloadsUrl = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const searchUrl = "$kBaseUrl/search/movie?api_key=$apiKey";
  static const hotAndNewMovie = "$kBaseUrl/discover/movie?api_key=$apiKey";
   static const hotAndNewTv = "$kBaseUrl/discover/tv?api_key=$apiKey";
}
