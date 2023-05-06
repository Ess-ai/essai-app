class AppConstants {
  final String supabaseUrl = const String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://jlzlivadcmgelnasocxl.supabase.co',
  );
  final String supabaseAnonKey = const String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsemxpdmFkY21nZWxuYXNvY3hsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Nzg4MjIwNjksImV4cCI6MTk5NDM5ODA2OX0.5HJBaTEPKkPATNwSqWROVAhxhMBAdmAq4WyruXigmiY',
  );
  final String openaiApiKey = const String.fromEnvironment(
    'OPENAI_API_KEY',
    defaultValue: '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',
  );
}
