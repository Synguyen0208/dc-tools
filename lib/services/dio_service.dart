import 'package:dio/dio.dart';
import 'package:store/app.dart';
import 'package:store/screens/error_screen.dart';

var options = BaseOptions(
  baseUrl: "https://shopee.vn/api/v4/shop/",
  contentType: 'application/json',
  headers: {
    "User-Agent":
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',
    "Cookie":
        "REC_T_ID=b1a6aa2a-cc51-11ed-b863-3473791739d2; SPC_F=KdqJG61ohIE2Zfo7t4hEWA7S1Z1sNRtu; SPC_R_T_ID=TCTF2wf5hynnTgIeg9q93x9wui3ECELhnOQsV14Va1hhp5Y+L71/tcelFZ0jvSknMvg/p6OUQeSLy1ROFoTGLrT6jkSoBDN14DaTtbqDlDtZVRYt41IjwnMEJSmBrXidKpAukqPm9U54CBstlFxmmQrhuudBs6LKds655ygszMk=; SPC_R_T_IV=Nk52dmdkS1lkcVYwYkFkOA==; SPC_SI=CH4aZAAAAAA5M3c5OTJqegj6PgEAAAAAeGR5RUJReHM=; SPC_T_ID=TCTF2wf5hynnTgIeg9q93x9wui3ECELhnOQsV14Va1hhp5Y+L71/tcelFZ0jvSknMvg/p6OUQeSLy1ROFoTGLrT6jkSoBDN14DaTtbqDlDtZVRYt41IjwnMEJSmBrXidKpAukqPm9U54CBstlFxmmQrhuudBs6LKds655ygszMk=; SPC_T_IV=Nk52dmdkS1lkcVYwYkFkOA=="
  },
);

var dio = Dio(options)..interceptors.add(DioInterceptor());

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    if (err is DioError) {
      App.navigatorKey.currentState?.pushNamed('/error',
          arguments: ErrorArguments(
            message: err.message,
            title: err.toString(),
          ));
    }
    handler.next(err);
  }
}
