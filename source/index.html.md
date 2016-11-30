---
title: Mux API Docs

language_tabs:
  - video-element: Video Element
  - videojs: Video.js
  - jwplayer: JW Player
  - bitmovin: Bitmovin
  - ooyala: Ooyala
  - objective-c: iOS/tvOS

toc_footers:
  - <a href='https://mux.com/sales-contact'>Sign Up for Mux</a>

search: true
---

# SDK Integration

Mux has integrations with the following web players and native environments:

* HTML5 Video Element
* Video.js (also supports Brightcove players version 5.x)
* JW Player 7
* Bitmovin Player 5.x and 6.x
* Ooyala Player V4
* iOS 8+ and tvOS 9+ (Objective-C)

More players and platforms will be added as they become available. If you are interested in an integration that is not listed, please [contact us](https://mux.com/sales-contact) as we may have plans for that platform already.

Pick which SDK you want to use from the tabs on the right (or in the nav on mobile).

## Including the SDK

```video-element--html
<script src="//src.litix.io/core/2/mux.js"></script>
```
```video-element--shell
# For npm installs, use the following
$ npm install --save mux-embed
```

<p class="lang-specific video-element">
  Include the Mux JavaScript SDK on every page of your site/app that includes video. You can use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions).
  <br><br>
  Alternatively, you can bundle Mux into your own player script through <code>npm</code>. If you choose to go down this path, we suggest that you check for updates often and merge these into your player as soon as makes sense with your development schedule. The API will not change within major versions.
</p>

```videojs--html
<!-- Include videojs-mux after Video.js -->
<script src="/path/to/video.js"></script>
<!-- Include other videojs plugin files here -->
<script src="//src.litix.io/videojs/2/videojs-mux.js"></script>
```
```videojs--shell
# For npm installs, use the following
$ npm install --save videojs-mux
```

<p class="lang-specific videojs">
  Include the videojs-mux plugin after Video.js in the page (or wherever your other Video.js plugins are loaded). If you utilize any ad integrations with Video.js, include the necessary ad integration JavaScript files before the videojs-mux plugin. You can use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions).
  <br><br>
  Alternatively, you can bundle videojs-mux into your own player script through <code>npm</code>. If you choose to go down this path, we suggest that you check for updates often and merge these into your player as soon as makes sense with your development schedule. The API will not change within major versions.
</p>

```jwplayer--html
<!-- Include jwplayer-mux after the core JW Player favascript file -->
<script src="//content.jwplatform.com/libraries/key.js"></script>
<script src="//src.litix.io/jwplayer/2/jwplayer-mux.js"></script>
```

<p class="lang-specific jwplayer">
  Include the jwplayer-mux file after the core JW Player javascript file in the page. Use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions). Note that <code>key</code> in the example on the right should be replaced with the key provided by JW Player for your account.
</p>

```bitmovin--html
<!-- Include bitmovin-mux after the core Bitmovin javascript file -->
<script src="//bitmovin-a.akamaihd.net/bitmovin-player/stable/6/bitmovinplayer.min.js"></script>
<script src="//src.litix.io/bitmovin/2/bitmovin-mux.js"></script>
```

<p class="lang-specific bitmovin">
  Include the bitmovin-mux file after the core Bitmovin javascript file in the page. Use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions). Note that <code>stable</code> and <code>6</code> in the example on the right can be replaced with the Release Channel and player version (5 or 6), respectively, that you want to use.
</p>

```ooyala--html
<!-- Include ooyala-mux after the core Ooyala javascript files -->
<script src="//player.ooyala.com/static/v4/stable/latest/core.min.js"></script>
<!-- Insert other Ooyala plugin files here -->
<script src="//src.litix.io/ooyala/2/ooyala-mux.js"></script>
```

<p class="lang-specific ooyala">
  Include the bitmovin-mux file after the core Bitmovin javascript file in the page. Use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions). Note that <code>stable</code> and <code>6</code> in the example on the right can be replaced with the Release Channel and player version (5 or 6), respectively, that you want to use.
</p>

```objective-c--shell
$ git clone https://github.com/muxinc/stats-sdk-objc.git
```
```objective-c
// for iOS
@import MUXSDKStats;

// for tvOS
@import MUXSDKStatsTv;
```

<p class="lang-specific objective-c">
  Include the correct Mux Objective-C SDK for your project by cloning our repository and dragging the framework into your Xcode project. The <code>Frameworks</code> folder contains two folders, one for iOS and one for tvOS. Inside these folders, there are 3 additional folders containing different architecture combinations. The <code>fat</code> folder contains a library with all architectures in one. This library cannot be used when compiling for submission to the App Store as it contains the simulator architectures that are not used by any Apple devices. You can use the framework in the <code>release</code> folder when building a release version of your application, or you can run <a href="https://gist.github.com/brett-stover-hs/b25947a125ff7e38e7ca#file-frameworks_blogpost_removal_script_a-sh" target="_blank">a script to strip unneeded architectures</a>. Finally, don't forget to add the correct import statement for your target platform.
</p>

## Initializing

```video-element--html
<!-- Example html video element -->
<video id="myVideo">
  <source src="//path/to/video.mp4" type="video/mp4">
</video>

<script>
// Initialize mux monitoring
if (typeof mux !== 'undefined') {
  mux.monitor('#myVideo', {
    debug: false,
    data: {
      property_key: 'EXAMPLE_PROPERTY_KEY', // required
      page_type: '', // (see docs) 'watchpage', 'iframe', or leave empty
      viewer_user_id: '', // ex: '12345'
      experiment_name: '', // ex: 'player_test_A'

      // Player Metadata
      player_name: '', // ex: 'My Main Player'
      player_version: '', // ex: '1.0.0'
      player_init_time: '', // ex: 1451606400000

      // Video Metadata (cleared with 'videochange' event)
      video_id: '', // ex: 'abcd123'
      video_title: '', // ex: 'My Great Video'
      video_series: '', // ex: 'Weekly Great Videos'
      video_producer: '', // ex: 'Bob the Producer'
      video_content_type: '', // 'short', 'movie', 'episode', 'clip', 'trailer', or 'event'
      video_language_code: '', // ex: 'en'
      video_variant_name: '', // ex: 'Spanish Hard Subs'
      video_variant_id: '', // ex: 'abcd1234'
      video_duration: '', // in milliseconds, ex: 120000
      video_stream_type: '', // 'live' or 'on-demand'
      video_encoding_variant: '', // ex: 'Variant 1'
      video_cdn: '' // ex: 'Fastly', 'Akamai'
    }
  });
}
</script>
```

<p class="lang-specific video-element">
  To monitor the performance of a specific video element, call <code>mux.monitor</code>, passing options for the SDK along with either a valid CSS selector for your video element or a reference to the video element itself. If you pass a selector, it must return only a single element (the <code>&ltvideo&gt</code> element that is tracked). Any further calls to <code>mux</code> for the same player (such as when <a href="#changing-the-video">changing the video</a>) can be passed either the selector or the reference to the video element.
</p>

```videojs
// Record the player init time
var player_init_time = Date.now();

// Initialize through player options
videojs('my-player', {
  plugins: {
    mux: {
      debug: false,
      data: {
        property_key: 'EXAMPLE_PROPERTY_KEY', // required
        page_type: '', // (see docs) 'watchpage', 'iframe', or leave empty
        viewer_user_id: '', // ex: '12345'
        experiment_name: '', // ex: 'player_test_A'

        // Player Metadata
        player_name: '', // ex: 'My Main Player'
        player_version: '', // ex: '1.0.0'
        player_init_time: player_init_time, // ex: 1451606400000

        // Video Metadata (cleared with 'videochange' event)
        video_id: '', // ex: 'abcd123'
        video_title: '', // ex: 'My Great Video'
        video_series: '', // ex: 'Weekly Great Videos'
        video_producer: '', // ex: 'Bob the Producer'
        video_content_type: '', // 'short', 'movie', 'episode', 'clip', 'trailer', or 'event'
        video_language_code: '', // ex: 'en'
        video_variant_name: '', // ex: 'Spanish Hard Subs'
        video_variant_id: '', // ex: 'abcd1234'
        video_duration: '', // in milliseconds, ex: 120000
        video_stream_type: '', // 'live' or 'on-demand'
        video_encoding_variant: '', // ex: 'Variant 1'
        video_cdn: '' // ex: 'Fastly', 'Akamai'
      }
    }
  }
});
```
```videojs--html
<!-- OR in the data-setup attribute of the video.js element -->
<video id="my-player"
  data-setup='{"plugins": {"mux": {"debug": false, "data": { ... }}}}' >
  ...
</video>
```
```videojs
// OR by calling the plugin directly
var player = videojs('my-player');
player.mux({
  debug: false,
  data: { ... }
});
```

<p class="lang-specific videojs">
  Like other Video.js plugins, initialize the videojs-mux plugin by including options in the player plugin options. This can be in the options passed to the <code>videojs</code> function (or the <code>data-setup</code> attribute) or by calling the <code>mux</code> function directly on the player instance.
</p>

```jwplayer--html
<div id="myPlayer"></div>
<script>
  var conf = {
    // Insert JW Player configuration here
  };

  var player = jwplayer('myPlayer').setup(conf);

  initJWPlayerMux(player, {
    debug: false,
    data: {
      property_key: 'EXAMPLE_PROPERTY_KEY', // required
      page_type: '', // (see docs) 'watchpage', 'iframe', or leave empty
      viewer_user_id: '', // ex: '12345'
      experiment_name: '', // ex: 'player_test_A'

      // Player Metadata
      player_name: '', // ex: 'My Main Player'
      player_version: '', // ex: '1.0.0'
      player_init_time: player_init_time, // ex: 1451606400000

      // Video Metadata (cleared with 'videochange' event)
      video_id: '', // ex: 'abcd123'
      video_title: '', // ex: 'My Great Video'
      video_series: '', // ex: 'Weekly Great Videos'
      video_producer: '', // ex: 'Bob the Producer'
      video_content_type: '', // 'short', 'movie', 'episode', 'clip', 'trailer', or 'event'
      video_language_code: '', // ex: 'en'
      video_variant_name: '', // ex: 'Spanish Hard Subs'
      video_variant_id: '', // ex: 'abcd1234'
      video_duration: '', // in milliseconds, ex: 120000
      video_stream_type: '', // 'live' or 'on-demand'
      video_encoding_variant: '', // ex: 'Variant 1'
      video_cdn: '' // ex: 'Fastly', 'Akamai'
    }
  });
</script>
```

<p class="lang-specific jwplayer">
  After creating you instance of JW Player, simply pass that player reference to <code>initJWPlayerMux</code> along with the options for the SDK. It is preferred to retrieve the reference from the return of <code>jwplayer(id).setup({...})</code> so that Mux can track events as soon as possible.
</p>

```bitmovin--html
<div id="playerdiv"></div>
<script>
  var conf = {
    // Insert Bitmovin player configuration here
  };

  // For 5.x of Bitmovin's player, use `bitdash.('playerdiv')`
  var player = bitmovin.player('playerdiv');
  player.setup(conf);

  initBitmovinMux(player, {
    debug: false,
    data: {
      property_key: 'EXAMPLE_PROPERTY_KEY', // required
      page_type: '', // (see docs) 'watchpage', 'iframe', or leave empty
      viewer_user_id: '', // ex: '12345'
      experiment_name: '', // ex: 'player_test_A'

      // Player Metadata
      player_name: '', // ex: 'My Main Player'
      player_version: '', // ex: '1.0.0'
      player_init_time: player_init_time, // ex: 1451606400000

      // Video Metadata (cleared with 'videochange' event)
      video_id: '', // ex: 'abcd123'
      video_title: '', // ex: 'My Great Video'
      video_series: '', // ex: 'Weekly Great Videos'
      video_producer: '', // ex: 'Bob the Producer'
      video_content_type: '', // 'short', 'movie', 'episode', 'clip', 'trailer', or 'event'
      video_language_code: '', // ex: 'en'
      video_variant_name: '', // ex: 'Spanish Hard Subs'
      video_variant_id: '', // ex: 'abcd1234'
      video_duration: '', // in milliseconds, ex: 120000
      video_stream_type: '', // 'live' or 'on-demand'
      video_encoding_variant: '', // ex: 'Variant 1'
      video_cdn: '' // ex: 'Fastly', 'Akamai'
    }
  });
</script>
```

<p class="lang-specific bitmovin">
  After creating the instance of the Bitmovin player, simply pass that player reference to <code>initBitmovinMux</code> along with the options for the SDK. It is preferred to retrieve the reference from the return of <code>bitmovin.player(id)</code> rather than on a player callback so that Mux can track events as soon as possible.
</p>

```ooyala--html
<div id="playerdiv"></div>
<script>
  // Use a callback for when the player is created to register Mux
  var onPlayerCreated = function (player) {
    initOoyalaMux(player, {
      debug: false,
      data: {
        property_key: 'EXAMPLE_PROPERTY_KEY', // required
        page_type: '', // (see docs) 'watchpage', 'iframe', or leave empty
        viewer_user_id: '', // ex: '12345'
        experiment_name: '', // ex: 'player_test_A'

        // Player Metadata
        player_name: '', // ex: 'My Main Player'
        player_version: '', // ex: '1.0.0'
        player_init_time: player_init_time, // ex: 1451606400000

        // Video Metadata (cleared with 'videochange' event)
        video_id: '', // ex: 'abcd123'
        video_title: '', // ex: 'My Great Video'
        video_series: '', // ex: 'Weekly Great Videos'
        video_producer: '', // ex: 'Bob the Producer'
        video_content_type: '', // 'short', 'movie', 'episode', 'clip', 'trailer', or 'event'
        video_language_code: '', // ex: 'en'
        video_variant_name: '', // ex: 'Spanish Hard Subs'
        video_variant_id: '', // ex: 'abcd1234'
        video_duration: '', // in milliseconds, ex: 120000
        video_stream_type: '', // 'live' or 'on-demand'
        video_encoding_variant: '', // ex: 'Variant 1'
        video_cdn: '' // ex: 'Fastly', 'Akamai'
      }
    });
  };

  var asset = {
    // Insert Ooyala asset configuration here
  };
  var playerConfig = {
    "onCreate": onPlayerCreated,
    // Insert other Ooyala player configuration (e.g. autoplay etc) here
  };

  // Create the player with the Mux callback
  OO.ready(function() {
    OO.player.create('playerdiv', asset, playerConfig)
  });
</script>
```

<p class="lang-specific ooyala">
  You must register an <code>onCreate</code> handler when you create the Ooyala player, and in that callback simply pass that player reference to <code>initOoyalaMux</code> along with the options for the SDK.
</p>


```objective-c
// Property and player data that persists until the player is destroyed
MUXSDKCustomerPlayerData *playerData = [[MUXSDKCustomerPlayerData alloc] initWithPropertyKey:@"EXAMPLE_PROPERTY_KEY"];
playerData.viewerUserId = @"1234";
playerData.experimentName = @"player_test_A";
playerData.playerName = @"My Main Player";
playerData.playerVersion = @"1.0.0";

// Video metadata (cleared with videoChangeForPlayer:withVideoData:)
MUXSDKCustomerVideoData *videoData = [MUXSDKCustomerVideoData new];
videoData.videoId = @"abcd123";
videoData.videoTitle = @"My Great Video";
videoData.videoSeries = @"Weekly Great Videos";
videoData.videoProducer = @"Bob the Producer";
videoData.videoContentType = @"type";
videoData.videoLanguageCode = @"en";
videoData.videoVariantName = @"Spanish Hard Subs";
videoData.videoVariantId = @"abcd1234";
videoData.videoDuration = @(120000); // in millisecons
videoData.videoIsLive = @NO;
videoData.videoEncodingVariant = @"Variant 1";
videoData.videoCdn = @"cdn";

AVPlayerLayer *player = [AVPlayerLayer new];
[MUXSDKStats monitorAVPlayerViewController:player withPlayerName:@"awesome" playerData:playerData videoData:videoData];
```

<p class="lang-specific objective-c">
  To monitor the performance of an AVPlayer, call either <code>monitorAVPlayerViewController:withPlayerName:playerData:videoData:</code> or <code>monitorAVPlayerLayer:withPlayerName:playerData:videoData:</code>, passing a pointer to your AVPlayer container (either the <code>AVPlayerLayer</code> or <code>AVPlayerViewController</code>) to the SDK. When calling <code>destroyPlayer</code> or <code>videoChangeForPlayer:withVideoData:</code> to <a href="#changing-the-video">change the video</a> the same player name used for the monitor call must be used.
</p>

### SDK Options

Name	| Description	| Default
----------- | ----------- | --------
debug	| Put the SDK in debug mode to log operational details	| false
data | User, page, player, and video metadata for the video | { }

<p class="lang-specific objective-c">
  In the Objective-C SDKs, <strong>options are provided via the MUXSDKCustomerPlayerData and MUXSDKCustomerVideoData objects</strong>.
</p>

### Metadata

The data object allows you to provide details about the video and environment that can't be detected automatically or if the video fails to load.

All metadata details except for `property_key` are *optional*, however you'll be able to compare and see more interesting results as you include more details.

- Video details (prepended by `video_`) describe the current video that's playing and are all reset automatically when [changing the video](#changing-the-video). This metadata would come from your internal CMS or video management system.
- Player details (prepended by `player_`) describe the player configuration that's being used and should be set whenever monitoring is started on a new player. They do not reset when the video is changed.
- All other details will persist until explicitly changed.

<p class="lang-specific objective-c">
In the Objective-C SDKs, <strong>names are converted to lowerCamelCase setters and getters per Apple's naming guidelines</strong>. See the <a href="https://github.com/muxinc/stats-sdk-objc/blob/master/Frameworks/iOS/release/MUXSDKStats.framework/Headers/MUXSDKCustomerPlayerData.h" target="_blank">MUXSDKCustomerPlayerData.h</a> and <a href="https://github.com/muxinc/stats-sdk-objc/blob/master/Frameworks/iOS/release/MUXSDKStats.framework/Headers/MUXSDKCustomerVideoData.h" target="_blank">MUXSDKCustomerVideoData.h</a> header files for a complete list of names.
</p>

Name	| Description
----- | -----------
property_key | Your property key from the Mux dashboard
viewer_user_id | Provide a user ID (if available) to search by in the Mux UI
page_type | Provide the context of the page for more specific analysis. Values include 'watchpage', 'iframe', or leave empty. <ul><li>**watchpage** &mdash; A web page that is dedicated to playing a specific video (for example [youtube.com/watch/ID](https://www.youtube.com/watch?v=WtA-IWdLMN0) or [hulu.com/watch/ID](http://www.hulu.com/watch/4183))</li><li>**iframe** &mdash; An iframe specifically used to embed a player on different sites/pages</li></ul>
experiment_name | You can use this field to separate views into different experiments, if you would like to filter by this dimension later. This should be a string value, but your account is limited to a total of 10 unique experiment names, so be sure that this value is not generated dynamically or randomly.
player_name | If you have different configurations or types of players around your site or application you can use player_name to compare them. **This is *not* the player software (e.g. Video.js), which is tracked automatically by the SDK.**
player_version | As you make changes to your player you can compare how new versions of your player perform by updating this value. **This is *not* the player software version (e.g. Video.js 5.0.0), which is tracked automatically by the SDK.**
player_init_time | If you are explicitly loading your player in page (perhaps as a response to a user interaction), include the timestamp (milliseconds since Jan 1 1970) when you initialize the player (or for HTML5 video, when right before you add the `<video>` element to the DOM) in order to accurately track page load time and player startup time.
video_id | Your internal ID for the video
video_title | example: 'Awesome Show Episode 1'
video_series | example: 'Season 1'
video_variant_name | An optional detail that allows you to monitor issues with the files of specific versions of the content, for example different audio translations or versions with hard-coded/burned-in subtitles.
video_variant_id | Your internal ID for a video variant
video_language_code | The audio language of the video, assuming it's unchangeable after playing.
video_content_type | 'short', 'movie', 'episode', 'clip', 'trailer', or 'event'
video_duration | The length of the video in **milliseconds** [integer]
video_stream_type | 'live' or 'on-demand'
video_producer | The producer of the video title
video_encoding_variant | An optional detail that allows you to compare different encoding settings.
video_cdn | An optional detail that allows you to compare different CDNs (assuming the CDN selection is made at page load time).

## Changing the Video

```video-element
// Example of changing the source of a video element
// Should happen before emitting the videochange event
var myVideo = document.querySelector('#myVideo');
myVideo.src = 'nextVideo.mp4';

if (typeof mux !== 'undefined') {
  mux.emit('#myVideo', 'videochange', {
    video_id: 'abc345',
    video_title: 'My Other Great Video',
    video_series: 'Weekly Great Videos',
    ...
  });
}
```

```videojs
// Call this immediately after loading the new video into the player
player.mux.emit('videochange', {
  video_id: 'abc345',
  video_title: 'My Other Great Video',
  video_series: 'Weekly Great Videos',
  ...
});
```

```jwplayer
// Call this immediately after loading the new video into the player
player.mux.emit('videochange', {
  video_id: 'abc345',
  video_title: 'My Other Great Video',
  video_series: 'Weekly Great Videos',
  ...
});
```

```bitmovin
// Call this immediately after loading the new video into the player
player.mux.emit('videochange', {
  video_id: 'abc345',
  video_title: 'My Other Great Video',
  video_series: 'Weekly Great Videos',
  ...
});
```

```ooyala
// Call this immediately after loading the new video into the player
player.mux.emit('videochange', {
  video_id: 'abc345',
  video_title: 'My Other Great Video',
  video_series: 'Weekly Great Videos',
  ...
});
```

```objective-c
// Example of changing the AVPlayerItem
// Should happen before telling MUXSDKStats about the change.
[player replaceCurrentItemWithPlayerItem:[AVPlayerItem playerItemWithURL:@"..."]];

MUXSDKCustomerVideoData *videoData = [MUXSDKCustomerVideoData new];
videoData.videoId = @"abcd345";
videoData.videoTitle = @"My Other Great Video";
videoData.videoSeries = @"Weekly Great Videos";
[MUXSDKStats videoChangeForPlayer:@"awesome" withVideoData:videoData];
```

When you change to a new video (in the same player) you need to update the information that Mux knows about the current video. Examples of when this is needed are:

* The player advances to the next video in a playlist
* The user selects a different video to play

**You do not need to change the video info when changing to a different source of the same video content (e.g. different resolution or video format).**

<p class="lang-specific video-element videojs jwplayer bitmovin ooyala">
It's best to change the video info immediately after telling the player which new source to play.
<p>

<p class="lang-specific objective-c">
It's best to change the video info immediately before telling the player which new source to play.
<p>

<p class="lang-specific video-element">
This is done by emitting a <code>videochange</code> event via <code>mux.emit</code> in page. When this is emitted, it removes all previous video data and resets all metrics for the video view. See <a href="#metadata">Metadata</a> for the list of video details you can provide. You can include any metadata when changing the video but you should only need to update the values that start with <code>video_</code>.
</p>

<p class="lang-specific videojs jwplayer bitmovin ooyala">
This is done by emitting a <code>videochange</code> event via <code>mux.emit</code> which has been added to the <code>player</code> object. When this is emitted it removes all previous video data and resets all metrics for the video view. See <a href="#metadata">Metadata</a> for the list of video details you can provide. You can include any metadata when changing the video but you should only need to update the values that start with <code>video_</code>.
</p>

<p class="lang-specific objective-c">
This is done by calling <code>videoChangeForPlayer:withVideoData:</code> which will remove all previous video data and reset all metrics for the video view. See <a href="#metadata">Metadata</a> for the list of video details you can provide. You can include any metadata when changing the video but you should only need to update the values that start with <code>video_</code>.
</p>

## Sending Custom Error Events

```video-element
mux.emit('#myVideo', 'error', {
  error_code: 100,
  error_message: 'Description of error'
});
```

```videojs
player.mux.emit('error', {
  error_code: 100,
  error_message: 'Description of error'
});
```

```jwplayer
player.mux.emit('error', {
  error_code: 100,
  error_message: 'Description of error'
});
```

```bitmovin
player.mux.emit('error', {
  error_code: 100,
  error_message: 'Description of error'
});
```

```ooyala
player.mux.emit('error', {
  error_code: 100,
  error_message: 'Description of error'
});
```

<p class="lang-specific video-element videojs jwplayer bitmovin ooyala">
Mux currently tracks fatal errors that are triggered by the player in use. However, in some cases, such as third-party HLS libraries for web players, fatal errors may occur outside of the context of the player. To handle these cases, Mux exposes a type of event that can be triggered via javascript. <strong>This event should only be used for fatal errors. Do not use this for "errors" that do not result in playback failure.</strong>
<br><br>
When triggering an error event, it is important to provide an <code>error_code</code> and <code>error_message</code> in an object as the second parameter. The <code>error_message</code> should provide a detailed description of the error as it happened. The <code>error_code</code> must be an integer, and should provide a category of the error. If the errors match up with the <a href="https://developer.mozilla.org/en-US/docs/Web/API/MediaError" target="_blank">HTML Media Element Error</a>, you can use the same codes as the corresponding HTML errors. However, for custom errors, you should choose a number greater than or equal to 100. Whether all errors use the same code or you use different codes for different types of errors is up to you. In general you should not send a distinct code for each possible error message, but rather group similar errors under the same code. For instance, if your library has two different conditions for network errors, both should have the same <code>error_code</code> but different messages.
</p>

<p class="lang-specific objective-c">
There is currently no way to fire custom error events for iOS/tvOS. Mux automatically tracks any errors that are triggered by the underlying video player.
</p>

## Ad Support

<p class="lang-specific video-element">
There are currently no ad integrations supported for the core HTML Video Element integration. Ads will work fine, but will not be tracked.
</p>

<p class="lang-specific videojs">
Mux supports <a href="https://github.com/googleads/videojs-ima" target="_blank">videojs-ima</a>, as well as Brightcove's IMA3, FreeWheel, and OnceUX plugins. Simply configure these plugins as you would normally, and Mux will track ads automatically. No additional configuration is needed.
</p>

<p class="lang-specific jwplayer">
Mux has been tested with and supports JW Player's <code>vast</code> integration for pre-, mid-, and post-roll ads. Simply configure these plugins as you would normally, and Mux will track ads automatically. No additional configuration is needed.
<br><br>
Other JW Player ad integrations, such as <code>googima</code> and <code>freewheel</code> have not been tested, but may work out of the box. Please <a href="mailto:help@mux.com">contact us</a> with any questions.
</p>

<p class="lang-specific bitmovin">
Mux has been tested with and supports Bitmovin's <code>vast</code> advertising client for pre-, mid-, and post-roll ads. Simply configure these plugins as you would normally, and Mux will track ads automatically. No additional configuration is needed.
</p>

<p class="lang-specific ooyala">
Mux has been tested with and supports Ooyala's <code>google-ima-ads-manager</code>. Simply configure these plugins as you would normally, and Mux will track ads automatically. No additional configuration is needed.
<br><br>
Other Ooyala ad integrations, such as <code>FreeWheel</code> and <code>VAST/VPAID</code> may work out of the box. Please <a href="mailto:help@mux.com">contact us</a> with any questions.
</p>

<p class="lang-specific objective-c">
There are currently no ad integrations supported for iOS and tvOS. Ads will work fine, but will not be tracked appropriately.
</p>

<!-- hackety hack hack to make left nav work better -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
