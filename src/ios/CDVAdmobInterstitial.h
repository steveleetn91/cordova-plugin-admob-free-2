#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface CDVAdmobInterstitial : CDVPlugin<GADFullScreenContentDelegate>
{}
@property(nonatomic, strong) GADInterstitialAd *interstitial;

- (void)createInterstitialView:(CDVInvokedUrlCommand *)command;
- (void)requestInterstitialAd:(CDVInvokedUrlCommand *)command;
- (void)showInterstitialAd:(CDVInvokedUrlCommand *)command;
- (void)isInterstitialReady:(CDVInvokedUrlCommand *)command;

@end
