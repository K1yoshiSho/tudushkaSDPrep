import '../backend/backend.dart';
import '../components/add_notes_widget.dart';
import '../components/empty_widget.dart';
import '../custom/custom_icon_button.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import '../custom/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({
    Key? key,
    this.folder,
  }) : super(key: key);

  final FolderRecord? folder;

  @override
  _NotesWidgetState createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  List<NotesRecord> simpleSearchResults = [];
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: customTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: AddNotesWidget(
                  folder: widget.folder,
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: customTheme.of(context).primaryColor,
        icon: Icon(
          Icons.add_circle_rounded,
          color: Colors.white,
        ),
        elevation: 0,
        label: Text(
          'Создать заметку',
          style: customTheme.of(context).bodyText1.override(
                fontFamily: 'Nunito',
                color: Colors.white,
                useGoogleFonts: false,
              ),
        ),
      ),
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: customTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: CustomIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: customTheme.of(context).primaryText,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  widget.folder!.title,
                  'Null',
                ),
                style: customTheme.of(context).title2.override(
                      fontFamily: 'Nunito',
                      color: customTheme.of(context).primaryText,
                      fontSize: 22,
                      useGoogleFonts: false,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Container(
                    width: double.infinity,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController',
                                Duration(milliseconds: 100),
                                () async {
                                  await queryNotesRecordOnce()
                                      .then(
                                        (records) => simpleSearchResults =
                                            TextSearch(
                                          records
                                              .map(
                                                (record) => TextSearchItem(
                                                    record, [record.title!]),
                                              )
                                              .toList(),
                                        )
                                                .search(textController!.text)
                                                .map((r) => r.object)
                                                .toList(),
                                      )
                                      .onError(
                                          (_, __) => simpleSearchResults = [])
                                      .whenComplete(() => setState(() {}));

                                  setState(() => FFAppState().showList = false);
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Найти заметку',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
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
                                filled: true,
                                fillColor:
                                    customTheme.of(context).primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: customTheme.of(context).textFIcon,
                                ),
                              ),
                              style: customTheme.of(context).bodyText1,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() => FFAppState().showList = true);
                              setState(() {
                                textController?.clear();
                              });
                            },
                            child: Icon(
                              Icons.cancel_rounded,
                              color: customTheme.of(context).textFIcon,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (FFAppState().showList)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: StreamBuilder<List<NotesRecord>>(
                      stream: queryNotesRecord(
                        queryBuilder: (notesRecord) => notesRecord
                            .where('folder',
                                isEqualTo: widget.folder!.reference)
                            .where('uid', isEqualTo: widget.folder!.uid)
                            .orderBy('created_at', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 35,
                              height: 35,
                              child: SpinKitThreeBounce(
                                color: customTheme.of(context).primaryColor,
                                size: 35,
                              ),
                            ),
                          );
                        }
                        List<NotesRecord> listViewNotesRecordList =
                            snapshot.data!;
                        if (listViewNotesRecordList.isEmpty) {
                          return Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: EmptyWidget(),
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewNotesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewNotesRecord =
                                listViewNotesRecordList[listViewIndex];
                            return Visibility(
                              visible: functions.showSearchResult(
                                  textController!.text,
                                  listViewNotesRecord.title),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed(
                                      'noteDetails',
                                      queryParams: {
                                        'notesInfo': serializeParam(
                                          listViewNotesRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'notesInfo': listViewNotesRecord,
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.bottomToTop,
                                          duration: Duration(milliseconds: 300),
                                        ),
                                      },
                                    );
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: customTheme
                                            .of(context)
                                            .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color:
                                                customTheme.of(context).shadow,
                                            offset: Offset(0, 0),
                                            spreadRadius: 1,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: customTheme
                                              .of(context)
                                              .googleButton,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.create_rounded,
                                                        color: customTheme
                                                            .of(context)
                                                            .primaryColor,
                                                        size: 18,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            listViewNotesRecord
                                                                .title!,
                                                            style: customTheme
                                                                .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_right_rounded,
                                                        color: customTheme
                                                            .of(context)
                                                            .primaryText,
                                                        size: 24,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .description_rounded,
                                                          color: customTheme
                                                              .of(context)
                                                              .primaryColor,
                                                          size: 18,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              listViewNotesRecord
                                                                  .description!,
                                                              maxLines: 3,
                                                              style: customTheme
                                                                  .of(context)
                                                                  .bodyText1,
                                                            ),
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
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
