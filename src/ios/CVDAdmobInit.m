#import <Cordova/CDV.h>
#import "CVDAdmobInit.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>
@implementation CVDAdmobInit 
    #pragma mark Cordova JS bridge
    - (void)pluginInitialize {
        [super pluginInitialize];
        //[GADMobileAds.sharedInstance.requestConfiguration setSameAppKeyEnabled:NO];
        // GADMobileAds.configure(withApplicationID: "id number")
        [self startGoogleMobileAdsSDKOnce];
        
                            }

- (void)startGoogleMobileAdsSDKOnce {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Initialize the Google Mobile Ads SDK with your AdMob App ID.
        NSLog(@"Start GoogleMobileAds");
        [GADMobileAds.sharedInstance startWithCompletionHandler:^(GADInitializationStatus * _Nonnull status) {
            // SDK initialization completed. You can check the status for any error messages.
            //[self loadAd];
        }];
        //[GADMobileAds.sharedInstance startWithCompletionHandler:nil];
    });
}

- (void)loadAd {
    UIView *parentView = [self.webView superview];
    // Create a GADBannerView instance with your ad size and ad unit ID.
    self.bannerView = [[GADBannerView alloc] initWithAdSize:GADAdSizeBanner];
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self.viewController;
    self.bannerView.delegate = self;
    //self.bannerView.origin.y = parentView.safeAreaInsets.top;
    // Load the ad request.
    GADRequest *request = [GADRequest request];
    [self.bannerView loadRequest:request];
    
    // Add the bannerView to the parent view to display the ad.
    //UIView *parentView = [self.webView superview];
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
