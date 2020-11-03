import 'package:flutter/material.dart';
import 'dart:math';

class WeatherProvider extends ChangeNotifier {
  final imageList = [
    "https://www.google.com/search?q=%D8%B9%DA%A9%D8%B3+%D8%A2%D8%A8+%D9%88+%D9%87%D9%88%D8%A7&tbm=isch&ved=2ahUKEwj3zrWup_frAhVBlxoKHbe6ArAQ2-cCegQIABAA&oq=%D8%B9%DA%A9%D8%B3+%D8%A2%D8%A8+%D9%88+%D9%87%D9%88%D8%A7&gs_lcp=CgNpbWcQAzIECAAQEzIECAAQEzIECAAQEzIICAAQCBAeEBMyCAgAEAgQHhATMggIABAIEB4QEzoECCMQJzoCCABQzjRYmFZgrFxoAHAAeACAAcQCiAHwG5IBBjItMTAuM5gBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=shFnX_etLMGuarf1ioAL&bih=625&biw=1366#imgrc=b6lY67_4lL8dBM",
    "https://www.google.com/search?q=%D8%B9%DA%A9%D8%B3+%D8%A2%D8%A8+%D9%88+%D9%87%D9%88%D8%A7&tbm=isch&ved=2ahUKEwj3zrWup_frAhVBlxoKHbe6ArAQ2-cCegQIABAA&oq=%D8%B9%DA%A9%D8%B3+%D8%A2%D8%A8+%D9%88+%D9%87%D9%88%D8%A7&gs_lcp=CgNpbWcQAzIECAAQEzIECAAQEzIECAAQEzIICAAQCBAeEBMyCAgAEAgQHhATMggIABAIEB4QEzoECCMQJzoCCABQzjRYmFZgrFxoAHAAeACAAcQCiAHwG5IBBjItMTAuM5gBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=shFnX_etLMGuarf1ioAL&bih=625&biw=1366#imgrc=yIxFBdna7te7hM",
    "https://www.google.com/search?q=%D8%B9%DA%A9%D8%B3+%D9%87%D9%88%D8%A7%DB%8C+%D9%BE%D8%A7%DB%8C%DB%8C%D8%B2&sxsrf=ALeKk03qJS5wIDaAu0WLR-9Evg3_w6kCyQ:1600590912357&tbm=isch&source=iu&ictx=1&fir=I5BKbw_hfCobNM%252CD6t1KF10ybXvQM%252C_&vet=1&usg=AI4_-kRFcsmwzzr0YjuylZ2GsWRGukV1kQ&sa=X&ved=2ahUKEwjKz4vmqffrAhWvx4UKHQ2wD2sQ9QF6BAgKECs&biw=1366&bih=625#imgrc=I5BKbw_hfCobNM",
    "https://www.google.com/search?q=%D8%B9%DA%A9%D8%B3+%D9%87%D9%88%D8%A7%DB%8C+%D8%A8%D9%87%D8%A7%D8%B1%DB%8C&sxsrf=ALeKk01vSCSWNIC6Hz66Wfy8TJj5JbDn5w:1600590952149&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjOr4j5qffrAhUFHxoKHUFSCEMQ_AUoAXoECAwQAw&biw=1366&bih=625#imgrc=RF25_tjUVtRyoM"
  ];
  String getRandomImage() => imageList[Random().nextInt(imageList.length - 1)];
}
