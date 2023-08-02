#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface CVDAdmobReward : CDVPlugin<GADFullScreenContentDelegate>
{}
@property(nonatomic, strong) GADRewardedAd *rewardedAd;
- (void)createAd:(CDVInvokedUrlCommand *)command;
- (void)showAd:(CDVInvokedUrlCommand *)command;
- (void) fireEvent:(NSString *)obj event:(NSString *)eventName withData:(NSString *)jsonStr;
@end
