// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

/*
 * File: one_dialog.dart
 * File Created: Tuesday, 6th April 2021 3:51:49 pm
 * Author: Tân Hà
 * -----
 * Last Modified: Monday, 19th June 2023 15:09:45 pm
 * Modified By: Anh Quan
 */

import 'package:basegetxbloc/component/button/one_button.dart';
import 'package:basegetxbloc/constant/one_colors.dart';
import 'package:basegetxbloc/constant/one_icons.dart';
import 'package:basegetxbloc/constant/one_images.dart';
import 'package:basegetxbloc/constant/one_theme.dart';
import 'package:basegetxbloc/shared/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';

enum OneDialogAlertStyle {
  none,
  success,
  failure,
}

class OneDialog extends StatefulWidget {
  const OneDialog(
      {Key? key,
      this.alertStyle = OneDialogAlertStyle.none,
      this.title = 'Thông báo',
      this.msg,
      this.okText = 'Đóng',
      this.cancelText,
      this.okHandler,
      this.cancelHandler,
      this.closeHandler,
      this.content,
      this.titleTextAlign = TextAlign.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.msgTextAlign = TextAlign.center,
      this.barrierDismissible = false,
      this.okBtnAutoPopWhenOnTap = true,
      this.cancelBtnAutoPopWhenOnTap = true,
      this.isBtnCanclePrimary = false,
      this.isShowBottomSheet,
      this.alertIcon,
      this.titleStyle,
      this.messageStyle,
      this.cancelTextStyle,
      this.cancelBgColor,
      this.cancelColor,
      this.enableDrag = false})
      : super(key: key);

  final OneDialogAlertStyle alertStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final String title;
  final String? msg;
  final String okText;
  final String? cancelText;
  final VoidCallback? okHandler;
  final VoidCallback? cancelHandler;
  final VoidCallback? closeHandler;
  final Widget? content;
  final TextAlign titleTextAlign;
  final TextAlign msgTextAlign;
  final bool barrierDismissible;
  final bool okBtnAutoPopWhenOnTap;
  final bool cancelBtnAutoPopWhenOnTap;
  final bool isBtnCanclePrimary;
  final bool? isShowBottomSheet;
  final String? alertIcon;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final TextStyle? cancelTextStyle;
  final Color? cancelBgColor;
  final Color? cancelColor;
  final bool? enableDrag;

  @override
  _OneDialogState createState() => _OneDialogState();

  static Future<void> show(
    BuildContext context, {
    OneDialogAlertStyle alertStyle = OneDialogAlertStyle.none,
    String title = 'Thông báo',
    String? msg,
    String okText = 'Đóng',
    String? cancelText,
    VoidCallback? okHandler,
    VoidCallback? cancelHandler,
    VoidCallback? closeHandler,
    Widget? content,
    TextAlign titleTextAlign = TextAlign.center,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextAlign msgTextAlign = TextAlign.center,
    bool barrierDismissible = false,
    bool okBtnAutoPopWhenOnTap = true,
    bool cancelBtnAutoPopWhenOnTap = true,
    bool isBtnCanclePrimary = false,
    bool isShowBottomSheet = true,
    bool enableDrag = false,
    String? alertIcon,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    TextStyle? cancelTextStyle,
    Color? cancelBgColor,
    Color? cancelColor,
  }) {
    if (isShowBottomSheet == true && isTablet(context) == false) {
      return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        enableDrag: enableDrag,
        builder: (context) {
          return OneDialog(
            alertStyle: alertStyle,
            title: title,
            msg: msg,
            okText: okText,
            cancelText: cancelText,
            okHandler: okHandler,
            cancelHandler: cancelHandler,
            closeHandler: closeHandler,
            content: content,
            titleTextAlign: titleTextAlign,
            crossAxisAlignment: crossAxisAlignment,
            msgTextAlign: msgTextAlign,
            barrierDismissible: barrierDismissible,
            okBtnAutoPopWhenOnTap: okBtnAutoPopWhenOnTap,
            cancelBtnAutoPopWhenOnTap: cancelBtnAutoPopWhenOnTap,
            isShowBottomSheet: isShowBottomSheet,
            alertIcon: alertIcon,
            titleStyle: titleStyle,
            messageStyle: messageStyle,
            cancelTextStyle: cancelTextStyle,
            cancelColor: cancelColor,
          );
        },
      );
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (context) {
          return OneDialog(
            alertStyle: alertStyle,
            title: title,
            msg: msg,
            okText: okText,
            cancelText: cancelText,
            okHandler: okHandler,
            cancelHandler: cancelHandler,
            closeHandler: closeHandler,
            content: content,
            titleTextAlign: titleTextAlign,
            crossAxisAlignment: crossAxisAlignment,
            msgTextAlign: msgTextAlign,
            barrierDismissible: barrierDismissible,
            okBtnAutoPopWhenOnTap: okBtnAutoPopWhenOnTap,
            cancelBtnAutoPopWhenOnTap: cancelBtnAutoPopWhenOnTap,
            isShowBottomSheet: isTablet(context) ? false : isShowBottomSheet,
            alertIcon: alertIcon,
            cancelTextStyle: cancelTextStyle,
            cancelBgColor: cancelBgColor,
            cancelColor: cancelColor,
          );
        },
      );
    }
  }
}

class _OneDialogState extends State<OneDialog> {
  String? get _alertImgUrl {
    switch (widget.alertStyle) {
      case OneDialogAlertStyle.success:
        return OneImages.img_succes;
      case OneDialogAlertStyle.failure:
        return OneImages.img_failure;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(widget.barrierDismissible),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: widget.isShowBottomSheet == true
              ? const BorderRadius.vertical(
                  top: Radius.circular(16.0),
                )
              : BorderRadius.circular(16.0),
        ),
        insetPadding: widget.isShowBottomSheet == true ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        alignment: widget.isShowBottomSheet == true ? Alignment.bottomCenter : Alignment.center,
        elevation: 2,
        child: KeyboardDismissOnTap(
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return OrientationBuilder(builder: (_, orientation) {
                    return Container(
                      width: null,
                      constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.8),
                      margin: const EdgeInsets.only(top: 8, bottom: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.isShowBottomSheet == true && widget.enableDrag == true
                              ? Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  height: 5,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.7),
                                    borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                                  ),
                                )
                              : const SizedBox(),
                          Flexible(
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: widget.crossAxisAlignment,
                                  children: [
                                    widget.isShowBottomSheet == true ? _buildTitle(context) : const SizedBox(),
                                    widget.isShowBottomSheet == true
                                        ? const Divider(height: 10)
                                        : const SizedBox(
                                            height: 10,
                                          ),
                                    _buildAlertImg(context, widget.alertIcon),
                                    widget.isShowBottomSheet == true ? const SizedBox() : _buildTitle(context),
                                    const SizedBox(height: 5),
                                    _buildBody(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildBtns(),
                          widget.isShowBottomSheet == true
                              ? SizedBox(height: MediaQuery.of(context).padding.bottom > 0 ? MediaQuery.of(context).padding.bottom : 30)
                              : const SizedBox(),
                        ],
                      ),
                    );
                  });
                },
              ),
              Positioned(
                top: 10,
                right: 10,
                child: _buildBtnClose(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertImg(context, String? alertIcon) {
    if (_alertImgUrl == null && alertIcon == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
      child: Center(
        child: Image.asset(
          _alertImgUrl ?? alertIcon!,
        ),
      ),
    );
  }

  Widget _buildTitle(context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 5,
        bottom: 12,
      ),
      child: SelectableText(
        widget.title,
        style: widget.titleStyle ?? OneTheme.of(context).header,
        textAlign: widget.titleTextAlign,
      ),
    );
  }

  Widget _buildBody() {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.msg != null)
              SelectableText(
                widget.msg!,
                style: widget.messageStyle ?? OneTheme.of(context).body1.copyWith(color: OneColors.textGrey2, fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: widget.msgTextAlign,
              ),
            widget.content ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildBtns() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          if (widget.cancelText != null || widget.cancelHandler != null) ...[
            Expanded(
              child: OneButton(
                padding: const EdgeInsets.symmetric(vertical: 11),
                background: widget.cancelBgColor ?? OneColors.bgRed,
                color: widget.cancelColor ?? OneColors.white,
                label: widget.cancelText ?? 'Cancel',
                textStyle: widget.cancelTextStyle ?? OneTheme.of(context).body1.copyWith(fontSize: 15, fontWeight: FontWeight.w500, color: OneColors.redLight),
                controller: OneButtonController(state: widget.isBtnCanclePrimary ? OneButtonState.primary : OneButtonState.outline),
                onPressed: () {
                  if (widget.cancelBtnAutoPopWhenOnTap) Navigator.pop(context, false);
                  if (widget.cancelHandler != null) {
                    widget.cancelHandler!();
                  }
                },
              ),
            ),
            const SizedBox(width: 20)
          ],
          Expanded(
            child: Padding(
              padding: (widget.cancelText != null || widget.cancelHandler != null)
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: 70,
                    ),
              child: OneButton(
                label: widget.okText,
                textStyle: OneTheme.of(context).body1.copyWith(fontSize: 15, fontWeight: FontWeight.w500, color: OneColors.white),
                onPressed: () {
                  if (widget.okBtnAutoPopWhenOnTap) Navigator.pop(context, true);
                  if (widget.okHandler != null) {
                    widget.okHandler!();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBtnClose(BuildContext context) {
    if (widget.closeHandler != null) {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(OneIcons.ic_cancel, color: OneColors.textGrey2),
        ),
        onTap: () {
          Navigator.of(context).pop();
          widget.closeHandler!();
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
