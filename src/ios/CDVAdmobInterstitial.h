#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface CDVAdmobInterstitial : CDVPlugin<GADFullScreenContentDelegate>
{
    
}
@property(nonatomic, strong) GADInterstitialAd *interstitial;

- (void)createAd:(CDVInvokedUrlCommand *)command;
- (void)showAd:(CDVInvokedUrlCommand *)command;
- (void) fireEvent:(NSString *)obj event:(NSString *)eventName withData:(NSString *)jsonStr;
@end
