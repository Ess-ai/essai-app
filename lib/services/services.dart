import 'package:essai/services/env.dart';
import 'package:essai/services/supabase.dart';

import 'authentication.dart';

class Services {
  var envInit = EnvInit();
  var supabaseService = SupabaseService();
  var auth = SupabaseAuthentication();
}
