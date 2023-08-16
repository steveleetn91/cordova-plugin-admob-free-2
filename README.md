![alt text](https://github.com/steveleetn91/cordova-plugin-admob-free-2/blob/dev/demo.png?raw=true)

# Cordova AdMob Plugin (iOS)

This plugin consider from [cordova-plugin-admob-free] plugin. Support GoogleMobileAds SDK version `10.8.0` for iOS and Android `22.2.0`.


## Required 

 - NodeJS >= 19

## ADS SUPPORT 

  - Banner -> yes
  - Interstilial -> yes
  - Reward -> yes

## How to install 

First step you need clone or download plugin after that run:

    cordova plugin add path/to/plugin/cordova-plugin-admob-free-2 --save --variable ADMOB_APP_ID="<YOUR_ANDROID_ADMOB_APP_ID_AS_FOUND_IN_ADMOB>"

change `path/to/plugin` by your path to plugin cloned or downloaded. If you have error "Error: undefined is not an object (evaluating 'window.admob.iOS')" maybe you will need reinstall `node_modules`, go to `./plugins/cordova-plugin-admob-free-2` and delete folder `./node_modules`, run `npm install && npm run build`.

Remove 

    cordova plugin remove cordova-plugin-admob-free-2 --save --variable ADMOB_APP_ID="<YOUR_ANDROID_ADMOB_APP_ID_AS_FOUND_IN_ADMOB>"    

## Config 

First step your need add this into `config.xml` . You need consider this link for config iOS `https://developers.google.com/admob/ios/quick-start`.

        <config-file target="*-Info.plist" parent="NSAppTransportSecurity">
            <dict>
                <key>NSAllowsArbitraryLoads</key>
                <true/>
            </dict>
        </config-file>
        <edit-config target="GADApplicationIdentifier" file="*-Info.plist" mode="merge">
            <string>ca-app-pub-3940256099942544~1458002511</string>
        </edit-config>
        <edit-config target="SKAdNetworkItems" file="*-Info.plist" mode="merge">
            <array>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>cstr6suwn9.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>4fzdc2evr5.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>4pfyvq9l8r.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>2fnua5tdw4.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>ydx93a7ass.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>5a6flpkh64.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>p78axxw29g.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>v72qych5uu.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>ludvb6z3bs.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>cp8zw746q7.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>c6k4g5qg8m.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>s39g8k73mm.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>3qy4746246.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>3sh42y64q3.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>f38h382jlk.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>hs6bdukanm.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>prcb7njmu6.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>v4nxqhlyqp.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>wzmmz9fp6w.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>yclnxrl5pm.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>t38b2kh725.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>7ug5zh24hu.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>9rd848q2bz.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>y5ghdn5j9k.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>n6fk4nfna4.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>v9wttpbfk9.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>n38lu8286q.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>47vhws6wlr.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>kbd757ywx3.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>9t245vhmpl.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>a2p9lx4jpn.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>22mmun2rn5.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>4468km3ulz.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>2u9pt9hc89.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>8s468mfl3y.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>av6w8kgt66.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>klf5c3l5u5.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>ppxm28t8ap.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>424m5254lk.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>ecpz2srf59.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>uw77j35x4d.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>mlmmfzh3r3.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>578prtvx9j.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>4dzt52r2t5.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>gta9lk7p23.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>e5fvkxwrpn.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>8c4e2ghe7u.skadnetwork</string> 
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>zq492l623r.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>3rd42ekr43.skadnetwork</string>
            </dict>
            <dict>
                <key>SKAdNetworkIdentifier</key>
                <string>3qcr597p9d.skadnetwork</string>
            </dict>
            </array>
        </edit-config>
        <edit-config target="GADIsAdManagerApp" file="*-Info.plist" mode="merge"> 
            <true /> 
        </edit-config>


Sometime a some texteditor auto format will appears a some errors. If on that case you can consider google document for iOS version 10.8.0.


## Add SDK ( Simulator && Real Device )

Default plugin support for simulator but if you need run on Real Device, so let's go to `./plugins/cordova-plugins-admob-free-2/plugin.xml` and comment all framework support for simulator and uncomment all framework support for Real Device ( I have comment at that, please check it ). After that you need reinstall iOS platform, maybe it'll apprear error
because project no select device for compile, don't worry you can open Project with Xcode and select Real Device, next step you can build in XCode or command line.


## How to use? 

### Example Banner iOS

    const x = (window.outerWidth - 320) / 2;
    const y = window.outerHeight - 100;
    const size = 2;
    // size = 0 : 300x50
    // size = 1 : 320x50
    // size = 2 : 320x100
    // size = 3 : 320x250
    // size = 4 : 468x60
    // size = 5 : 728x90

    admob.ios.banner.createAd(UnitAdId, x,y,size)
    .then(() => {
        admob.ios.banner.loadAd();
    });
    document.addEventListener("admob.banner.events.LOAD",() => {
        console.log("ADS LOAD");
        admob.ios.banner.showAd();
    })

### Example Banner Android

    const x = (window.outerWidth - 320) / 2;
    const y = window.outerHeight - 100;
    const size = 2;
    // size = 0 : 300x50
    // size = 1 : 320x50
    // size = 2 : 320x100
    // size = 3 : 320x250
    // size = 4 : 468x60
    // size = 5 : 728x90

    admob.android.banner.createAd(UnitAdId, x,y,size)
    .then(() => {
        admob.android.banner.loadAd();
    });

    document.addEventListener("admob.banner.events.LOAD",() => {
        console.log("ADS LOAD");
        admob.android.banner.showAd();
    })    

### Example Interstitial iOS

    window.admob.ios.interstitial.createAd(UnitId);

    document.addEventListener("admob.interstitial.events.LOAD",() => {
        window.admob.ios.interstitial.showAd();
    });

### Example Interstitial Android

    window.admob.android.interstitial.createAd(UnitId);

    document.addEventListener("admob.interstitial.events.LOAD",() => {
        window.admob.android.interstitial.showAd();
    });

### Example ReWard iOS

    window.admob.ios.rewardvideo.createAd(UnitId);

    document.addEventListener("admob.rewardvideo.events.LOAD",() => {
        window.admob.ios.rewardvideo.showAd();
    });

### Example ReWard Android

    window.admob.android.rewardvideo.createAd(UnitId);

    document.addEventListener("admob.rewardvideo.events.LOAD",() => {
        window.admob.android.rewardvideo.showAd();
    });


## Events iOS

    - admob.interstitial.events.LOAD
    - admob.interstitial.events.OPEN
    - admob.interstitial.events.LOAD_FAIL
    - admob.interstitial.events.DID_DISMISS

    - admob.banner.events.LOAD
    - admob.banner.events.OPEN
    - admob.banner.events.LOAD_FAIL
    - admob.banner.events.DID_RECORD
    - admob.banner.events.WILL_DISMISS
    - admob.banner.events.DISMISS

    - admob.rewardvideo.events.LOAD
    - admob.rewardvideo.events.OPEN
    - admob.rewardvideo.events.LOAD_FAIL
    - admob.rewardvideo.events.DID_DISMISS

## Events Android

    - admob.interstitial.events.CLICK
    - admob.interstitial.events.LOAD
    - admob.interstitial.events.OPEN
    - admob.interstitial.events.LOAD_FAIL
    - admob.interstitial.events.DISMISS
    - admob.interstitial.events.IMPRESSION

    - admob.banner.events.CLICK
    - admob.banner.events.LOAD
    - admob.banner.events.OPEN
    - admob.banner.events.LOAD_FAIL
    - admob.banner.events.CLOSE
    - admob.banner.events.IMPRESSION

    - admob.rewardvideo.events.LOAD
    - admob.rewardvideo.events.OPEN
    - admob.rewardvideo.events.LOAD_FAIL
    - admob.rewardvideo.events.IMPRESSION
    - admob.rewardvideo.events.DISMISS
    - admob.rewardvideo.events.CLICK

## Issue 

If you need anything please create new issue `https://github.com/steveleetn91/cordova-plugin-admob-free-2/issues`

## License

[MIT](LICENSE)
