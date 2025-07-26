
import 'package:firebase_login_test/core/helper/database_service.dart';
import 'package:firebase_login_test/core/helper/firebase_auth.dart';
import 'package:firebase_login_test/core/helper/firestore_service.dart';
import 'package:firebase_login_test/features/auth/data/repositories_impl/auth_repo_impl.dart';
import 'package:firebase_login_test/features/auth/domain/repositories/auth_repo.dart';
import 'package:get_it/get_it.dart';


final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
}
