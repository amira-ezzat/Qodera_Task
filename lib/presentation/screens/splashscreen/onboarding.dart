import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/styles/app_texts.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/presentation/screens/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String text; // النص فقط

  BoardingModel({
    required this.image,
    required this.text,
  });
}

class BoardingScreen extends StatefulWidget {
  @override
  State<BoardingScreen> createState() => _BoardingScreen();
}

class _BoardingScreen extends State<BoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/image/o1.png',
      text: 'يمكن للزهور أن تعبر عما لا تستطيع آلاف الكلمات قوله.',
    ),
    BoardingModel(
      image: 'assets/image/o2.png',
      text: 'زهرة واحدة كافية لتحسين مزاجك وتخفيف أي توتر.',
    ),
    BoardingModel(
      image: 'assets/image/o3.png',
      text: 'الورد يذكّرنا أن التفاصيل الصغيرة تصنع فرقًا كبيرًا.',
    ),
  ];

  bool isLast = false;

  void submit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.pinkLight,
        appBar: AppBar(
          backgroundColor: AppColors.pinkLight,
          elevation: 0,
          leading: SizedBox(),
          actions: [
            TextButton(
              onPressed: submit,
              child: AppTexts(
               data:  "تخطي",
                textColor:Colors.black ,
              ).bodyBM(),
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: AppColors.pinkLight,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: boardController,
                        itemCount: boarding.length,
                        itemBuilder: (context, index) =>
                            buildBoardingItem(boarding[index]),
                        onPageChanged: (int index) {
                          setState(() {
                            isLast = index == boarding.length - 1;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 66),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  if (isLast) {
                    submit();
                  } else {
                    boardController.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: AppColors.pink,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        flex: 0,
        child: SizedBox(
          height: 250, // <-- حجم موحد للصور
          child: Image.asset(
            model.image,
            fit: BoxFit.contain, // <-- يحافظ على النسب
          ),
        ),
      ),
      SizedBox(height: 20),
      AppTexts(
        data: model.text,
        textColor: Colors.black87,
        textAlign: TextAlign.center,
      ).bodyBXL(),
      SizedBox(height: 20),
      SmoothPageIndicator(
        controller: boardController,
        effect: ExpandingDotsEffect(
          dotColor: Colors.white54,
          activeDotColor: AppColors.pink,
          dotHeight: 8,
          dotWidth: 8,
          expansionFactor: 2,
          spacing: 6.0,
        ),
        count: boarding.length,
      ),
    ],
  );
}
