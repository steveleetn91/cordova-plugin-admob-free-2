#import <Cordova/CDV.h>
#import "CVDAdmobBanner.h"

@implementation CVDAdmobBanner

@synthesize bannerView;

- (GADAdSize) selectSize:(NSInteger *)type {
    GADAdSize size;
    switch ((long)type) {
        case 1:
            size = GADAdSizeFromCGSize(CGSizeMake(320, 50));
            break;
            
        case 2:
            size = GADAdSizeFromCGSize(CGSizeMake(320, 100));
            break;
            
        case 3:
            size = GADAdSizeFromCGSize(CGSizeMake(320, 250));
            break;
            
        case 4:
            size = GADAdSizeFromCGSize(CGSizeMake(468, 60));
            break;
            
        case 5:
            size = GADAdSizeFromCGSize(CGSizeMake(728, 90));
            break;
            
        default:
            size = GADAdSizeFromCGSize(CGSizeMake(300, 50));
            break;
    }
    return size;
}

- (void) createBannerView:(CDVInvokedUrlCommand*)command {
    if(self.bannerView) {
        NSLog(@"Admob banner has been initing");
        return;
    }
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    NSArray* args = command.arguments;
    NSUInteger argc = [args count];
    if (argc == 1) {
        UIView *parentView = [self.webView superview];
        NSDictionary* option = [command argumentAtIndex:0 withDefault:[NSNull null]];
        NSString *AdsCode = [option objectForKey:@"adsCode"];
        NSInteger OriginX = [[option objectForKey:@"x"] integerValue];
        NSInteger OriginY = [[option objectForKey:@"y"] integerValue];
        NSInteger setSize = [[option objectForKey:@"size"] integerValue];
        GADAdSize size = [self selectSize:setSize];
        NSLog(@"Banner OriginY %ld",(long)OriginY);
        NSLog(@"Banner OriginX %ld",(long)OriginX);
        CGPoint origin = CGPointMake(OriginX,OriginY);
        self.bannerView = [[GADBannerView alloc]
                           initWithAdSize:size
                           origin:origin];
        
        self.bannerView.adUnitID = AdsCode;
        self.bannerView.rootViewController = self.viewController;
        self.bannerView.delegate = self;
        self.bannerView.hidden = YES;
        [parentView addSubview:self.bannerView];
        [parentView bringSubviewToFront:self.bannerView];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        NSLog(@"Admob Option invalid for banner");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}
- (void)hiddenAd:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    if(self.bannerView) {
        self.bannerView.hidden = YES;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}
- (void)showAd:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    if(self.bannerView) {
        self.bannerView.hidden = NO;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}
- (void)destroyAd:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    if(self.bannerView) {
        self.bannerView.hidden = YES;
        [self.bannerView removeFromSuperview];
        self.bannerView = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
    
}
- (void)loadAd:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult;
    NSString *callbackId = command.callbackId;
    // Load the ad request.
    if(self.bannerView) {
        GADRequest *request = [GADRequest request];
        [self.bannerView loadRequest:request];
        NSLog(@"Banner ad loaded and displayed.");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
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
