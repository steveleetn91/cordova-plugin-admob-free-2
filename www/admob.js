(()=>{"use strict";const e=cordova.exec;class s{adsCode="";class="";createAd(s=""){return this.adsCode=s,new Promise(((s,o)=>{e((()=>(console.log("Admob "+this.adsCode),s())),(()=>(console.log("Admob "+this.adsCode+" fail"),o())),this.class,"createAd",[{adsCode:this.adsCode}])}))}showAd(){return new Promise(((s,o)=>{e((()=>(console.log("Admob "+this.adsCode),s())),(()=>(console.log("Admob "+this.adsCode+" fail"),o())),this.class,"showAd",[])}))}}class o extends s{constructor(){super(),this.class="CVDAdmobBanner",this.createAd=null,this.createAd=this.createBannerView}createBannerView(s="ca-app-pub-3940256099942544/2934735716",o=0,d=0,n=0){return this.adsCode=s,new Promise(((s,a)=>{e((()=>(console.log("Admob create banner"),s())),(()=>(console.log("Admob create banner fail"),a())),this.class,"createBannerView",[{adsCode:this.adsCode,x:o,y:d,size:n}])}))}loadAd(){return new Promise(((s,o)=>{e((()=>(console.log("Admob load banner"),s())),(()=>(console.log("Admob load banner fail"),o())),this.class,"loadAd",[])}))}hiddenAd(){return new Promise(((s,o)=>{e((()=>(console.log("Admob hidden banner"),s())),(()=>(console.log("Admob hidden banner fail"),o())),this.class,"hiddenAd",[])}))}destroyAd(){return new Promise(((s,o)=>{e((()=>(console.log("Admob destroy banner"),s())),(()=>(console.log("Admob destroy banner fail"),o())),this.class,"destroyAd",[])}))}}class d extends s{constructor(){super(),this.class="CDVAdmobInterstitial"}}class n extends s{constructor(){super(),this.class="CVDAdmobReward"}}class a{adsCode="";class="";createAd(e=""){return this.adsCode=e,new Promise(((e,s)=>{window.cordova.exec((()=>(console.log("Admob "+this.adsCode),e())),(()=>(console.log("Admob "+this.adsCode+" fail"),s())),this.class,"createAd",[{adsCode:this.adsCode}])}))}showAd(){return new Promise(((e,s)=>{window.cordova.exec((()=>(console.log("Admob "+this.adsCode),e())),(()=>(console.log("Admob "+this.adsCode+" fail"),s())),this.class,"showAd",[])}))}}class r extends a{constructor(){super(),this.createAd=null,this.createAd=this.createBannerView}createBannerView(e="ca-app-pub-3940256099942544/2934735716",s=0,o=0,d=0){return this.adsCode=e,new Promise(((e,n)=>{window.cordova.exec((()=>(console.log("Admob create banner"),e())),(()=>(console.log("Admob create banner fail"),n())),this.class,"createBannerView",[{adsCode:this.adsCode,x:s,y:o,size:d}])}))}loadAd(){return new Promise(((e,s)=>{window.cordova.exec((()=>(console.log("Admob load banner"),e())),(()=>(console.log("Admob load banner fail"),s())),this.class,"loadAd",[])}))}hiddenAd(){return new Promise(((e,s)=>{window.cordova.exec((()=>(console.log("Admob hidden banner"),e())),(()=>(console.log("Admob hidden banner fail"),s())),this.class,"hiddenAd",[])}))}destroyAd(){return new Promise(((e,s)=>{window.cordova.exec((()=>(console.log("Admob destroy banner"),e())),(()=>(console.log("Admob destroy banner fail"),s())),this.class,"destroyAd",[])}))}}class t extends a{constructor(){super()}}class c extends a{constructor(){super()}}class l extends r{constructor(){super(),this.class="AdmobBanner"}}class i extends t{constructor(){super(),this.class="AdmobInterstitial"}}class A extends c{constructor(){super(),this.class="AdmobReward"}}const b={ios:new class{banner=new o;interstitial=new d;rewardvideo=new n},android:new class{banner=new l;interstitial=new i;rewardvideo=new A},test:()=>{console.log("run")}};window.nuke_admob=b,window.admob=b})();