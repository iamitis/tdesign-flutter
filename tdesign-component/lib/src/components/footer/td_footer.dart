import 'package:flutter/material.dart';

import '../../../tdesign_flutter.dart';

/// 页脚控件
/// 支持显示文本（如版权信息）、链接、品牌logo
/// 如果对应属性不为空，显示顺序自上而下为链接、品牌logo、文本
/// 属性为text, links, logoUrl
class TDFooter extends StatelessWidget {
  const TDFooter({
    this.text,
    this.links,
    this.logoUrl,
    Key? key,
  }) : super(key: key);

  /// 版权信息
  final String? text;

  /// 链接列表
  final List<TdFooterLink>? links;

  /// 品牌logo
  final String? logoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          links == null || links!.isEmpty
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildLinks()),
          logoUrl == null
              ? Container()
              : TDImage(
                  imgUrl: logoUrl,
                  width: 200,
                  height: 100,
                  fit: BoxFit.contain,
                ),
          text == null
              ? Container()
              : TDText(text ?? '', textColor: const Color(0x42000000)),
        ],
      ),
    );
  }

  List<Widget> buildLinks() {
    assert(links != null);
    var count = 0;
    return links!.map((link) {
      if (count > 0) {
        ++count;
        return Row(children: [
          const TDText(' | ', textColor: Color(0x42000000)),
          TDLink(
            label: link.text ?? link.uri.toString(),
            uri: link.uri,
            type: TDLinkType.withUnderline,
            style: TDLinkStyle.primary,
          )
        ]);
      } else {
        ++count;
        return (TDLink(
          label: link.text ?? link.uri.toString(),
          uri: link.uri,
          type: TDLinkType.withUnderline,
          style: TDLinkStyle.primary,
        ));
      }
    }).toList();
  }
}

/// TDFooter中参数links列表中元素的类型
class TdFooterLink {
  const TdFooterLink({
    required this.uri,
    this.text,
  });

  /// 链接跳转的url
  final Uri uri;

  /// 链接显示的文本
  /// 如果为空，链接将显示为uri
  final String? text;
}
