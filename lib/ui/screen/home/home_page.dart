import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/generated/i18n.dart';
import 'package:news/ui/screen/widgetapp/bg_header_widget.dart';
import 'package:news/ui/widget/text_input_search.dart';
import 'package:news/res/resources.dart';
import 'package:news/res/colors.dart';
import 'package:news/res/dimens.dart';
import 'package:news/res/sizebox.dart';
import 'package:news/res/text_styles.dart';

enum View { TOP, BOTTOM }

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BackgroundHeader(isFull: true),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildTextUserName(),
                SizeBoxUtils.hGap10,
                buildTextSearch(),
                SizeBoxUtils.hGap20,
                buildSearchView(),
                buildListSuggest(),
                SizeBoxUtils.hGap20,
                buildTextMenu(),
                SizeBoxUtils.hGap20,
                buildMenu(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextUserName() => Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Text('Toàn Dev', textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir20CoalGreyW600),
      );

  Widget buildTextSearch() => Container(
        width: MediaQuery.of(context).size.width,
        child: Text(S.of(context).home_search, textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir14CoalGreyW400),
      );

  Widget buildTextMenu() => Padding(
        padding: EdgeInsets.only(left: DimensUtils.size16),
        child: Text(S.of(context).home_favourite, style: TextStylesUtils.styleAvenir15BlackW600),
      );

  Widget buildTextMenuItem(String textName) => Text(textName, style: TextStylesUtils.styleAvenir12BlackW400);

  Widget buildSearchView() => TextInputSearch(
        validateErrMsg: "",
      );

  Widget buildListSuggest() {
    final titles = ['iPhone XR', 'Samsung Galaxy Note 10', 'Oppo', 'iPhone XR', 'Samsung Galaxy Note 10', 'Oppo'];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DimensUtils.size16),
      height: DimensUtils.size30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: DimensUtils.size4),
            padding: const EdgeInsets.all(DimensUtils.size8),
            child: Text(
              titles[index],
              textAlign: TextAlign.center,
              style: TextStylesUtils.styleAvenir12CoralW400,
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: ColorsUtils.coral),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          );
        },
      ),
    );
  }

  Widget buildMenu() => Container(
        child: Column(
          children: <Widget>[
            buildSubMenuRow(View.TOP),
            SizeBoxUtils.hGap30,
            buildSubMenuRow(View.BOTTOM),
            SizeBoxUtils.hGap30,
          ],
        ),
      );

  Widget buildSubMenu(String iconPath, String textName) => Expanded(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(iconPath),
            SizeBoxUtils.hGap10,
            buildTextMenuItem(textName),
          ],
        ),
      );

  Widget buildSubMenuRow(View view) {
    if (view == View.TOP) {
      return Row(children: [
        buildSubMenu(ImagesUtils.iconHomeMarket, S.of(context).home_menu_electronic),
        buildSubMenu(ImagesUtils.iconHomeFashion, S.of(context).home_menu_fashion),
        buildSubMenu(ImagesUtils.iconHomeHotel, S.of(context).home_menu_hotel),
      ]);
    } else {
      return Row(children: [
        buildSubMenu(ImagesUtils.iconHomeTickets, S.of(context).home_menu_air_ticket),
        buildSubMenu(ImagesUtils.iconHomeBeautify, S.of(context).home_menu_makeup),
        buildSubMenu(ImagesUtils.iconHomeTechnology, S.of(context).home_menu_technology),
      ]);
    }
  }
}
