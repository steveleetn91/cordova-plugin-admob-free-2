package org.apache.cordova;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import androidx.annotation.NonNull;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.android.gms.ads.AdError;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.FullScreenContentCallback;
import com.google.android.gms.ads.LoadAdError;
import com.google.android.gms.ads.OnUserEarnedRewardListener;
import com.google.android.gms.ads.rewarded.RewardItem;
import com.google.android.gms.ads.rewarded.RewardedAd;
import com.google.android.gms.ads.rewarded.RewardedAdLoadCallback;

class AdmobReward extends CordovaPlugin {
    private static final String TAG = "AdmobReward";
    private RewardedAd rewardedAd;
    private String bannerAdUnitId = "ca-app-pub-3940256099942544/5224354917";
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        if (action.equals("createAd")) {
            if(args.length() < 1) {
                Log.d(TAG,"No options");
                callbackContext.error("createAd failed");
                return false;
            }
            JSONObject option = args.getJSONObject(0);
            this.createAd(option, callbackContext);
            return true;
        }
        if (action.equals("showAd")) {
            this.showAd(callbackContext);
            return true;
        }
        return false;
    }
    public PluginResult createAd(JSONObject option,final CallbackContext callbackContext){

        cordova.getActivity().runOnUiThread(new Runnable() {

            @Override
            public void run() {

                if (option.has("adsCode")) {
                    bannerAdUnitId = option.optString("adsCode");
                    Log.d(TAG,bannerAdUnitId + " error");
                }

                RelativeLayout adViewLayout = new RelativeLayout(cordova.getActivity());
                RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.MATCH_PARENT,
                        RelativeLayout.LayoutParams.MATCH_PARENT);
                try {
                    ((ViewGroup) (((View) webView.getClass().getMethod("getView").invoke(webView)).getParent())).addView(adViewLayout, params);
                } catch (Exception e) {
                    ((ViewGroup) webView).addView(adViewLayout, params);
                }


                AdRequest adRequest = new AdRequest.Builder().build();

                RewardedAd.load(adViewLayout.getContext(),bannerAdUnitId, adRequest,
                        new RewardedAdLoadCallback() {
                            @Override
                            public void onAdLoaded(@NonNull RewardedAd ad) {
                                // The mInterstitialAd reference will be null until
                                // an ad is loaded.
                                rewardedAd = ad;
                                Log.i(TAG, "onAdLoaded");
                                fireAdEvent("admob.rewardvideo.events.LOAD");

//                                rewardedAd.show(cordova.getActivity(),new OnUserEarnedRewardListener() {
//                                    @Override
//                                    public void onUserEarnedReward(@NonNull RewardItem rewardItem) {
//                                        // Handle the reward.
//                                        Log.d(TAG, "The user earned the reward.");
//                                        int rewardAmount = rewardItem.getAmount();
//                                        String rewardType = rewardItem.getType();
//                                        fireAdEvent("admob.rewardvideo.events.CLOSE");
//                                    }
//                                });

                                rewardedAd.setFullScreenContentCallback(new FullScreenContentCallback(){
                                    @Override
                                    public void onAdClicked() {
                                        // Called when a click is recorded for an ad.
                                        Log.d(TAG, "Ad was clicked.");
                                        fireAdEvent("admob.rewardvideo.events.CLICK");
                                    }

                                    @Override
                                    public void onAdDismissedFullScreenContent() {
                                        // Called when ad is dismissed.
                                        // Set the ad reference to null so you don't show the ad a second time.
                                        Log.d(TAG, "Ad dismissed fullscreen content.");
                                        rewardedAd = null;
                                        fireAdEvent("admob.rewardvideo.events.DISMISS");
                                    }

                                    @Override
                                    public void onAdFailedToShowFullScreenContent(AdError adError) {
                                        // Called when ad fails to show.
                                        Log.e(TAG, "Ad failed to show fullscreen content.");
                                        rewardedAd = null;
                                        fireAdEvent("admob.rewardvideo.events.LOAD_FAIL");
                                    }

                                    @Override
                                    public void onAdImpression() {
                                        // Called when an impression is recorded for an ad.
                                        Log.d(TAG, "Ad recorded an impression.");
                                        fireAdEvent("admob.rewardvideo.events.IMPRESSION");
                                    }

                                    @Override
                                    public void onAdShowedFullScreenContent() {
                                        // Called when ad is shown.
                                        Log.d(TAG, "Ad showed fullscreen content.");
                                        fireAdEvent("admob.rewardvideo.events.OPEN");
                                    }
                                });
                                callbackContext.success();
                            }

                            @Override
                            public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
                                // Handle the error
                                Log.d(TAG, loadAdError.toString());
                                rewardedAd = null;
                                callbackContext.error("error");
                            }

                        });
            }
        });


        return null;
    }

    public PluginResult showAd(CallbackContext callbackContext){
        if(rewardedAd == null) {
            callbackContext.error("error");
            return null;
        }
        cordova.getActivity().runOnUiThread(new Runnable() {

            @Override
            public void run() {
                rewardedAd.show(cordova.getActivity(),new OnUserEarnedRewardListener() {
                    @Override
                    public void onUserEarnedReward(@NonNull RewardItem rewardItem) {
                        // Handle the reward.
                        Log.d(TAG, "The user earned the reward.");
                        int rewardAmount = rewardItem.getAmount();
                        String rewardType = rewardItem.getType();
                        fireAdEvent("admob.rewardvideo.events.CLOSE");
                    }
                });
                callbackContext.success();
            }
        });

        return null;
    }

    public void fireAdEvent(String eventName) {
        String js = new CordovaEventBuilder(eventName).build();
        loadJS(js);
    }

    public void fireAdEvent(String eventName, JSONObject data) {
        String js = new CordovaEventBuilder(eventName).withData(data).build();
        loadJS(js);
    }

    private void loadJS(String js) {
        this.webView.loadUrl(js);
    }
}