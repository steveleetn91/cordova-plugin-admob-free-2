#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface CVDAdmobBanner : CDVPlugin <GADBannerViewDelegate>
{}
@property(nonatomic, strong) GADBannerView *bannerView;

- (void)createBannerView:(CDVInvokedUrlCommand *)command;
- (void)showAd:(CDVInvokedUrlCommand *)command;
- (void)hiddenAd:(CDVInvokedUrlCommand *)command;
- (void)loadAd:(CDVInvokedUrlCommand *)command;
- (void)destroyAd:(CDVInvokedUrlCommand *)command;
- (void) fireEvent:(NSString *)obj event:(NSString *)eventName withData:(NSString *)jsonStr;
@end
