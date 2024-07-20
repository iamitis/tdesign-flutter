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
    this.logo,
    Key? key,
  }) : super(key: key);

  /// 版权信息
  final String? text;

  /// 链接列表
  final List<TDFooterLink>? links;

  /// 品牌logo
  final TDFooterLogo? logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLinks(context),
          _buildLogo(context),
          _buildText(context),
        ],
      ),
    );
  }

  Widget _buildLinks(BuildContext context) {
    if (links != null && links!.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildLinkItem(context),
      );
    }
    return Container();
  }

  List<Widget> _buildLinkItem(BuildContext context) {
    var firstPlace = true;
    return links!.map((link) {
      if (firstPlace) {
        firstPlace = false;
        return TDLink(
          label: link.text ?? link.uri.toString(),
          uri: link.uri,
          type: TDLinkType.withUnderline,
          style: TDLinkStyle.primary,
        );
      } else {
        return Row(
          children: [
            SizedBox(
                height: 16,
                child: VerticalDivider(
                  color: TDTheme.of(context).grayColor5,
                )),
            TDLink(
              label: link.text ?? link.uri.toString(),
              uri: link.uri,
              type: TDLinkType.withUnderline,
              style: TDLinkStyle.primary,
            ),
          ],
        );
      }
    }).toList();
  }

  Widget _buildLogo(BuildContext context) {
    return logo == null
        ? Container()
        : TDImage(
            imgUrl: logo!.isLocal ? null : logo!.logoUrl,
            assetUrl: logo!.isLocal ? logo!.logoUrl : null,
            width: logo!.width ?? 150,
            height: logo!.height ?? 75,
            fit: BoxFit.contain,
          );
  }

  Widget _buildText(BuildContext context) {
    return text == null
        ? Container()
        : TDText(text ?? '', textColor: TDTheme.of(context).fontGyColor3);
  }
}

/// TDFooter中参数links列表中元素的类型
class TDFooterLink {
  const TDFooterLink({
    required this.uri,
    this.text,
  });

  /// 链接跳转的url
  final Uri uri;

  /// 链接显示的文本
  /// 如果为空，链接将显示为uri
  final String? text;
}

class TDFooterLogo {
  const TDFooterLogo({
    required this.logoUrl,
    required this.isLocal,
    this.width,
    this.height,
  });

  /// Logo链接
  final String logoUrl;

  /// 自定义宽
  final double? width;

  /// 自定义高
  final double? height;

  /// 是否为本地图片
  final bool isLocal;
}
