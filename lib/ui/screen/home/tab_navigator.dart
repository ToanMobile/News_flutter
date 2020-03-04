import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/generated/i18n.dart';
import 'package:news/ui/screen/bookmark/bookmark_page.dart';
import 'package:news/ui/screen/profile/profile_page.dart';
import 'package:news/res/resources.dart';
import 'package:news/res/colors.dart';
import 'package:news/res/dimens.dart';
import 'package:news/res/text_styles.dart';
import 'home_page.dart';

List<Widget> pages = <Widget>[HomePage(), BookmarkPage(), ProfilePage()];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null || DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: BouncingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(DimensUtils.size16), topLeft: Radius.circular(DimensUtils.size16)),
          boxShadow: [
            BoxShadow(color: ColorsUtils.brownishGrey, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(DimensUtils.size16),
            topRight: Radius.circular(DimensUtils.size16),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(ImagesUtils.iconTabHome),
                activeIcon: SvgPicture.asset(
                  ImagesUtils.iconTabHome,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_home),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(ImagesUtils.iconTabReview),
                activeIcon: SvgPicture.asset(
                  ImagesUtils.iconTabReview,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_review),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(ImagesUtils.iconTabChallenge),
                activeIcon: SvgPicture.asset(
                  ImagesUtils.iconTabChallenge,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_challenge),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(ImagesUtils.iconTabPerson),
                activeIcon: SvgPicture.asset(
                  ImagesUtils.iconTabPerson,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_personal),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(ImagesUtils.iconTabMore),
                activeIcon: SvgPicture.asset(
                  ImagesUtils.iconTabMore,
                  color: ColorsUtils.watermelon,
                ),
                title: Text(S.of(context).tab_more),
              ),
            ],
            currentIndex: _selectedIndex,
            fixedColor: ColorsUtils.watermelon,
            unselectedFontSize: DimensUtils.size12,
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          ),
        ),
      ),
    );
  }
}
