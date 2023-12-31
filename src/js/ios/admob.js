const exec = cordova.exec;
class FullScreenAds {
  adsCode = "";
  class = "";
  constructor(className = "") {
    this.class = className;
  }
  createAd( adsCode = "") {
    this.adsCode = adsCode;
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob "+this.adsCode);
        return resolve();
      }, () => {
        console.log("Admob "+this.adsCode+" fail");
        return reject();
      }, this.class, 'createAd', [{
        adsCode : this.adsCode
      }])
    })
  }
  showAd( ) {
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob "+this.adsCode);
        return resolve();
      }, () => {
        console.log("Admob "+this.adsCode+" fail");
        return reject();
      }, this.class, 'showAd', [])
    })
  }
}

class Banner extends FullScreenAds {
  constructor() {
    super("CVDAdmobBanner");
    this.createAd = null;
    this.createAd = this.createBannerView;
  }

  createBannerView(adsCode = "ca-app-pub-3940256099942544/2934735716",x = 0,y = 0,size = 0) {
    this.adsCode = adsCode;
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob create banner");
        return resolve();
      }, () => {
        console.log("Admob create banner fail");
        return reject();
      }, this.class, 'createBannerView', [{
        adsCode:this.adsCode,
        x : x,
        y : y,
        size : size
      }]);
    });
  }

  loadAd() {
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob load banner");
        return resolve();
      }, () => {
        console.log("Admob load banner fail");
        return reject();
      }, this.class, 'loadAd', [])
    });
  }

  hiddenAd() {
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob hidden banner");
        return resolve();
      }, () => {
        console.log("Admob hidden banner fail");
        return reject();
      }, this.class, 'hiddenAd', [])
    })
  }

  destroyAd() {
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob destroy banner");
        return resolve();
      }, () => {
        console.log("Admob destroy banner fail");
        return reject();
      }, this.class, 'destroyAd', [])
    })
  }

}

class Interstitial extends FullScreenAds {
  constructor() {
    super("CDVAdmobInterstitial");
  }
}
class RewardVideo extends FullScreenAds {
  constructor() {
    super("CVDAdmobReward");
  }
}

export default class iOSAdmob{
  banner= new Banner();
  interstitial= new Interstitial();
  rewardvideo= new RewardVideo();
}
