import 'package:flutter_test/flutter_test.dart';

import '../home_robot.dart';

class CommentsPageRobot {
  CommentsPageRobot(this.tester) : _homePageRobot = HomePageRobot(tester);
  final WidgetTester tester;
  final HomePageRobot _homePageRobot;

  Future<void> pumpCommentsPageContents() async {
    await _homePageRobot.pumpHomePageContents();
    await _homePageRobot.tapCommentsBottomMenuTab();
  }
}
