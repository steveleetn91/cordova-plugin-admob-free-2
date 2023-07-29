#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

#import <GoogleMobileAds/GoogleMobileAds.h>

#pragma mark - JS requestAd options

@class GADBannerView;

@class GADInterstitialAd;

@class GADRewardedAd;

#pragma mark AdMob Plugin

// This version of the AdMob plugin has been tested with Cordova version 2.5.0.

@interface CDVAdMob : CDVPlugin <GADBannerViewDelegate, GADInterstitialDelegate, GADFullScreenContentDelegate> {
    @protected
    UIView* _safeAreaBackgroundView;
}

@property(nonatomic, retain) GADBannerView *bannerView;
@property(nonatomic, retain) GADInterstitialAd *interstitialView;
@property(nonatomic, retain) GADRewardedAd *rewardVideoView;

@property (nonatomic, retain) NSString* publisherId;
@property (nonatomic, retain) NSString* interstitialAdId;
@property (nonatomic, retain) NSString* rewardVideoId;


@property (assign) GADAdSize adSize;
@property (assign) BOOL bannerAtTop;
@property (assign) BOOL bannerOverlap;
@property (assign) BOOL offsetTopBar;

@property (assign) BOOL isTesting;
@property (nonatomic, retain) NSDictionary* adExtras;

@property (assign) BOOL bannerIsVisible;
@property (assign) BOOL bannerIsInitialized;
@property (assign) BOOL bannerShow;
@property (assign) BOOL autoShow;
@property (assign) BOOL autoShowBanner;
@property (assign) BOOL autoShowInterstitial;
@property (assign) BOOL autoShowRewardVideo;
@property (assign) NSObject* rewardedVideoLock;
@property (assign) BOOL isRewardedVideoLoading;


@property (nonatomic, retain) NSString* gender;
@property (nonatomic, retain) NSString* forChild;

- (void) setOptions:(CDVInvokedUrlCommand *)command;

- (void)createBannerView:(CDVInvokedUrlCommand *)command;
- (void)destroyBannerView:(CDVInvokedUrlCommand *)command;
- (void)requestAd:(CDVInvokedUrlCommand *)command;
- (void)showAd:(CDVInvokedUrlCommand *)command;

- (void)createInterstitialView:(CDVInvokedUrlCommand *)command;
- (void)requestInterstitialAd:(CDVInvokedUrlCommand *)command;
- (void)showInterstitialAd:(CDVInvokedUrlCommand *)command;
- (void)isInterstitialReady:(CDVInvokedUrlCommand *)command;

- (void)createRewardVideo:(CDVInvokedUrlCommand *)command;
- (void)showRewardVideo:(CDVInvokedUrlCommand *)command;
- (void)isRewardVideoReady:(CDVInvokedUrlCommand *)command;

@end
