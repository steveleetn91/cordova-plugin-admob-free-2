#import <Cordova/CDV.h>
#import "CVDAdmobInit.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>
@implementation CVDAdmobInit 
    #pragma mark Cordova JS bridge
    - (void)pluginInitialize {
        [super pluginInitialize];
        [self startGoogleMobileAdsSDKOnce];
        
                            }

- (void)startGoogleMobileAdsSDKOnce {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"Start GoogleMobileAds");
        [GADMobileAds.sharedInstance startWithCompletionHandler:^(GADInitializationStatus * _Nonnull status) {
            NSLog(@"Start GoogleMobileAds Successfully");
        }];
    });
}

- (void)loadAd {
    UIView *parentView = [self.webView superview];
    self.bannerView = [[GADBannerView alloc] initWithAdSize:GADAdSizeBanner];
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self.viewController;
    self.bannerView.delegate = self;
    GADRequest *request = [GADRequest request];
    [self.bannerView loadRequest:request];
    [parentView addSubview:self.bannerView];
    [parentView bringSubviewToFront:self.bannerView];
    NSLog(@"Banner ad loaded and displayed.");
}

#pragma mark GADBannerViewDelegate implementation

- (void)bannerViewDidReceiveAd:(GADBannerView *)bannerView {
  NSLog(@"bannerViewDidReceiveAd");
}

- (void)bannerView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(NSError *)error {
  NSLog(@"bannerView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

- (void)bannerViewDidRecordImpression:(GADBannerView *)bannerView {
  NSLog(@"bannerViewDidRecordImpression");
}

- (void)bannerViewWillPresentScreen:(GADBannerView *)bannerView {
  NSLog(@"bannerViewWillPresentScreen");
}

- (void)bannerViewWillDismissScreen:(GADBannerView *)bannerView {
  NSLog(@"bannerViewWillDismissScreen");
}

- (void)bannerViewDidDismissScreen:(GADBannerView *)bannerView {
  NSLog(@"bannerViewDidDismissScreen");
}

@end
