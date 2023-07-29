#import <Cordova/CDV.h>
#import "CVDAdmobReward.h"

@implementation CVDAdmobReward
@synthesize rewardedAd;
- (void)createRewardVideo {
  GADRequest *request = [GADRequest request];
  [GADRewardedAd
       loadWithAdUnitID:@"ca-app-pub-3940256099942544/4806952744"
                request:request
      completionHandler:^(GADRewardedAd *ad, NSError *error) {
        if (error) {
          NSLog(@"Rewarded ad failed to load with error: %@", [error localizedDescription]);
          return;
        }
        self.rewardedAd = ad;
        NSLog(@"Rewarded ad loaded.");
        self.rewardedAd.fullScreenContentDelegate = self;
      }];
}

/// Tells the delegate that the ad failed to present full screen content.
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
    didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
    NSLog(@"Ad did fail to present full screen content.");
}

/// Tells the delegate that the ad will present full screen content.
- (void)adWillPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    NSLog(@"Ad will present full screen content.");
}

/// Tells the delegate that the ad dismissed full screen content.
- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    NSLog(@"Ad did dismiss full screen content.");
}

- (void)showRewardVideo {
    if (self.rewardedAd) {
        [self.rewardedAd presentFromRootViewController:self
            userDidEarnRewardHandler:^{
                GADAdReward *reward =self.rewardedAd.adReward;
                // TODO: Reward the user!
            }];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

- (void)isRewardVideoReady {
    
}

- (void)createRewardVideo:(CDVInvokedUrlCommand *)command {
}

- (void)isRewardVideoReady:(CDVInvokedUrlCommand *)command {
}

- (void)showRewardVideo:(CDVInvokedUrlCommand *)command {
}

@end
