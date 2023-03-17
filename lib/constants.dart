class AppConstants {
  final String supabaseUrl = const String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );
  final String supabaseAnonKey = const String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );
  final String openaiApiKey = const String.fromEnvironment(
    'OPENAI_KEY',
    defaultValue: '',
  );
}
