// import 'package:clean_arc/core/helper/api_services.dart';
// import 'package:clean_arc/features/movie/data/data_sources/movie_data_source.dart';
// import 'package:clean_arc/features/movie/data/repositories_impl/movies_repo_imp.dart';
// import 'package:clean_arc/features/movie/domain/repositories/movie_repo.dart';
// import 'package:clean_arc/features/movie/domain/use_cases/get_movies_details.dart';
// import 'package:clean_arc/features/movie/domain/use_cases/get_now_playing_movie_use_case.dart';
// import 'package:clean_arc/features/movie/domain/use_cases/get_popular_movie_use_case.dart';
// import 'package:clean_arc/features/movie/domain/use_cases/get_similar_movies_use_case.dart';
// import 'package:clean_arc/features/movie/domain/use_cases/get_top_rated_use_case.dart';
// import 'package:clean_arc/features/movie/presentation/bloc/movie/movies_bloc.dart';
// import 'package:clean_arc/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
// import 'package:get_it/get_it.dart';

// final sl = GetIt.instance;

// class ServicesLocator {
//   void init() {
//     // تسجيل DioHelper
//     //هنا في الديو هيلبر لو اخدنا بالنا فالاقواس الاخيره مش جواها حاجة عشان الديو مش بتعتمد علي اوبجكت معين
//     sl.registerLazySingleton<DioHelper>(() => DioHelper());

//     // تسجيل MovieDataSource
//     // انما هنا في الداتا سورس عشان الموفيس داتا معتمد علي اوبجكت من الديو هيلبر فاحنا حطينا جواه sl
//     // طيب دا معناه انك يا عم جيت ات الاوبجت الي انتا محتاجة انا معرفة اصلا جواك فلما تحتاجه استدعيى
//     // دا بدل ما اقعد اباضي بالطريقة الخرا القديمة
//     sl.registerLazySingleton<BaseMovieDataSource>(() => MovieDataSource(sl()));

//     //تسجيل الريبو
//     sl.registerLazySingleton<MovieRepo>(() => MovieRepoImp(sl()));

//     // usecases

//     sl.registerLazySingleton<GetPopularMovieUseCase>(
//         () => GetPopularMovieUseCase(sl()));
//     sl.registerLazySingleton<GetTopRatedUseCase>(
//         () => GetTopRatedUseCase(sl()));
       
//     sl.registerLazySingleton<GetNowPlayingMovieUseCase>(
//         () => GetNowPlayingMovieUseCase(sl()));
    
//     sl.registerLazySingleton<GetMoviesDetailsUseCase>(
//         () => GetMoviesDetailsUseCase(sl()));
//     sl.    registerLazySingleton<GetSimilarMoviesUseCase>(
//         () => GetSimilarMoviesUseCase(sl()));
    

//     //هنا بنعمل ريجيستر للبلوك باستخدام الفاكتوري عشان احنا بنحتاج نريبيلد البلوك في صفحات كتيره
//     //ودا هو الفرق بين الفاكتوري واللليزي سينجل ان الليزي بيتبلد مره واحده في بداية التطبيق بعنوان واحد
//     //انما الفاكتوري بيتعملة ريبلد في كل مره الصفحة بتتعاد انشائها او تحميلها
//     sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

//     sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
//   }
// }
