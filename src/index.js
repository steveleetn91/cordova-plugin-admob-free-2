import iOSAdmob from './js/ios/admob'
import androidAdmob from './js/android/admob'


/**
 *@ IOS
*/
export function iOS() {
  return new iOSAdmob();
}
export function android() {
  return new androidAdmob();
}
const admob = {
    ios: iOS(),
    android: android() 
}
window.nuke_admob = admob;
export default admob;