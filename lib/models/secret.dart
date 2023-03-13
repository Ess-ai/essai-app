class Secret {
  final String supabaseUrl;
  final String supabaseAnonKey;
  final String openaiApiKey;

  Secret(
      {this.supabaseUrl = "",
      this.supabaseAnonKey = "",
      this.openaiApiKey = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(
        supabaseUrl: jsonMap["supabase_url"],
        supabaseAnonKey: jsonMap["supabase_anon_key"],
        openaiApiKey: jsonMap['openai_api_key']);
  }
}
