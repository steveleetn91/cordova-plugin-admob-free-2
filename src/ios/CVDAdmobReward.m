#import <Cordova/CDV.h>
#import "CVDAdmobReward.h"

@implementation CVDAdmobReward
@synthesize rewardedAd;
- (void)createAd:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    NSArray* args = command.arguments;
    NSUInteger argc = [args count];
    if (argc == 1) {
        NSDictionary* option = [command argumentAtIndex:0 withDefault:[NSNull null]];
        NSString *AdsCode = [option objectForKey:@"adsCode"];
        GADRequest *request = [GADRequest request];
          [GADRewardedAd
               loadWithAdUnitID:AdsCode
                        request:request
              completionHandler:^(GADRewardedAd *ad, NSError *error) {
                if (error) {
                  NSLog(@"Rewarded ad failed to load with error: %@", [error localizedDescription]);
                  return;
                }
                self.rewardedAd = ad;
                NSLog(@"Rewarded ad loaded.");
                self.rewardedAd.fullScreenContentDelegate = self;
                [self fireEvent:@"" event:@"admob.rewardVideo.events.LOAD" withData:nil];
              }];
    }
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}
 
 -(void)showAd:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    if (self.rewardedAd && [self.rewardedAd canPresentFromRootViewController:self.viewController error:nil]) {

      [self.rewardedAd presentFromRootViewController:self.viewController
                            userDidEarnRewardHandler:^{
                              GADAdReward *reward = self.rewardedAd.adReward;

                              NSString *rewardMessage = [NSString
                                  stringWithFormat:@"Reward received with currency %@ , amount %lf",
                                                   reward.type, [reward.amount doubleValue]];
                              NSLog(@"%@", rewardMessage);
                              // Reward the user for watching the video.
                            }];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}
- (void) fireEvent:(NSString *)obj event:(NSString *)eventName withData:(NSString *)jsonStr {
    NSString* js;
    if(obj && [obj isEqualToString:@"window"]) {
        js = [NSString stringWithFormat:@"var evt=document.createEvent(\"UIEvents\");evt.initUIEvent(\"%@\",true,false,window,0);window.dispatchEvent(evt);", eventName];
    } else if(jsonStr && [jsonStr length]>0) {
        js = [NSString stringWithFormat:@"javascript:cordova.fireDocumentEvent('%@',%@);", eventName, jsonStr];
    } else {
        js = [NSString stringWithFormat:@"javascript:cordova.fireDocumentEvent('%@');", eventName];
    }
    [self.commandDelegate evalJs:js];
}
#pragma mark GADBannerViewDelegate implementation

/// Tells the delegate that the ad failed to present full screen content.
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
    didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
    [self fireEvent:@"" event:@"admob.rewardVideo.events.LOAD_FAIL" withData:nil];
    NSLog(@"Ad did fail to present full screen content.");
}

/// Tells the delegate that the ad will present full screen content.
- (void)adWillPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self fireEvent:@"" event:@"admob.rewardVideo.events.OPEN" withData:nil];
    NSLog(@"Ad will present full screen content.");
}

/// Tells the delegate that the ad dismissed full screen content.
- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self fireEvent:@"" event:@"admob.rewardVideo.events.DID_DISMISS" withData:nil];
    NSLog(@"Ad did dismiss full screen content.");
}

#pragma mark Cleanup

- (void)dealloc {
    self.rewardedAd = nil;
}

@end
