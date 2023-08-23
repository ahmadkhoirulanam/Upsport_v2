import 'dart:async';

import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/view/3_login_view/login_view.dart';
import 'package:sport/view/6_main_view/1_beranda_view/2_berita_detail_view/berita_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport/view/0_global/1_value/transition_value.dart';
import 'package:sport/view/6_main_view/1_beranda_view/1_event_detail_view/event_detail_view.dart';
import 'package:sport/view/6_main_view/5_user_view/user_view.dart';
import 'package:sport/view/B.%20Pelatih/pelatih_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/2_promo_view/promo_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/lapanganbasket.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/lapanganbola.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/lapanganbulu.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/lapanganfutsal.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/lapanganpimpong.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/lapangantenis.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatihbasket.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatihbola.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatihbulu.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatihfutsal.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatihpimpong.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatihsenam.dart';
import 'package:sport/view/C.%20Wasit/wasit_view.dart';
import 'package:sport/view/C.%20Wasit/widget/wasitbasket.dart';
import 'package:sport/view/C.%20Wasit/widget/wasitbola.dart';
import 'package:sport/view/C.%20Wasit/widget/wasitbulu.dart';
import 'package:sport/view/C.%20Wasit/widget/wasitenis.dart';
import 'package:sport/view/C.%20Wasit/widget/wasitfutsal.dart';
import 'package:sport/view/C.%20Wasit/widget/wasitpimpong.dart';
import 'package:sport/view/D.%20Message/pelatihmessage.dart';
import 'package:sport/view/E.%20toko/toko_view.dart';

class FuncHomeView {
  static void eventClick(BuildContext context,
      {@required String? imgHeaderTag, @required Widget? imgHeader}) {
    goToPage(
      context,
      page: HomeEventDetail(
        imgHeaderTag: imgHeaderTag,
        imgHeader: imgHeader,
      ),
    );
  }

  static void beritaClick(BuildContext context,
      {@required String? imgHeaderTag, @required Widget? imgHeader}) {
    goToPage(
      context,
      page: HomeBeritaDetail(
        imgHeaderTag: imgHeaderTag,
        imgHeader: imgHeader,
      ),
    );
  }

  static void closeDetail(BuildContext context,
      {@required VoidCallback? onClick}) {
    Timer? _timer;
    onClick!();
    _timer = Timer(const Duration(milliseconds: 400), () {
      _timer!.cancel();
      Navigator.pop(context);
    });
  }

  static void goToAgenda(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: Promo(anim: anim));
    });
  }

  static void goToPelatih(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: Pelatih(anim: anim));
    });
  }

  static void goToWasit(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: Wasit(anim: anim));
    });
  }

  static void goToMessage(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: Message_view());
    });
  }

  static void goToToko(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: Toko_view());
    });
  }

  static void goToProfile(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: LoginView());
    });
  }

  static void goToFutsal(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: lapanganfutsal(anim: anim));
    });
  }

  static void goToPelatihFutsal(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: PelatihFutsal());
    });
  }

  static void goToPelatihbasket(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: PelatihBasket());
    });
  }

  static void goToPelatihbola(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: PelatihBola());
    });
  }

  static void goToPelatihsenam(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: PelatihSenam());
    });
  }

  static void goToPelatihbulu(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: PelatihBulu());
    });
  }

  static void goToPelatihpimpong(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: PelatihPimpong());
    });
  }

  static void goToWasitFutsal(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: WasitFutsal());
    });
  }

  static void goToProfil(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: UserView());
    });
  }

  static void goToWasitbasket(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: WasitBasket());
    });
  }

  static void goToWasitbola(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: WasitBola());
    });
  }

  static void goToWasittenis(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: WasitTenis());
    });
  }

  static void goToWasitbulu(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: WasitBulu());
    });
  }

  static void goToWasitpimpong(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: WasitPimpong());
    });
  }

  static void goToLapBasket(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: lapanganbasket(anim: anim));
    });
  }

  static void goToLapBola(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: lapanganbola(anim: anim));
    });
  }

  static void goToLaptenis(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: lapangantenis(anim: anim));
    });
  }

  static void goToLapbulu(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: lapanganbulu(anim: anim));
    });
  }

  static void goToLappimpong(
    BuildContext context, {
    @required AnimationController? anim,
  }) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: lapanganpimpong(anim: anim));
    });
  }
}
