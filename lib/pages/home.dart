import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/libraries/scaffold.dart';
import 'package:legend_design_core/widgets/elevation/animated_card.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_design_widgets/datadisplay/list/list_item.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_core/styles/typography/rich/legend_rich_text.dart';
import 'package:legend_design_widgets/legend_design_widgets.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    const double verticalSpacing = 24;
    var width = MediaQuery.of(context).size.width;
    LegendTheme theme = LegendTheme.of(context);
    ScaffoldInfo info = ScaffoldInfo.of(context)!;

    return LegendRouteBody(
      children: [
        LegendText(
          "Legend Design",
          textStyle: theme.typography.h0,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
          ),
        ),
        LegendButton(
            text: LegendText("test"),
            onPressed: () {
              LegendRouter.of(context).pushPage(
                "/about",
                arguments: "aha",
                urlArguments: {
                  "test": "test",
                },
              );
            }),
        LegendText(
          "Legend Design is developed to be a all around Library for Flutter, which provides UI Components, Layouts, Routing, Dynamic Sizing and Theming for Cross Platform Applications.",
          textStyle: theme.typography.h1,
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: verticalSpacing / 1.5),
              child: Row(
                children: [
                  Icon(
                    Icons.stacked_line_chart_sharp,
                    size: 32,
                    color: theme.colors.secondary,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  LegendText(
                    "Features",
                    textStyle: theme.typography.h5,
                  ),
                ],
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.settings_input_component,
                color: Colors.cyan,
                size: 22,
              ),
              text: LegendText(
                "UI Components designed for cross platform Applications.",
                textStyle: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.person,
                color: Colors.greenAccent,
                size: 22,
              ),
              text: LegendText(
                "Devoloper friendly",
                textStyle: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.developer_board,
                color: Colors.purpleAccent,
                size: 22,
              ),
              text: LegendText(
                "Devloped completely standalone, without any third party dependencies.",
                textStyle: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.color_lens_sharp,
                color: Colors.blueGrey,
                size: 22,
              ),
              text: LegendText(
                "Powerful Sizing and Theming for every Platform",
                textStyle: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.nat_outlined,
                color: Colors.teal,
                size: 22,
              ),
              text: LegendText(
                "Native Functionalites in Kotlyn, Swift, C++ and Javascript.",
                textStyle: theme.typography.h1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: verticalSpacing / 1.5),
              child: LegendText(
                "Packages",
                textStyle: theme.typography.h5,
              ),
            ),
            /*   DynamicRow(
                    spacing: 12,
                    verticalSpacing: 12,
                    children: [
                      PackageCard(
                        icon: AntIcons.githubFilled,
                        name: "Legend_Design_Core",
                        version: "0.1.0",
                        width: 380,
                      ),
                      PackageCard(
                        icon: AntIcons.githubFilled,
                        name: "Legend_Design_Widgets",
                        version: "0.1.0",
                        width: 380,
                      ),
                      PackageCard(
                        icon: AntIcons.githubFilled,
                        name: "Legend_Design_Platform",
                        version: "0.0.1",
                        width: 380,
                      ),
                      PackageCard(
                        icon: AntIcons.githubFilled,
                        name: "Legend_Design_Template",
                        version: "1.0.0",
                        width: 380,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  )*/
            LegendWidgetLayout.dyn(
              children: [
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend_Design_Core",
                  version: "0.1.0",
                  url: "https://github.com/ThomasFercher/Legend-Design-Core",
                ),
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend_Design_Widgets",
                  version: "0.1.0",
                  url: "https://github.com/ThomasFercher/Legend-Design-Widgets",
                ),
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend_Design_Platform",
                  version: "0.0.1",
                  url: "https://github.com/ThomasFercher/Legend-Design-Cross",
                ),
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend_Design_Template",
                  version: "1.0.0",
                  url: "https://github.com/ThomasFercher/Legend-Design-Templae",
                ),
              ],
              layouts: {
                720: LegendCustomColumn(
                  spacing: 12,
                  children: [
                    LegendCustomWidget(0),
                    LegendCustomWidget(1),
                    LegendCustomWidget(2),
                    LegendCustomWidget(3),
                  ],
                ),
                1560: LegendCustomColumn(
                  spacing: 12,
                  children: [
                    LegendCustomRow(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(0, flex: 1),
                        LegendCustomWidget(1, flex: 1),
                      ],
                    ),
                    LegendCustomRow(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(2, flex: 1),
                        LegendCustomWidget(3, flex: 1),
                      ],
                    ),
                  ],
                ),
                1920: LegendCustomRow(
                  spacing: 12,
                  children: [
                    LegendCustomWidget(0, flex: 1),
                    LegendCustomWidget(1, flex: 1),
                    LegendCustomWidget(2, flex: 1),
                    LegendCustomWidget(3, flex: 1),
                  ],
                ),
              },
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        LegendText(
          "Installation",
          textStyle: theme.typography.h5,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
          ),
        ),
        LegendText(
          "With Command",
          textStyle: theme.typography.h1,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
          ),
        ),
        Container(
          height: 48,
          //width: s.width,
          decoration: BoxDecoration(
            color: theme.colors.background3,
            borderRadius: theme.sizing.radius2.asRadius(),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: theme.sizing.radius2,
          ),
          child: LegendRichText(
            text: [
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "flutter",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "pub add \$packageName",
              ),
            ],
          ),
        ),
        LegendText(
          "Or you can manually add these to your pubspec.yaml.",
          textStyle: theme.typography.h1,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
            top: verticalSpacing / 1.5,
          ),
        ),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: theme.colors.background3,
            borderRadius: theme.sizing.radius2.asRadius(),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: theme.sizing.radius2,
          ),
          child: LegendRichText(
            text: [
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "dependencies:\n",
              ),
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "   legend_design_core:",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "^0.1.0\n",
              ),
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "   legend_design_widgets:",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "^0.1.0\n",
              ),
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "   legend_design_platform:",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "^0.0.1\n",
              ),
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "   legend_design_template:",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "^1.0.0",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendText(
              "Usage",
              textStyle: theme.typography.h5,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
              ),
            ),
            LegendText(
              "In your Flutter project you can use the following imports.",
              textStyle: theme.typography.h1,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: theme.colors.background3,
                borderRadius: theme.sizing.radius2.asRadius(),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: theme.sizing.radius2,
              ),
              child: LegendRichText(
                text: [
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "import",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text:
                        "\'package:legend_design_core/legend_design_core.dart\';\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "import",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text:
                        "\'package:legend_design_core/legend_design_widgets.dart\';\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "import",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text:
                        "\'package:legend_design_core/legend_design_platform.dart\';\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "import",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text:
                        "\'package:legend_design_core/legend_design_template.dart\';",
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        LegendText(
          "Get Started",
          textStyle: theme.typography.h5,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
          ),
        ),
        LegendRichText(
          text: [
            RichTextItem(
              style: theme.typography.h1,
              text: "Please head over to our",
            ),
            RichTextItem(
              style: theme.typography.h1.copyWith(
                color: theme.colors.secondary,
              ),
              hoverColor: theme.colors.selection,
              text: "Documentation",
              onTap: () {
                LegendRouter.of(context).pushPage(
                  "/widgets",
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: verticalSpacing * 2,
        ),

        /* LegendWidgetLayout.dyn(
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    color: theme.colors.background[1],
                  ),
                ],
                layouts: {
                  400: LegendCustomColumn(
                    children: [
                      LegendCustomWidget(0),
                    ],
                  ),
                },
                width: s.width,
              )*/
      ],
    );
  }
}

class PackageCard extends StatelessWidget {
  final String name;
  final String version;
  final IconData icon;
  final String? url;
  final double? width;

  const PackageCard({
    Key? key,
    required this.name,
    required this.version,
    required this.icon,
    this.width,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    return AnimatedCard(
      borderRadius: theme.sizing.radius2.asRadius(),
      elevation: 1,
      padding: EdgeInsets.all(4),
      child: Container(
        height: 64,
        width: width,
        color: theme.colors.background3,
        padding: EdgeInsets.symmetric(
          horizontal: theme.sizing.spacing1,
        ),
        child: Row(
          children: [
            Expanded(
              child: LegendText(
                name,
                textStyle: theme.typography.h4,
                dynamicSizing: true,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Container(
              width: 48,
              decoration: BoxDecoration(
                color: theme.colors.secondary,
                borderRadius: theme.sizing.radius2.asRadius(),
              ),
              alignment: Alignment.center,
              child: LegendText(
                version,
                textStyle: theme.typography.h0.copyWith(color: Colors.white),
              ),
              height: 20,
            ),
            const SizedBox(
              width: 24,
            ),
            LegendAnimatedIcon(
              icon: icon,
              iconSize: 32,
              theme: LegendAnimtedIconTheme(
                enabled: theme.colors.selection,
                disabled: theme.colors.foreground4,
              ),
              onPressed: () {
                if (url != null) LegendFunctions.launchInBrowser(url!);
              },
            )
          ],
        ),
      ),
    );
  }
}
