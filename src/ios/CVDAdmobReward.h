#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface CVDAdmobReward : CDVPlugin
{}
@property(nonatomic, strong) GADRewardedAd *rewardedAd;
- (void)createRewardVideo:(CDVInvokedUrlCommand *)command;
- (void)showRewardVideo:(CDVInvokedUrlCommand *)command;
- (void)isRewardVideoReady:(CDVInvokedUrlCommand *)command;

@end
