import 'package:essai/services/supabase/supabase_authentication.dart';

import 'openai/openai_ai_service.dart';
import 'supabase/supabase.dart';
import 'supabase/supabase_essay_operations.dart';
import 'supabase/supabase_essay_services.dart';
import 'supabase/supabase_user_service.dart';

class Services {
  final userServices = SupabaseUserServices();
  final supabaseService = SupabaseService();
  final essayServices = SupabaseEssayServices();
  final essayOperations = EssayOperations();
  final aiService = OpenAiService();
  final authService = SupabaseAuthentication();
}
