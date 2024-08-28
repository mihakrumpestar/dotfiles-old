user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true); // enable userChrome and userContent
user_pref("findbar.modalHighlight", true);
user_pref("findbar.highlightAll", true);
user_pref("browser.toolbars.bookmarks.visibility", "never");

user_pref("browser.urlbar.shortcuts.bookmarks", false);
user_pref("browser.proton.toolbar.version", 3); // Enable toolbar
user_pref("browser.theme.toolbar-theme", 0); // Same as above

user_pref("dom.events.asyncClipboard.clipboardItem", true);

user_pref("network.protocol-handler.external.mailto", false); // Remove annoying "add application for mailto links"

// Privacy
user_pref("privacy.resistFingerprinting", true); // Instead of using CanvasBlocker extension
user_pref("privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts", true);
user_pref("webgl.disabled", true);
user_pref("media.peerconnection.enabled", false); // Disabling WebRTC
user_pref("geo.enabled", false); // Disables geolocation tracking
user_pref("privacy.firstparty.isolate", true); // Isolates cookies to the first party domain

user_pref("general.useragent.override", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.3");
