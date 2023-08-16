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
import com.google.android.gms.ads.interstitial.InterstitialAd;
import com.google.android.gms.ads.interstitial.InterstitialAdLoadCallback;

class AdmobInterstitial extends CordovaPlugin {
    private static final String TAG = "AdmobBanner";
    private InterstitialAd mInterstitialAd = null;
    private String bannerAdUnitId = "ca-app-pub-3940256099942544/1033173712";
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

                InterstitialAd.load(adViewLayout.getContext(),bannerAdUnitId, adRequest,
                        new InterstitialAdLoadCallback() {
                            @Override
                            public void onAdLoaded(@NonNull InterstitialAd interstitialAd) {
                                // The mInterstitialAd reference will be null until
                                // an ad is loaded.
                                mInterstitialAd = interstitialAd;
                                Log.i(TAG, "onAdLoaded");
                                fireAdEvent("admob.interstitial.events.LOAD");
                                //mInterstitialAd.show(cordova.getActivity());

                                mInterstitialAd.setFullScreenContentCallback(new FullScreenContentCallback(){
                                    @Override
                                    public void onAdClicked() {
                                        // Called when a click is recorded for an ad.
                                        Log.d(TAG, "Ad was clicked.");
                                        fireAdEvent("admob.interstitial.events.CLICK");
                                    }

                                    @Override
                                    public void onAdDismissedFullScreenContent() {
                                        // Called when ad is dismissed.
                                        // Set the ad reference to null so you don't show the ad a second time.
                                        Log.d(TAG, "Ad dismissed fullscreen content.");
                                        mInterstitialAd = null;
                                        fireAdEvent("admob.interstitial.events.DISMISS");
                                    }

                                    @Override
                                    public void onAdFailedToShowFullScreenContent(AdError adError) {
                                        // Called when ad fails to show.
                                        Log.e(TAG, "Ad failed to show fullscreen content.");
                                        mInterstitialAd = null;
                                        fireAdEvent("admob.interstitial.events.LOAD_FAIL");
                                    }

                                    @Override
                                    public void onAdImpression() {
                                        // Called when an impression is recorded for an ad.
                                        Log.d(TAG, "Ad recorded an impression.");
                                        fireAdEvent("admob.interstitial.events.IMPRESSION");
                                    }

                                    @Override
                                    public void onAdShowedFullScreenContent() {
                                        // Called when ad is shown.
                                        Log.d(TAG, "Ad showed fullscreen content.");
                                        fireAdEvent("admob.interstitial.events.OPEN");
                                    }
                                });

                            }

                            @Override
                            public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
                                // Handle the error
                                Log.d(TAG, loadAdError.toString());
                                mInterstitialAd = null;
                                callbackContext.error("error");
                            }

                        });


                callbackContext.success();
            }
        });


        return null;
    }
    public PluginResult showAd(final CallbackContext callbackContext){
        Log.d(TAG,"showAd");
        if(mInterstitialAd == null) {
            callbackContext.error("error");
            return null;
        }
        cordova.getActivity().runOnUiThread(new Runnable() {

            @Override
            public void run() {
                mInterstitialAd.show(cordova.getActivity());
                callbackContext.success();
            }}
        );

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