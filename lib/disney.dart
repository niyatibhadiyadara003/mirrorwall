import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Disney extends StatefulWidget {
  const Disney({Key? key}) : super(key: key);

  @override
  State<Disney> createState() => _DisneyState();
}

class _DisneyState extends State<Disney> {
  final GlobalKey DisneyKey = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  String url = "";
  double progress = 0;

  List Bookmarks = [];

  InAppWebViewController? webViewController;
  late PullToRefreshController pullToRefreshController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  refreshController() async {
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.grey.shade700,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          await webViewController!.reload();
        } else if (Platform.isIOS) {
          await webViewController!.loadUrl(
            urlRequest: URLRequest(
              url: Uri.parse(
                "${await webViewController?.getUrl()}",
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    refreshController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Disney+ Hotstar"),
          backgroundColor: Colors.cyan,
        actions:[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.grey.shade700,
            ),
            onPressed: () async {
              await webViewController!.goBack();
            },
          ),
          const SizedBox(width: 10,),
          IconButton(
            icon: Icon(
              Icons.refresh_sharp,
              color: Colors.grey.shade700,
            ),
            onPressed: () async {
              if (Platform.isAndroid) {
                await webViewController!.reload();
              } else if (Platform.isIOS) {
                await webViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: Uri.parse(
                      "${await webViewController?.getUrl()}",
                    ),
                  ),
                );
              }
            },
          ),
          const SizedBox(width: 10,),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade700,
            ),
            onPressed: () async {
              await webViewController!.goForward();
            },
          ),
        ],),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.grey.shade700,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      // pullToRefreshController.endRefreshing();
                      (await pullToRefreshController.isRefreshing())
                          ? pullToRefreshController.endRefreshing()
                          : searchController.clear();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                onSubmitted: (val) async {
                  Uri uri = Uri.parse(val);
                  if (uri.scheme.isEmpty) {
                    uri = Uri.parse("https://www.google.com/search?q=" + val);
                  }
                  await webViewController!.loadUrl(
                    urlRequest: URLRequest(url: uri),
                  );
                },
              ),
            ),
            (progress < 1)
                ? LinearProgressIndicator(
              value: progress,
            )
                : Container(),
            Expanded(
              flex: 11,
              child: InAppWebView(
                key: DisneyKey,
                pullToRefreshController: pullToRefreshController,
                initialOptions: options,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                initialUrlRequest: URLRequest(
                  url: Uri.parse("https://www.hotstar.com/in"),
                ),
                onLoadStart: (controller, uri) {
                  setState(() {
                    searchController.text =
                        uri!.scheme.toString() + "://" + uri.host + uri.path;
                  });
                },
                onLoadStop: (controller, uri) {
                  pullToRefreshController.endRefreshing();
                  setState(() {
                    searchController.text =
                        uri!.scheme.toString() + "://" + uri.host + uri.path;
                  });
                },
                androidOnPermissionRequest:
                    (controller, origin, resources) async {
                  return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT);
                },
                onProgressChanged: (controller, val) {
                  if (val == 100) {
                    pullToRefreshController.endRefreshing();
                  }
                  setState(() {
                    progress = val / 100;
                  });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.bookmark_add,
                color: Colors.grey.shade700,
              ),
              onPressed: () async {
                Uri? uri = await webViewController!.getUrl();
                String MyURL = uri!.scheme.toString() +
                    "://" +
                    uri.host +
                    uri.path;

                setState(() {
                  Bookmarks.add(MyURL);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                    Text("Added Successfully in Bookmark .. !!"),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
            ),
            const SizedBox(width: 10,),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey.shade700,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(
                        child: Text("My BookMarks"),
                      ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: Bookmarks.map(
                              (e) => Padding(
                            padding: const EdgeInsets.all(12),
                            child: GestureDetector(
                              onTap: () async {
                                await webViewController!.loadUrl(
                                  urlRequest: URLRequest(
                                    url: Uri.parse(e),
                                  ),
                                );
                                Navigator.of(context).pop();
                              },
                              child: Text(e),
                            ),
                          ),
                        ).toList(),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(width: 10,),
          ],
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
