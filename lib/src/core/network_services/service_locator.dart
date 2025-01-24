

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery_app/src/core/network_services/dio_client.dart';
import 'package:grocery_app/src/logic/repo/auth_repo.dart';
import 'package:grocery_app/src/logic/services/auth_service_locator.dart';




GetIt getIt = GetIt.instance;

class ServiceLocator 
{
  static void setup() {
 
    // dio client
    getIt.registerSingleton(Dio());
    getIt.registerSingleton(DioClient(getIt<Dio>()));
    getIt.registerSingleton(AuthServices());
    // getIt.registerSingleton(ProductService());
    //    getIt.registerSingleton(StoreService());
    //     getIt.registerSingleton(HomeService());

   
    
    // Repos
     getIt.registerSingleton(AuthRepo(getIt<AuthServices>()));
//      getIt.registerSingleton(ProductRepo(getIt<ProductService>()));
// getIt.registerSingleton(StoreRepo(getIt<StoreService>()));
// getIt.registerSingleton(HomeRepo(getIt<HomeService>()));
   
  }
}
