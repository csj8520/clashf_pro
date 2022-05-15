import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:clash_for_flutter/widgets/card_head.dart';
import 'package:clash_for_flutter/widgets/card_view.dart';
import 'package:clash_for_flutter/controllers/controllers.dart';

class PageLog extends StatefulWidget {
  const PageLog({Key? key}) : super(key: key);

  @override
  State<PageLog> createState() => _PageLogState();
}

class _PageLogState extends State<PageLog> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CardHead(title: 'sidebar_logs'.tr),
      CardView(
        child: Obx(
          () => ListView.builder(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            itemBuilder: (context, index) {
              final it = controllers.service.logs[controllers.service.logs.length - index - 1];
              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: it.time).textColor(const Color(0xe69ca3af)),
                    TextSpan(text: '  [${it.type}] '),
                    TextSpan(text: it.msg),
                  ],
                ).fontSize(14).textColor(const Color(0xff73808f)),
              ).padding(top: 5);
            },
            itemCount: controllers.service.logs.length,
            controller: _scrollController,
            reverse: true,
          ).backgroundColor(const Color(0xfff3f6f9)).clipRRect(all: 4).padding(all: 15),
        ),
      ).expanded()
    ]).padding(top: 5, right: 20, bottom: 10);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
