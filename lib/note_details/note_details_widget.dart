import '../backend/backend.dart';
import '../custom/custom_icon_button.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteDetailsWidget extends StatefulWidget {
  const NoteDetailsWidget({
    Key? key,
    this.notesInfo,
  }) : super(key: key);

  final NotesRecord? notesInfo;

  @override
  _NoteDetailsWidgetState createState() => _NoteDetailsWidgetState();
}

class _NoteDetailsWidgetState extends State<NoteDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: customTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: customTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: customTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            'Назад',
                            maxLines: 1,
                            style: customTheme.of(context).title2.override(
                                  fontFamily: 'Nunito',
                                  color: customTheme.of(context).primaryText,
                                  fontSize: 16,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [],
              centerTitle: true,
              elevation: 0,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: customTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: customTheme.of(context).shadow,
                            offset: Offset(0, 0),
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: customTheme.of(context).googleButton,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.folder_rounded,
                                        color: customTheme
                                            .of(context)
                                            .primaryColor,
                                        size: 18,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: StreamBuilder<FolderRecord>(
                                            stream: FolderRecord.getDocument(
                                                widget.notesInfo!.folder!),
                                            builder: (context, snapshot) {
                                              // customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 35,
                                                    height: 35,
                                                    child: SpinKitThreeBounce(
                                                      color: customTheme
                                                          .of(context)
                                                          .primaryColor,
                                                      size: 35,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final textFolderRecord =
                                                  snapshot.data!;
                                              return Text(
                                                textFolderRecord.title!,
                                                style: customTheme
                                                    .of(context)
                                                    .bodyText1,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    'd/M/y',
                                    widget.notesInfo!.createdAt!,
                                    locale: customLocalizations
                                        .of(context)
                                        .languageCode,
                                  ),
                                  style: customTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.create_rounded,
                                    color: customTheme.of(context).primaryColor,
                                    size: 18,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        widget.notesInfo!.title!,
                                        style:
                                            customTheme.of(context).bodyText1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.description_rounded,
                                    color: customTheme.of(context).primaryColor,
                                    size: 18,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        widget.notesInfo!.description!,
                                        style:
                                            customTheme.of(context).bodyText1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
