package org.apache.cordova;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.MobileAds;
import com.google.android.gms.ads.initialization.InitializationStatus;
import com.google.android.gms.ads.initialization.OnInitializationCompleteListener;

import io.cordova.hellocordova.MainActivity;

class AdmobBanner extends CordovaPlugin {
    private AdView mAdView;
    private AdView adView;
    private String bannerAdUnitId;
    private static final String TAG = "AdmobInit";
    private RelativeLayout adViewLayout = null;
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if(args.length() < 1) {
            Log.d(TAG,"No options");
            callbackContext.error("createAd failed");
            return false;
        }
        if (action.equals("createAd")) {
            JSONObject option = args.getJSONObject(0);
            this.createAd(option, callbackContext);
            return true;
        }
        return false;
    }
    public void createAd(JSONObject option,final CallbackContext callbackContext) {
        cordova.getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (option.has("adsCode")) {
                    bannerAdUnitId = option.optString("adsCode");
                }
                AdView adView = new AdView(cordova.getContext());
                adView.setAdSize(AdSize.BANNER);

                adView.setAdUnitId(bannerAdUnitId);
                adView.setY(0);
                AdRequest adRequest = new AdRequest.Builder().build();
                adView.loadAd(adRequest);
                adViewLayout = new RelativeLayout(cordova.getActivity());
                RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.MATCH_PARENT,
                        RelativeLayout.LayoutParams.MATCH_PARENT);
                ((ViewGroup) webView).addView(adViewLayout, params);
                adViewLayout.addView(adView,params);
                adViewLayout.bringToFront();
                callbackContext.success();
            }
        });
    }
}