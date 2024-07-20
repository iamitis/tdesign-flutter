import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../annotation/demo.dart';
import '../../base/example_widget.dart';

class TDFooterPage extends StatelessWidget {
  const TDFooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(context),
        desc: '可以折叠/展开的内容区域。',
        exampleCodeGroup: 'footer',
        backgroundColor: TDTheme.of(context).whiteColor1,
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(desc: '基础页脚', builder: _buildBasic),
            ExampleItem(desc: '基础加链接页脚', builder: _buildBasicWithLink),
            ExampleItem(builder: _buildBasicWithMultiLink),
            ExampleItem(desc: '品牌页脚', builder: _buildWithLogo),
          ]),
        ]);
  }

  @Demo(group: 'footer')
  Widget _buildBasic(BuildContext context) {
    return const TDFooter(
      text: 'Copyright @ 2019-2023 TDesign.All Rights Reserved.',
    );
  }

  @Demo(group: 'footer')
  Widget _buildBasicWithLink(BuildContext context) {
    var link = TDFooterLink(
        uri: Uri(
            scheme: 'https',
            host: 'tdesign.tencent.com',
            path: 'flutter/components'),
        text: '底部链接');
    return TDFooter(
      text: 'Copyright @ 2019-2023 TDesign.All Rights Reserved.',
      links: [link],
    );
  }

  @Demo(group: 'footer')
  Widget _buildBasicWithMultiLink(BuildContext context) {
    var link = TDFooterLink(
        uri: Uri(
            scheme: 'https',
            host: 'tdesign.tencent.com',
            path: 'flutter/components'),
        text: '底部链接');
    return TDFooter(
      text: 'Copyright @ 2019-2023 TDesign.All Rights Reserved.',
      links: [link, link],
    );
  }

  @Demo(group: 'footer')
  Widget _buildWithLogo(BuildContext context) {
    var logo = const TDFooterLogo(
      logoUrl: 'assets/img/td_brand.png',
      isLocal: true,
      width: 150,
      height: 75,
    );
    return TDFooter(
      logo: logo,
    );
  }
}
