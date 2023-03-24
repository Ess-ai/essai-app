import 'package:essai/services/env.dart';
import 'package:essai/services/getuser.dart';
import 'package:essai/services/supabase.dart';

import 'authentication.dart';

class Services {
  final envInit = EnvInit();
  final supabaseService = SupabaseService();
  final auth = SupabaseAuthentication();
  final getusr = Getuser();
}
