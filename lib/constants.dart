import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  final String supabaseUrl = dotenv.env['supabase_url'].toString();
  final String supabaseAnonKey = dotenv.env['supabase_anon_key'].toString();
  final String openaiAnonKey = dotenv.env['openai_anon_key'].toString();
}
