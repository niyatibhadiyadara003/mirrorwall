/*import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  // }

  runApp(MaterialApp(
      home: new MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
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
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Official InAppWebView website")),
        body: SafeArea(
            child: Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search)
                ),
                controller: urlController,
                keyboardType: TextInputType.url,
                onSubmitted: (value) {
                  var url = Uri.parse(value);
                  if (url.scheme.isEmpty) {
                    url = Uri.parse("https://www.google.com/search?q=" + value);
                  }
                  webViewController?.loadUrl(
                      urlRequest: URLRequest(url: url));
                },
              ),
              Expanded(
                child: Stack(
                  children: [
                    InAppWebView(
                      key: webViewKey,
                      initialUrlRequest:
                      URLRequest(url: Uri.parse("https://inappwebview.dev/")),
                      initialOptions: options,
                      pullToRefreshController: pullToRefreshController,
                      onWebViewCreated: (controller) {
                        webViewController = controller;
                      },
                      onLoadStart: (controller, url) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      androidOnPermissionRequest: (controller, origin, resources) async {
                        return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT);
                      },
                      onLoadStop: (controller, url) async {
                        pullToRefreshController.endRefreshing();
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onLoadError: (controller, url, code, message) {
                        pullToRefreshController.endRefreshing();
                      },
                      onProgressChanged: (controller, progress) {
                        if (progress == 100) {
                          pullToRefreshController.endRefreshing();
                        }
                        setState(() {
                          this.progress = progress / 100;
                          urlController.text = this.url;
                        });
                      },
                      onUpdateVisitedHistory: (controller, url, androidIsReload) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        print(consoleMessage);
                      },
                    ),
                    progress < 1.0
                        ? LinearProgressIndicator(value: progress)
                        : Container(),
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () {
                      webViewController?.goBack();
                    },
                  ),
                  ElevatedButton(
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      webViewController?.goForward();
                    },
                  ),
                  ElevatedButton(
                    child: Icon(Icons.refresh),
                    onPressed: () {
                      webViewController?.reload();
                    },
                  ),
                ],
              ),
            ]))
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:mirrorwall/prime.dart';
import 'package:mirrorwall/sony.dart';
import 'package:mirrorwall/tutorialpoint.dart';
import 'package:mirrorwall/w3school.dart';
import 'package:mirrorwall/wikipedia.dart';

import 'disney.dart';
import 'javapoint.dart';
import 'netflix.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => const Homepage(),
        "mainpage":(context)=>MainPage(),
        "mainpage2":(context)=>MainPage2(),
        "Netflix": (context) => const Netflixpage(),
        "Disney": (context) => const Disney(),
        "AmazonPrime": (context) => const Primepage(),
        "SonyLIV": (context) => const SonyLiv(),
        "Wikipedia": (context) => const Wikipedia(),
        "TutorialPoint": (context) => const TutorialPoint(),
        "JavaPoint": (context) => const JavaPoint(),
        "W3Schools": (context) => const W3School(),

      },
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "In App Webview",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed('mainpage');
            }, child: Text("OTT Websites")),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamed('mainpage2');
            }, child: Text("Education Websites"))
          ],
        ),
      ),
    );
  }
}



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OTT Websites",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('Netflix');
              },
              child:ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("data:image/png;base64,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"),
                  radius: 50,
                ),
                title: Text("Netflix"),
                subtitle: Text("Netflix is a streaminng service that offers a wide variety of award wining tv shows,movies,anime, documentaries and more on thousands of ..."),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('Disney');
              },
              child:ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                  radius: 50,
                ),
                title: Text("Disney + Hostar"),
                subtitle: Text("Hotstar is a streaminng service that offers a wide variety of award wining tv shows,movies,anime, documentaries and more on thousands of ..."),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('AmazonPrime');
              },
              child:ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                  radius: 50,
                ),
                title: Text("AmazonPrime"),
                subtitle: Text("AmazonPrime is a streaminng service that offers a wide variety of award wining tv shows,movies,anime, documentaries and more on thousands of ..."),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('SonyLIV');
              },
              child:ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                  radius: 50,
                ),
                title: Text("SonyLIV"),
                subtitle: Text("SonyLIV is a streaminng service that offers a wide variety of award wining tv shows,movies,anime, documentaries and more on thousands of ..."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class MainPage2 extends StatefulWidget {
  const MainPage2({Key? key}) : super(key: key);

  @override
  State<MainPage2> createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Education Websites",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('Wikipedia');
              },
              child:ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("data:image/jpeg;base64,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",),
                  radius: 50,
                ),
                title: Text("Wikipedia"),
                subtitle: Text("Wikipedia is a free online encyclopedia,created and edited by volunteers around the world ..."),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('TutorialPoint');
              },
              child:ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBQWERgUFhYYGBQaGBgYGhIaHBoZHBgYGBkaHBkYGRgcIy4lHB4uIRgYJjonKy8xNTU1GiRITjszPy40NTQBDAwMEA8QHhISHjcnJCU/NDQ/ODcxND80ND02NTE0NDQ/NTYxMTQ3NDE/NDQ1NDQxMTExNDQxNDQ0NDQ0NDQ2NP/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABQMEBgcIAQL/xABEEAABAwIDBAYIBAQDCAMAAAABAAIDBBEGITEFEkFRByIyYXGxEyNCUoGRocFictHhFDNDwhUksjQ1ZHN0o7O0JWOS/8QAGQEBAQEBAQEAAAAAAAAAAAAAAAEEAwIF/8QAKBEBAAICAQMDAgcAAAAAAAAAAAECAxEEITFREjJBcYETIyQzYZGx/9oADAMBAAIRAxEAPwDcyIiAiIgIiICIiAiIgIiICIoPFGI4aGAyyG5NxHGO1I73WjlxJ0AQTiLEcD4yjr4yDZlQwdeK+o99l9W/UFZcgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIig8UYjhoYDLKbk5RxDtSOt2W/c6AIPMUYjhooDLKbk3DIx2pH+637nQBc97f23PWVBnmddxyawdljb5MYPvqSm39uTVlQZ5nXccmsF91jb5MYPvqStn9G+APR7tXVN9Zk6OA/0+T3ji/kPZ8dCtU0081NOHtLo543crOa4cHNPdqDqCt9YGxlHXxbrrMqWDrxcxpvt5tP0Vj0g4HbWMM0IDapoy4CVo0Y7keTvhpppOnnmpqgOYXRTxPPCzmuGrXNOo5g5EIOqEWI4GxlHXxWNmVLB14r6jTfZzafosuRBERAREQEREBERAREQEREBERAREQEREBERARFB4oxHDQ05llNycmRjtSOtfdby7zoAg8xPiKGhgMspuTkyMdqR9uy3l3nQBc94g25NWVDp5nXccmsF91jL5MYPvqSmINuTVk7p5nXccmsHZYzgxg5d+pK2d0b4B9Hu1lU31uTo4Hf0+T3j3+Q4eOhXvRvgHc3ayqb6zJ0UDv6fJ7x7+lh7PjpsStrN3qt7Xl+6VtZu9Vva8v3USSiJGhrfZcfB32KxbpBwO2sYZoQG1bR4CUDRjjwPJ3w00mFI0NZ7Lj4O+xQc1U881NUB7C6KeN54Wc1wyLXA6jgQciFvrA2Mo66KxsypYBvxX1Gm+3m0/RWPSBgZtYwzwgNq2jXQSgaMdyPJ3DwWkqaeamnD2F0U8byNLOa4ZFrgdRwIORRXVKLEcDYyjr4rGzKhgG/FzGm+3m0/RZciCIiAiIgIiICIiAiIgIiICIiAiIgIig8T4ihoYDLKbk5RxjtSPtk1v3OgCBifEUNFAZZTcnJkY7Uj7dlv3OgC56xBtuasqHTzOu45NYOyxl8mMHLv1JTEG3JqyodPM67jkxg7LGXyYwcu/UlbO6OMAej3ayqb6zJ0UDv6fJ7x7/IcPHQp0b4B3N2sqm+sydFA7+nye8e/yHDx02LW1m71W9ry/dK2s3eq3teX7qJJRAlERVHi9REEjQ1vsu+B+xWLdIGBmVjTPCA2raNdBKBoxx4Hk77KYUjQ1ujXHwd9iormqnnmpqgOYXRTxvI5Oa4ZFrgdRwIORW+sDYyjrorGzKhoHpIuY99nNp+nnY4/wM2sb6aENbVtGpyEoGjHngRwd9lE7P2GzZcTSN2SvkHWlIuI28WsB0BOV9T4Cy82tFY3LxkvWlZtPw2gi1tTbarHvaxspLiRbJls+eWnH4KSxBt+VjxFG/NoAe8Bty62Y0sLeZ7lzjPGt6Z45dZrNtTqGbr1QGFXzOhMkzy7ePVBAyaL55Aa+QCn11rO420Ut6qxbWtvURFXsREQEREBERAREQERQeKMRQ0MBllNybiOMdqR9smt+50AQMT4ihoYDLKbk3EcY7Uj7ZNb9zoAuesQbcmrKh08xu45MYOyxl8mMH31JXuINuTVlQ6eY3ccmRjssZfJjB99SVszo4wD6PdrKpvrMnRQOH8vk949/k3h46FOjjAPo92sqm+sydFA7+nye8e/ybw8dNi1tXu9Udry/dK2s3eq3teX7rHqnaTGP3HkgkB28RcZ31PwUmYju8WtEdbTpeEqz2rtFlPC+aQ2YwXPMng0DiScldMeCLggjmMwsD6V3yegiAv6IvO/y3gBuX+q9LDG9p9IFbJITG4Qs4MaGuNvxOcDc+AUjhvpCla8MqiHscQPTAAOZfi4DJzflZYAvT9FHp0cDxGnNeqJws5xoKYvvv8AoWXvreyllXkRFbV9UGRvfcXAyH4j2Rb6/AqTMRG5S1orEzPwrnE8Ud2uLnOGXVF7EeySbZrH31UFRPcxzPe9waOsGhrdAABwAufmoEu5nNZHhCku90psCAWsJ03yNTzsLfNYYyWyWiHy4zXzXis619H1JWU9LUOEMbnvaLFznZA8QBa9+F/FZHsGYTRGV0LGXcbWAO8BkSTbnf5Kwiwew3Mkj3OOZLbNzOp4lYHjPHz43ikoS6JsJDXSlvWc5nsBrhk24zJ7XhmtGOtonr0jw14MeSJmbRER4bla0AWC+liWB8YR18VjZtQwesivrw32X1afpoVlq7NYiIgIiICIiAiIgIig8T4ihooDLKczkyMdqR9rhrR5nQBAxPiKGipzLKbk5MjHakfa4a0eZ0AXPeINuT1lQZ5nXccmRi+6xl8mMH31JTEG3Z6yczzOu45MjF91jL5MYPvqStmdG+AdzdrKpvXydFA4djiHvHv8hw8dCnRvgHc3ayqb18nRQOHY4h7x7/IcPHTY1bWbo3W9ry/dK2s3eq3teX7qJJRGvqvGclPtWaCWz6f0rW3Paj3mMO8DxaCSSDzOfBS+JP5w/I3zK1zjf/elT/zG/wDjjWxcRfzW/kb91x5HsZOb+191rQVb2PG6ciQC3gbm2iyXbey2VNO+B/ZcMnDVrhm1w7wVh6vaXakrNHXb7rsx+oWfDmivSzHxuTGPdbb1/jBNrYOrIH29GZGX6skYLgR3tGbT3FSWGsBzSva+ob6OAWJYe2/8Ib7I5krZNBtlj+qeo/kTkfAqTW2tq2jcPqUyVtG6zt8taAABkAAAOAAFgFF1222Mu1vXd3dkeJ4/BR23NoPL3Rg7rGmxtq7x7u5Q4WbLnmJ9NWHPzJiZrT+17U7Vlfq/dHut6o/Ur6hq42Rhm5vuuXHeJDC46XAzdYd9syvaXY8r87brebsvpqrKoi3HuYTfdJF/BcJm8dbfPlkmctY9Vvnymdk7Ue6VrA1jGm9wxobwPELH8Q41kNcylgIaxs0bJJNXPJkYHtbfst1bzOeikth/7Qz4/wCkrXlV/vY/9a3/ANgLVgmZr1fQ4UzakzPl0NR1me67nYH7FYr0g4GbWMM0IDato8BKBoxx4Hk74aaTLtT4lSFDW+y4+DvsV3bHNVNUTU04ewuinjceFnNcMi1zTw4EHULfeCMYR18VjZlQwD0kV9fxsvq0/TQqP6QcDNrGGaEBtW0eAlA0Y48Dyd8NNNKU1RPTTh7C+KeNx4Wc1wyLXA6jgQciEV1QixLA+MI6+KxsyoYB6SL+9l9Wn6aFZaiCIiAiIgIioVL3NY4tbvuAJay4G8QMm3OQugi8TYghooDLIbnRkY7T3Wya3u5nQBc+Yg2xPWVDp5jdxyawX3WMvkxg5d+pKltv7Rlqql75zaRpLfQm49EAewGnMffVZX0ZbDpnyulkIdMwgsgIyAy9Zn2iDl3fJFXPRxgDc3ayqb18nRQOHY4h7x7/ACHDx02NW1e71W9ry/dVqp7mtu0fHl3qJLURSN15ZVdxN1VGjMbMP+KVP/MZ/wCNi2JiJvrW/kb5lYji6lvtGc/jb/oYs627FeQfkb91wzxurNzI3jY+1hJA5kBSdVsKVgu2zx3a/Ir4ZD1h4jzWZhq4YcVbRO2Pj8et4n1NeFh5KZ2TtV7SGPu5psAeLeXiFPV2y2SZkWf741+PNQR2e9kjQ4e0LOGhzV/DtjtuOy/g5MN4ms9Fjtlv+Yf+b7K+wzC0veSAS0NsTwuXXt8k2rF69/5leYdjs5/g3zcpWv5v3THX9R90xZYVtJvrn/nKzrdWJV8XrX/mK7cmN1hp5sbrH1UNiN/zDPE/6SteVTD/AIsf+tb/AOwFs/ZEXr2fHyKwiopf/kyf+KB/7wTjxqq8KNUn6ttuGZ8SvLKs5mZ8SvNxaGte0VZ7Lvg77FYr0g4FbWMM8IDato8BK0aNefeHB3wOWk7uKToXuLbHQaO59yiuZaaSemnD2F0U8bjws5rhkWuB1HAg5ELfWCMXR10ViAyoYB6SLh+dl9WH6aKG6T9h0zoxUFwZUZNAA/nDkQOIHtcOPC2sqaZ1PI2Vj9yRpu1w18LcQdLcUV0kii9g1kstMySWMxyObdzPI21FxnY5i6lEQREQEREGCdIOBm1jPTwgNq2DI6CUDRjjwPJ3DwWmaXadTTS9VzmSxutuuGbHDUEHy4rqBYL0g4GbWMM0IDato8BK0aMceB5O4eCC+wPjGOvisbMqGjrxcxpvtvq0/RTtTT26w04jkuZ6aonpqgPYXRTxuIzyc1wyLXDiOY0IW+8D4xjrorGzKhgG/Fz4b7ebT9EEoAELF91tHu9ZunEcv2VmJHDiqjAMS0t62U29tv8AoYst2vFeQflH3WtsW4gmZtKdo3C1r2gAt/Aw6jxWxdr1T2uDvR7zN0XcL5HPXkuWX2uPJ9i2bFmCsgp6pj8gbHkcj+6xZu2WcWH4EKo3bEXJ4+A/VZ6ZIr2Y8WatPllu6vHxAixFxr8lC0eI4smvLre8Rp4qbFQwi98ua1VvW8dG+mSl46Sx/aEV5X+KutiR2c/wb5lWu0NoxCV4JNweRVKPbcbAd0uztnu8r/qs0WrW25lii1aZJtM+U9PUMZqc+QzKgahm89zraklUHbXi5PPwH6qm7bLODHfEgKXyxZMuet+8pHZkVpW/HyKxSal/z5P/ABAP/cCyfZVY98jXCIhmd3k5acOa15WYim/xPcAYG/xTWaXNvTBup42XfD7Wri+3o3OWZrwtVu+V1znxKrUdMXG57I+vcF2d1xTU+9n7PPn3K1xNiKChpzLIc9GRDtPdwa3u5nQJiXEMNDTmWT8rIh2nutk1o8zoFz3iDbk1ZOZ5nXccmsHZYy+TGD76kqLELjb2KKmqlMj3Wvk1jdGN4Nbx/VbF6OcBFm7WVbbyZOjhdnucnvB9vkOHjp50cYA3N2rqm+sydHA4djk949/kOHjptRB6iIgIiICIiAiIgwPpBwM2sYZ4QG1bR4CVo0Y48Dydw8FpOlqZ6aoD2F0U8biMxZzXDItcOI4EaELqdYH0g4HbWMM8IDato8BK0aMceB5O+yCQwPjGOuisbMqGAb8XPhvt5tP0UvXUe7dzezxHL9lzbTVM9NUBzC6KeNxGlnNcMnNcPoRxC33gfGEddFY2ZUMA9JF9N9vNp+iEw0zjljv8TqTY23252Nv5cfFVNm44rosvSekb7kgDvgHCxH1W+K6itdzR1eLeX7LH63YFLLffgjcT7W6Gn/8ATbFBiWzsU0VUQyVv8PMcg+/UcT+Lhn73zV3X7OfGc82HR40P6KO230bCxfSvN8/VPNwe5r+HxUPh/Es9E80tUx5g7JjeLujB4s95ncLjLJccmGtv4lmzcWmSNx0lPKZ2JtMsIjeeocmn3Ty8PJWtfRtDWyxuD4HgFrxna+mfJWtL/MZ+ZvmslfVju+ZX14cmvlcbZ/2h/wCb7BWSvttf7Q/8y82ZQekcSTuxtzc/TvtdSaza8xHlLVtfLNY77fFDQvldZoy4uOg/XwVPae36GjJYP8xUDVotutPe7sjwzPgoPEuLnyu/hKEObHfc34wd+U8mWzDe/U9wVfYHRu5wD6l+4LfyWW3vBz9B4D5rZjw1r36y+ng4lccbt1lEbTx7Wy3DXthbyjGduRe65KhdmFz6uJ53nOM8TnONzcmVhJJW6KDDNHCBuQMuPbc0Pce8udfNZBRUe9ws0csr9wXZqfVLSlziTk25+PcF8YlxDBQ0/pZT+FkQ7T3Wya0eZ0CYlxDBQ05lkP4WRDtPdbJrR5ngue8QbdmrJzPM67jk1g7LG8GMHLv1JQiDEG3JqyczzOu45NYOyxl8mMH31JWzOjfAO5u1dU31mTo4HDscnvHvchw8dHRvgDc3auqb6zJ0cDh2OT3g+1yHDx02og9REQEREBERAREQEREBERBgXSDgdtYwzwgNq2jwErRoxx4Hk77LSlLUzU1QHMLop43EZizmuGRa4H5EcQV1OsD6QcDNrGmeEBtW0eAlA0Y48Dyd9kEhgfGEddFY2ZUMHrIvpvsvq0/RS9bR7vWb2eI5fsubaWpnpqgOYXRTxuIzFnNcMi1zT9Qcit+YIxhHXRWNmVDB6yL+9l9Wn6aILhRGIcPw1ce5ILPF9yUdph7uY5hZLXUe71m9niOX7KxVRq/D1VJQVLqCq/kSGzH+yC42a9h91xyI4H43nH0pjqAw8HtseYvkVNYo2AysgLHWDxcxye67kfwnQ/soDY9S+WFglFqimkEEo4kA9R57jz53XDNT1RvwzcnF6oi0d4XW04i+rexvaL7BQmLdoPke3ZdIN46SuGW87UtceDRq4+A8Z3bdb/DmoqAAXhwjibqXSvyAAGthn4XVxgzDn8NEXv61TJ1pHnMi+e4D4m55lMVNTNvMnHxRXd57zKphbC8VHHfJ85HXlI+bWe63zWQL1XNHSlxucm8+fcF3aSjpS43OTfPuC+cTYggoacySH8McQ7T3Wya0eZ4BMTYggoacySH8LIh2nu4NaPM8AufMQbcmrJzPM65OTYx2WMvkxg++pUXRiDbs1ZOZ5nXccmxjssZwYwffUlbL6N8A7m7V1TfWZOjgcOxye8H2uQ4eOjo3wDubtXVN9Zk6OBw7HJ7wfa5Dh46bUQeoiICIiAiIgIiICIiAiIgIqbpWjUgfFUxVNPZu7wBP1QXCKkHOPs28SPtdfVigwXpBwM2sYZoQG1TR4CUDRjjwPJ32WlKWpnpqgPYXRTxuIzFnNcNWuadRzByK6nWB9IOBm1jDPCA2raPASgaMceB5O+yCRwRi+OuisbMqGAeki/vZfVp+mila6j3es3s8Ry/Zc3UtVPTVAe0uinjcRmLOa4atc06jmDqFvvBGL466KxsyoYPWRf3svq0/TRFmFyomq2SDU+mZYF7AyXv3DvRvtxIILfB/cskraPd6zezxHL9lYpPV5mNxqUVLsoPqmSOsWMLpGN/+5/V3iPwsGXe88lKormjpS43OTR9e4IRGijpS43PZHHn3BeYkxBDQ05llP4WRDtPdbJrR5nQJiTEMNDTmWU9zIh2nutk1o8zoFz3iHbs1ZUGeZ1zoyMX3WMvkxg8zqSixBiHbs1ZOZ5nXJyZGL7rGXyYweZ1JWyujfAO5u1lU3r5OigcOxye8H2uQ4eOjo3wBubtXVN6+TooHDscnvHvchw8dNqoPUXwQefwXyXOHs38D+qCqit3VAGocPEG3zC+2TtOjgfigqoiICIiAiIgKlLM1ouTZfNTLutJ+XioR7y43JuUF/NtP3R8T+ithLI927vHPgMh9FbK4opg19zoRYqokIKBrcz1jzOnyV4AvljwRcG45r7UUREQEREGBdIOBW1jDPCA2qaPAStHsOPPk77LSlLUzUtQHsLop43EZizmuHaa4HUcCOIXU6wPpBwM2sYZ4QG1TR4CVo9h3fyd9kEjgjGEddFY2ZOwD0kX97L6tP0UrW0e71m9niOX7Lm6kqp6aoD2l0U8biMxZzXDtNcDw4EcQt+YIxhHXRWNmVDAPSRf3t5tP0QmEjR0pcbnJvPn3BeYkxDBQ05lkP4WRC2899smtHmdAmJMQQUNOZZD3Mibbee62TWjzOgXPeIdvTVk5nmdc6MjHZYy+TGDzOpKEQYh27NWTmeZ1zoyMX3WMvkxg8zqStldG+Adzdq6pvXydFA4djk9497iBw8dHRvgHc3auqb18nRQOHY5PePe5Dh46bVQeoiICIiArWaiY7hY8wrpeEoIaQvjdbePdyPwVSLaJ9oX7xkVT2hOHOAGgvnzurVVE7DUtdoc+XFV1jbXEG415qaoZy5meoyP6qKukREFOaMOaWnQqFnpnMOYy97h+ynl4QgxxFMTUDDp1T3forSTZrhoQfoVUWkcrmnqkhXse0yO0Ae8ZK0fTPGrT5+SpIJmPaDDxI8R+irsnadHA/FQCKKyNerHA8jQkfEqo2qePaKCfRQYrpPe+gX2Nov7vkgxvpBwK2sYZ4QG1TR4CVo9hx58nfZaUpKqamqA9hdHPG62eTmkdpjgeHAhdIDaTuTViuJ8KU1bIJXgxygWc9lgXjgHg5EjnqhtqHEG3J6yczTOu61msHZY33WDgL58ytldG+Adzdq6pvXydFA4djk9497kOHjpc7EwNS00zZuvK5ubWvtutdwdutGZHC6zU7SdyahtMIoY7Rf3fJfJrpPe+gQTaKBNU8+0VSc9x1JPxKCedK0akDxKovrmDjfwChkQSEm0z7Lfif0VnLO93aN+7h8lTX2yBx0aT32VR8IrtmznHWw+vkryLZzBrd3jp8kEXDC5xs0fHgPEqapoAxtviTzKqtaALAWHJfSiiIiAiIgIiICpujB1APiFURBbGjYfZHwVM7OZwuPir1EEadlj3j8l8nZZ4OHyUoiCIOzX82/VfJ2c/u+amUQQp2e/kPmF5/Aye79QptEEJ/Aye79QgoH8vqFNoghhs5/d816Nmv5t+qmEQRQ2WeLh8ivsbMHFx+SkkQWI2aziSfjZVG0UY9n53V0iCm2Jo0aB8AqiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIg//Z"),
                  radius: 50,
                ),
                title: Text("TutorialPoint"),
                subtitle: Text("TutorialPoint is a free online encyclopedia,created and edited by volunteers around the world ..."),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('JavaPoint');
              },
              child:ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("data:image/png;base64,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"),
                  radius: 50,
                ),
                title: Text("JavaPoint"),
                subtitle: Text("JavaPoint is a free online encyclopedia,created and edited by volunteers around the world ..."),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('W3Schools');
              },
              child:ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                  radius: 50,
                ),
                title: Text("W3SSchools"),
                subtitle: Text("W3SSchools is a free online encyclopedia,created and edited by volunteers around the world ..."),
              )
            ),
          ],
        ),
      ),
    );
  }
}
