import { Banner, Interstitial, RewardVideo } from '../core/admobClass';

class AndroidBanner extends Banner {
    constructor() {
        super("AdmobBanner");
    }
}
class AndroidInterstitial extends Interstitial {
    constructor() {
        super("AdmobInterstitial");
    }
}
class AndroidReward extends RewardVideo {
    constructor() {
        super("AdmobReward");
    }
}

export default class androidAdmob {
    banner = new AndroidBanner();
    interstitial = new AndroidInterstitial();
    rewardvideo = new AndroidReward();
}