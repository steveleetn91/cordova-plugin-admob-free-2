#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface CVDAdmobInit : CDVPlugin {}
@property(nonatomic, strong) GADBannerView *bannerView;
@end