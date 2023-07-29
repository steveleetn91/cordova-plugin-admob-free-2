import exec from 'cordova/exec'


class Banner {
  constructor() {

  }

  createBannerView(adsCode = "ca-app-pub-3940256099942544/2934735716",x = 0,y = 0,size = 0) {
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob create banner");
        return resolve();
      }, () => {
        console.log("Admob create banner fail");
        return reject();
      }, 'CVDAdmobBanner', 'createBannerView', [{
        adsCode:adsCode,
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
      }, 'CVDAdmobBanner', 'loadAd', [])
    });
  }

  showAd() {
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob show banner");
        return resolve();
      }, () => {
        console.log("Admob show banner fail");
        return reject();
      }, 'CVDAdmobBanner', 'showAd', [])
    })
  }

  hiddenAd() {
    return new Promise((resolve,reject) => {
      exec(() => {
        console.log("Admob hidden banner");
        return resolve();
      }, () => {
        console.log("Admob hidden banner fail");
        return reject();
      }, 'CVDAdmobBanner', 'hiddenAd', [])
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
      }, 'CVDAdmobBanner', 'destroyAd', [])
    })
  }

}
class Interstitial {
  constructor() {

  }
}
class RewardVideo {
  constructor() {

  }
}

export default class iOSAdmob{
  banner= new Banner();
  interstitial= new Interstitial();
  rewardvideo= new RewardVideo();
}
