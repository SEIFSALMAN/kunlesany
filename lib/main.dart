import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlesany/layout/home_layout.dart';
import 'package:kunlesany/modules/authentication/login_view.dart';
import 'package:kunlesany/modules/onboarding/onboarding_view.dart';
import 'package:kunlesany/shared/bloc_observer.dart';
import 'package:kunlesany/shared/constants/language_constants.dart';
import 'package:kunlesany/shared/cubits/appMode/app_mode_cubit.dart';
import 'package:kunlesany/shared/cubits/education/education_cubit.dart';
import 'package:kunlesany/shared/cubits/login/login_cubit.dart';
import 'package:kunlesany/shared/cubits/register/register_cubit.dart';
import 'package:kunlesany/shared/network/local/cache_helper.dart';
import 'package:kunlesany/shared/providers/auth_providers.dart';
import 'package:kunlesany/shared/providers/bookmark_provider.dart';
import 'package:kunlesany/shared/styles/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

bool? onBoarding = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Firebase.initializeApp();

  Widget widget;
  var isDark = CacheHelper.getData(key: "isDark");
  var onBoarding = CacheHelper.getData(key: "onBoarding");
  var uId = CacheHelper.getData(key: "uId");
  print("isDark : $isDark");
  print("onBoarding :  $onBoarding");
  print("uId :  $uId");

  if(isDark == null)
    {
      isDark = false;
    }
  else {
    isDark = isDark;
  }
  /// For Onboarding

   if(onBoarding == false || onBoarding == null) {
     widget = OnboardingView();
   }
   else if(onBoarding == true && uId == null){
     widget = LoginView();
   } else {
     widget = HomeLayout();
   }

  runApp(MyApp(isDark,widget));
}

class MyApp extends StatefulWidget {
  final bool isDark;
  final Widget startWidget;
  MyApp(this.isDark,this.startWidget);

  @override
  State<MyApp> createState() => _MyAppState(startWidget);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  final Widget startWidget;

  _MyAppState(this.startWidget);

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
          AppModeCubit()..changeAppMode(fromShared: widget.isDark)),
          BlocProvider(create: (context) => EducationCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => RegisterCubit())
      ],
      child: BlocConsumer<AppModeCubit, AppModeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_)=>AuthProvider()),
              ChangeNotifierProvider(create: (context)=>BookmarkLettersProvider()),
              ChangeNotifierProvider(create: (context)=>BookmarkNumbersProvider()),
              ChangeNotifierProvider(create: (context)=>BookmarkWordsProvider()),
            ],
            child: MaterialApp(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: _locale,
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: AppModeCubit.get(context).isDarkMode!
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: startWidget),
          );

        },
      ),
    );
  }
}

