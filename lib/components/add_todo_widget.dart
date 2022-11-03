import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../custom/custom_drop_down.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import '../custom/custom_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({
    Key? key,
    this.date,
  }) : super(key: key);

  final DateTime? date;

  @override
  _AddTodoWidgetState createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  DateTime? datePicked;
  TodoListRecord? todo;
  String? dropDownValue;
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          color: customTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xFFDBE2E7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Добавьте задачу',
                      style: customTheme.of(context).title2.override(
                            fontFamily: 'Nunito',
                            color: customTheme.of(context).primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Введите задачу',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: customTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                              prefixIcon: Icon(
                                Icons.create_rounded,
                                color: customTheme.of(context).primaryColor,
                                size: 16,
                              ),
                            ),
                            style: customTheme.of(context).bodyText1.override(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    customTheme.of(context).primaryBackground,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: customTheme.of(context).primaryColor,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (dropDownValue == 'Срочное')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: customTheme
                                                .of(context)
                                                .customColor3,
                                            size: 16,
                                          ),
                                        ),
                                      if (dropDownValue == 'Важное')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: customTheme
                                                .of(context)
                                                .primaryColor,
                                            size: 16,
                                          ),
                                        ),
                                      if (dropDownValue == 'Без приоритета')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircle,
                                            color: customTheme
                                                .of(context)
                                                .secondaryText,
                                            size: 16,
                                          ),
                                        ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 5),
                                      child: customDropDown(
                                        options: [
                                          'Срочное',
                                          'Важное',
                                          'Без приоритета'
                                        ],
                                        onChanged: (val) =>
                                            setState(() => dropDownValue = val),
                                        width: 180,
                                        height: 40,
                                        textStyle: customTheme
                                            .of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Nunito',
                                              color: customTheme
                                                  .of(context)
                                                  .primaryText,
                                              useGoogleFonts: false,
                                            ),
                                        hintText: 'Выберите приоритет',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color:
                                              customTheme.of(context).textFIcon,
                                          size: 25,
                                        ),
                                        fillColor: customTheme
                                            .of(context)
                                            .primaryBackground,
                                        elevation: 1,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        borderRadius: 16,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await DatePicker.showTimePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() => datePicked = date);
                                },
                                currentTime: datePicked!,
                                locale: LocaleType.values.firstWhere(
                                  (l) =>
                                      l.name ==
                                      customLocalizations
                                          .of(context)
                                          .languageCode,
                                  orElse: () => LocaleType.en,
                                ),
                              );
                            },
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'Hm',
                                datePicked,
                                locale: customLocalizations
                                    .of(context)
                                    .languageCode,
                              ),
                              'Выберите время',
                            ),
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              size: 16,
                            ),
                            options: FFButtonOptions(
                              height: 40,
                              color: customTheme.of(context).primaryBackground,
                              textStyle: customTheme
                                  .of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: customTheme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: customTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              final todoListCreateData =
                                  createTodoListRecordData(
                                todoName: textController!.text,
                                todoTime: datePicked,
                                priority: dropDownValue,
                                createdBy: currentUserReference,
                                createdAt: getCurrentTimestamp,
                                status: false,
                                uid: currentUserUid,
                                todoDate: widget.date,
                              );
                              var todoListRecordReference =
                                  TodoListRecord.collection.doc();
                              await todoListRecordReference
                                  .set(todoListCreateData);
                              todo = TodoListRecord.getDocumentFromData(
                                  todoListCreateData, todoListRecordReference);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Успешно создано',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color:
                                          customTheme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      customTheme.of(context).primaryBackground,
                                ),
                              );

                              setState(() {});
                            },
                            text: 'Создать',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: customTheme.of(context).primaryColor,
                              textStyle:
                                  customTheme.of(context).subtitle2.override(
                                        fontFamily: 'Nunito',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
