import 'package:wazifati/app/routes.dart';
import 'package:wazifati/ui/screens/location/locationHelperWidget.dart';
import 'package:wazifati/ui/theme/theme.dart';
import 'package:wazifati/utils/app_icon.dart';
import 'package:wazifati/utils/custom_text.dart';
import 'package:wazifati/utils/extensions/extensions.dart';
import 'package:wazifati/utils/hive_keys.dart';
import 'package:wazifati/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.pushNamed(context, Routes.countriesScreen,
                arguments: {"from": "home"});
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: context.color.secondaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: UiUtils.getSvg(
              AppIcons.location,
              fit: BoxFit.none,
              color: context.color.territoryColor,
            ),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: Hive.box(HiveKeys.userDetailsBox).listenable(),
              builder: (context, value, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "locationLbl".translate(context),
                      color: context.color.textColorDark,
                      fontSize: context.font.small,
                    ),
                    LocationHelperWidget().selectedDefaultLocation(),
                  ],
                );
              }),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
