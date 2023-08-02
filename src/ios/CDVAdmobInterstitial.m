#import <Cordova/CDV.h>
#import "CDVAdmobInterstitial.h"

@implementation CDVAdmobInterstitial

@synthesize interstitial;

- (void)createAd:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    NSArray* args = command.arguments;
    NSUInteger argc = [args count];
    if (argc == 1) {
        NSDictionary* option = [command argumentAtIndex:0 withDefault:[NSNull null]];
        NSString *AdsCode = [option objectForKey:@"adsCode"];
        GADRequest *request = [GADRequest request];
        [GADInterstitialAd
         loadWithAdUnitID:AdsCode
         request:request
         completionHandler:^(GADInterstitialAd *ad, NSError *error) {
            if (error) {
                NSLog(@"Failed to load interstitial ad with error: %@", [error localizedDescription]);
                return;
            }
            self.interstitial = ad;
            self.interstitial.fullScreenContentDelegate = self;
            //[self.interstitial presentFromRootViewController:self.viewController];
            [self fireEvent:@"" event:@"admob.interstitial.events.LOAD" withData:nil];
        }];
    }
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void) showAd:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    if (self.interstitial && [self.interstitial
                                       canPresentFromRootViewController:self.viewController
                                                                  error:nil]) {
                                 [self.interstitial presentFromRootViewController:self.viewController];
                               } else {
                                   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                               }
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
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

#pragma GADFullScreeContentDelegate implementation

- (void)adWillPresentFullScreenContent:(id)ad {
    [self fireEvent:@"" event:@"admob.interstitial.events.OPEN" withData:nil];
    [self fireEvent:@"" event:@"onPresentAd" withData:nil];
  NSLog(@"Ad will present full screen content.");
}

- (void)ad:(id)ad didFailToPresentFullScreenContentWithError:(NSError *)error {
    [self fireEvent:@"" event:@"admob.interstitial.events.LOAD_FAIL" withData:nil];
    [self fireEvent:@"" event:@"onFailedToReceiveAd" withData:nil];
  NSLog(@"Ad failed to present full screen content with error %@.", [error localizedDescription]);
}

- (void)adDidDismissFullScreenContent:(id)ad {
     [self fireEvent:@"" event:@"admob.interstitial.events.DID_DISMISS" withData:nil];
    [self fireEvent:@"" event:@"onDidDismissAd" withData:nil];
  NSLog(@"Ad did dismiss full screen content.");
}
#pragma mark Cleanup

- (void)dealloc {
    self.interstitial = nil;
}
@end
