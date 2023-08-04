import { Banner, Interstitial, RewardVideo } from '../core/admobClass';

class AndroidBanner extends Banner {
    constructor() {
        super();
        this.class = "AdmobBanner";
    }
}
class AndroidInterstitial extends Interstitial {
    constructor() {
        super();
        this.class = "AdmobInterstitial";
    }
}
class AndroidReward extends RewardVideo {
    constructor() {
        super();
        this.class = "AdmobReward";
    }
}

export default class androidAdmob {
    banner = new AndroidBanner();
    interstitial = new AndroidInterstitial();
    rewardvideo = new AndroidReward();
}