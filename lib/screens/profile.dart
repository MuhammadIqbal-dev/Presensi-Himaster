import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/screens/login.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/history_card_builder.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();
  final List itemsProfile = [
    'Semua Kegiatan',
    'Kegiatan Dihadiri',
    'Kegiatan Tidak Dihadiri'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: grayCr),
        title: Text(
          'Profil Saya',
          style: semiBoldStyle(13, grayCr),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/imgs/pp.png'),
                  maxRadius: 30,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Richard Felyn',
                      style: semiBoldStyle(14, black),
                    ),
                    Text(
                      'H1000000001',
                      style: textStyle(12, grayCr),
                    )
                  ],
                ),
                const Spacer(
                  flex: 5,
                ),
                InkWell(
                  onTap: () async {
                    var resp = await mainController.logoutController(mainController.userData.value.accessToken!);
                    if (resp) {
                      mainController.isLogin.value = false;
                      mainController.pageTransition(context, Login());
                      
                    }
                  },
                  child: Column(
                    children: [
                      Image.asset('assets/imgs/log_out.png'),
                      Text(
                        'Log Out',
                        style: textStyle(10, redCr),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.04 * getHeight(context) + 0.005 * getWidth(context),
            ),
            SizedBox(
              height: 54,
              width: 0.9 * getWidth(context),
              child: Align(
                alignment: Alignment.center,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: itemsProfile.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Obx(
                            () => InkWell(
                              onTap: () {
                                if (mainController.enabledProfile.value !=
                                    index) {
                                  mainController.enabledProfile(index);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration:
                                    mainController.enabledProfile.value ==
                                            index
                                        ? roundedBox(blueCr, 6)
                                        : roundedBox(Colors.transparent, 6),
                                child: Text(
                                  itemsProfile[index],
                                  style:
                                      mainController.enabledProfile.value ==
                                              index
                                          ? semiBoldStyle(12, white)
                                          : semiBoldStyle(12, grayCr),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ],
                      );
                    }),
              ),
            ),
            const Spacer(flex: 2,),
            Expanded(
              flex: 50, 
              child: HistoryCardBuilder()),
            const Spacer(flex: 4,),
          ],
        ),
      ),
    );
  }
}
