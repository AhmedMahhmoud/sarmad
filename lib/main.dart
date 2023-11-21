import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarmad_task/Core/Network/bloc_observer.dart';
import 'package:sarmad_task/Core/Theme/theme.dart';
import 'package:sarmad_task/Features/user_search/Presentation/Screens/search_screen.dart';
import './Core/dependency_inj/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencies();
  Bloc.observer = BlocObserverWatcher();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          home: const SearchScreen(),
        );
      },
    );
  }
}
