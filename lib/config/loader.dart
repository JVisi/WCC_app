import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wccapp/config/core.dart';
import 'package:wccapp/config/lang/locals.dart';

class LoadingHandler<T> extends StatefulWidget {
  final Future<T> Function() future;
  final Widget Function(T data) succeeding;
  final Widget onError;
  final bool needReloadButton;

  LoadingHandler(
      {@required this.future, @required this.succeeding, this.onError,this.needReloadButton});

  @override
  LoadingHandlerState<T> createState() => LoadingHandlerState();
}

class LoadingHandlerState<T> extends State<LoadingHandler<T>> {
  Future<T> _future;
  bool needReloadButton;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = widget.future();
    needReloadButton=widget.needReloadButton;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return FutureBuilder<T>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) =>
            SnapshotManager<T>(
                snapshot: snapshot,
                onError: <T>(T error) {
                  if (widget.onError != null) {
                    return widget.onError;
                  }
                  return showErrorWidget(
                      error == null ? null : error.toString(), Icons.error,needReloadButton==null?false:true);
                },
                onSuccess: (T data) => widget.succeeding(data),
                onWait: showLoadingWidget(null, null, null)));
  }

  refresh() {
    setState(() {
      this._future = widget.future();
    });
  }

  Widget showErrorWidget(String name, IconData icon, bool needReloadBtn) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical),
            child: Icon(icon != null ? icon : Icons.warning,
                color: Colors.red, size: themeConfig().iconTheme.size),
          ),
          Text(
            name != null ? name : "An unknown error occured", ///Applocal
            style: themeConfig().textTheme.bodyText1,
          ),
          needReloadBtn?Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
            child: RaisedButton(
              child: Text(AppLocalizations.of(context).reload,
                style: themeConfig().textTheme.bodyText1,
              ),
              onPressed: refresh,
            ),
          ):Text(""),
          Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
          Spacer(
            flex: 3,
          )
        ],
      ),
    ));
  }

  Widget showLoadingWidget(String name, String desc, IconData icon) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Spacer(
          flex: 1,
        ),
        SpinKitWave(
          color: Colors.blue,
          size: SizeConfig.blockSizeVertical * 10,
        ),
        Icon(
          icon != null ? icon : Icons.hourglass_empty,
          size: themeConfig().iconTheme.size,
        ),
        Text(
          name != null ? name : AppLocalizations.of(context).loading,
          style: themeConfig().textTheme.bodyText1,
        ),
        Text(
          desc != null ? desc : "",
          style: themeConfig().textTheme.bodyText1,
        ),
        Spacer(
          flex: 2,
        )
      ],
    ));
  }
}

class SnapshotManager<T> extends StatelessWidget {
  final AsyncSnapshot<T> snapshot;
  final Widget Function<T>(T data) onError;
  final Widget onWait;
  final Widget Function(T data) onSuccess;

  SnapshotManager(
      {@required this.snapshot,
      @required this.onError,
      @required this.onSuccess,
      @required this.onWait});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (this.snapshot.connectionState == ConnectionState.waiting) return onWait;
    if (snapshot.hasData) {
      return this.onSuccess(snapshot.data);
    }
    return this.onError(snapshot.error);
  }
}
