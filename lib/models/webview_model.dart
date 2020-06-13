import 'dart:collection';
import 'package:collection/collection.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewModel extends ChangeNotifier {

  int _tabIndex;
  String _url;
  String _title;
  Favicon _favicon;
  double _progress;
  bool _loaded;
  bool _isDesktopMode;
  bool _isIncognitoMode;
  List<Widget> _javaScriptConsoleResults;
  List<String> _javaScriptConsoleHistory;
  List<LoadedResource> _loadedResources;
  InAppWebViewGroupOptions options;
  InAppWebViewController webViewController;

  WebViewModel({
    tabIndex,
    url,
    title,
    favicon,
    progress = 0.0,
    loaded = false,
    isDesktopMode = false,
    isIncognitoMode = false,
    javaScriptConsoleResults,
    javaScriptConsoleHistory,
    loadedResources,
    this.options,
    this.webViewController,
  }) {
    _url = url;
    _favicon = favicon;
    _progress = progress;
    _loaded = loaded;
    _isDesktopMode = isDesktopMode;
    _isIncognitoMode = isIncognitoMode;
    _javaScriptConsoleResults = javaScriptConsoleResults ?? [];
    _javaScriptConsoleHistory = javaScriptConsoleHistory ?? [];
    _loadedResources = loadedResources ?? [];
    options = options ?? InAppWebViewGroupOptions();
  }

  int get tabIndex => _tabIndex;

  set tabIndex(int value) {
    if (value != _tabIndex) {
      _tabIndex = value;
      notifyListeners();
    }
  }

  String get url => _url;

  set url(String value) {
    if (value != _url) {
      _url = value;
      notifyListeners();
    }
  }

  String get title => _title;

  set title(String value) {
    if (value != _title) {
      _title = value;
      notifyListeners();
    }
  }

  Favicon get favicon => _favicon;

  set favicon(Favicon value) {
    if (value != _favicon) {
      _favicon = value;
      notifyListeners();
    }
  }

  double get progress => _progress;

  set progress(double value) {
    if (value != _progress) {
      _progress = value;
      notifyListeners();
    }
  }

  bool get loaded => _loaded;

  set loaded(bool value) {
    if (value != _loaded) {
      _loaded = value;
      notifyListeners();
    }
  }

  bool get isDesktopMode => _isDesktopMode;

  set isDesktopMode(bool value) {
    if (value != _isDesktopMode) {
      _isDesktopMode = value;
      notifyListeners();
    }
  }

  bool get isIncognitoMode => _isIncognitoMode;

  set isIncognitoMode(bool value) {
    if (value != _isIncognitoMode) {
      _isIncognitoMode = value;
      notifyListeners();
    }
  }

  UnmodifiableListView<Widget> get javaScriptConsoleResults =>
      UnmodifiableListView(_javaScriptConsoleResults);

  setJavaScriptConsoleResults(List<Widget> value) {
    if (!IterableEquality().equals(value, _javaScriptConsoleResults)) {
      _javaScriptConsoleResults = value;
      notifyListeners();
    }
  }

  void addJavaScriptConsoleResults(Widget value) {
    _javaScriptConsoleResults.add(value);
    notifyListeners();
  }

  UnmodifiableListView<String> get javaScriptConsoleHistory =>
      UnmodifiableListView(_javaScriptConsoleHistory);

  setJavaScriptConsoleHistory(List<String> value) {
    if (!IterableEquality().equals(value, _javaScriptConsoleHistory)) {
      _javaScriptConsoleHistory = value;
      notifyListeners();
    }
  }

  void addJavaScriptConsoleHistory(String value) {
    _javaScriptConsoleHistory.add(value);
    notifyListeners();
  }

  UnmodifiableListView<LoadedResource> get loadedResources =>
      UnmodifiableListView(_loadedResources);

  setLoadedResources(List<LoadedResource> value) {
    if (!IterableEquality().equals(value, _loadedResources)) {
      _loadedResources = value;
      notifyListeners();
    }
  }

  void addLoadedResources(LoadedResource value) {
    _loadedResources.add(value);
    notifyListeners();
  }

  void updateWithValue(WebViewModel webViewModel) {
    tabIndex = webViewModel.tabIndex;
    url = webViewModel.url;
    title = webViewModel.title;
    favicon = webViewModel.favicon;
    progress = webViewModel.progress;
    loaded = webViewModel.loaded;
    isDesktopMode = webViewModel.isDesktopMode;
    isIncognitoMode = webViewModel.isIncognitoMode;
    setJavaScriptConsoleResults(webViewModel._javaScriptConsoleResults.toList());
    setJavaScriptConsoleHistory(webViewModel._javaScriptConsoleHistory.toList());
    setLoadedResources(webViewModel._loadedResources.toList());
    options = webViewModel.options;
    webViewController = webViewModel.webViewController;
  }
}