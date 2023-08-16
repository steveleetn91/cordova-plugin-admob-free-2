package org.apache.cordova;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.LoadAdError;

class AdmobBanner extends CordovaPlugin {
    private AdView mAdView;
    private AdView adView = null;
    private String bannerAdUnitId = "ca-app-pub-3940256099942544/6300978111";
    private static final String TAG = "AdmobBanner";
    private RelativeLayout adViewLayout = null;


    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        if (action.equals("createBannerView")) {
            if(args.length() < 1) {
                Log.d(TAG,"No options");
                callbackContext.error("createAd failed");
                return false;
            }
            JSONObject option = args.getJSONObject(0);
            this.createBannerView(option, callbackContext);
            return true;
        }
        if (action.equals("showAd")) {
            this.showAd(callbackContext);
            return true;
        }
        return false;
    }
    public void createBannerView(JSONObject option,final CallbackContext callbackContext) {
        cordova.getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                float x = 0;
                float y = 0;
                int type = 0;
                if (option.has("adsCode")) {
                    bannerAdUnitId = option.optString("adsCode");
                }
                if (option.has("x")) {
                    x = option.optInt("x");
                }
                if (option.has("y")) {
                    y = option.optInt("y");
                }
                if (option.has("size")) {
                    type = option.optInt("size");
                }
                adView = new AdView(cordova.getContext());

                adView.setAdUnitId(bannerAdUnitId);
                adView.setY(y);
                adView.setX(x);
                adView.setAdSize(setSize(type));
                AdRequest adRequest = new AdRequest.Builder().build();
                adView.loadAd(adRequest);

                adView.setAdListener(new AdListener() {
                    @Override
                    public void onAdClicked() {
                        // Code to be executed when the user clicks on an ad.
                        fireAdEvent("admob.banner.events.CLICK");
                    }

                    @Override
                    public void onAdClosed() {
                        // Code to be executed when the user is about to return
                        // to the app after tapping on an ad.
                        fireAdEvent("admob.banner.events.CLOSE");
                    }

                    @Override
                    public void onAdFailedToLoad(LoadAdError adError) {
                        // Code to be executed when an ad request fails.
                        fireAdEvent("admob.banner.events.LOAD_FAIL");
                    }

                    @Override
                    public void onAdImpression() {
                        // Code to be executed when an impression is recorded
                        // for an ad.
                        fireAdEvent("admob.banner.events.IMPRESSION");
                    }

                    @Override
                    public void onAdLoaded() {
                        // Code to be executed when an ad finishes loading.
                        fireAdEvent("admob.banner.events.LOAD");
                    }

                    @Override
                    public void onAdOpened() {
                        // Code to be executed when an ad opens an overlay that
                        // covers the screen.
                        fireAdEvent("admob.banner.events.OPEN");
                    }
                });
                callbackContext.success();
            }
        });
    }
    public PluginResult showAd(final CallbackContext callbackContext){
        if(adView == null) {
            callbackContext.error("No init");
            return null;
        }
        cordova.getActivity().runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    adViewLayout = new RelativeLayout(cordova.getActivity());

                    RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.MATCH_PARENT,
                            RelativeLayout.LayoutParams.MATCH_PARENT);
                    try {
                        ((ViewGroup) (((View) webView.getClass().getMethod("getView").invoke(webView)).getParent())).addView(adViewLayout, params);
                    } catch (Exception e) {
                        ((ViewGroup) webView).addView(adViewLayout, params);
                    }

                    adViewLayout.addView(adView,params);
                    adViewLayout.bringToFront();
                    callbackContext.success();
                }
            }
        );

        return null;
    }
    public AdSize setSize(int type){
        AdSize size = AdSize.BANNER;
        switch (type) {
            default:
                size = AdSize.BANNER;
                break;
            case 0:
                size = AdSize.BANNER;
                break;
            case 1:
                size = AdSize.LARGE_BANNER;
                break;
            case 2:
                size = AdSize.MEDIUM_RECTANGLE;
                break;
            case 3:
                size = AdSize.FULL_BANNER;
                break;
            case 4:
                size = AdSize.LEADERBOARD;
                break;
        }
        return size;
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