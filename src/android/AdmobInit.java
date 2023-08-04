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

class AdmobInit extends CordovaPlugin {
    private AdView mAdView;
    private static final String TAG = "AdmobInit";
    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);

        // your init code here
        MobileAds.initialize(this.cordova.getContext(), new OnInitializationCompleteListener() {
            @Override
            public void onInitializationComplete(InitializationStatus initializationStatus) {
                Log.d(TAG, "Google Mobile Ads SDK Version: " + MobileAds.getVersion());
            }
        });

    }
}