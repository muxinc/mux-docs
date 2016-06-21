---
title: Mux API Docs

language_tabs:
  - video-element: Video Element
  - videojs: Video.js

toc_footers:
  - <a href='http://app.mux.io'>Sign Up for Mux</a>
  - Documentation Powered by <a href='https://github.com/tripit/slate'>Slate</a>

search: true
---

# SDK Integration

While Mux is still in early development we support two browser-based video players: **Video.js** and the bare **HTML5 video element**. More players and platforms, including other desktop players, native SDKs for iOS and Android, and SDKs for OTT platforms are coming soon.

Pick which SDK you want to use from the tabs on the right (or in the nav on mobile).

## Including the SDK

```video-element--html
<script src="//src.litix.io/core/2/mux.js"></script>
```

<p class="lang-specific video-element">
  Include the Mux JavaScript SDK on every page of your site/app that includes video. Use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions).
</p>

```videojs--html
<!-- Include videojs-mux after Video.js -->
<script src="/path/to/video.js"></script>
<!-- Include any ad-specific files here -->
<script src="//src.litix.io/videojs/2/videojs-mux.js"></script>
```

<p class="lang-specific videojs">
  Include the videojs-mux plugin after Video.js in the page (or wherever your other Video.js plugins are loaded). If you utilize any ad integrations with Video.js, include the necessary ad integration JavaScript files before the videojs-mux plugin.
</p>

## Initializing

```video-element--html
<!-- Example html video element -->
<video id="my-video"></video>

<script>
// Initialize mux monitoring
mux.monitor('#my-video', {
  debug: false,
  data: {
    property_key: 'EXAMPLE_PROPERTY_KEY', // required
    page_type: '', // (see docs) 'watchpage', 'iframe', or leave empty
    viewer_user_id: '', // ex: '12345'

    // Player Metadata
    player_name: '', // ex: 'My Main Player'
    player_version: '', // ex: '1.0.0'

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
    video_is_live: false, // e.g. false or true
    video_encoding_variant: '', // ex: 'Variant 1'
    video_cdn: '' // ex: 'Fastly', 'Akamai'
  }
});
</script>
```

<p class="lang-specific video-element">
  To monitor the performance of a specific video element, call <code>mux.monitor</code>, passing a valid CSS selector for your video element along with options for the SDK. This selector must return only a single element (the <code>&ltvideo&gt</code> element that is tracked), and should be used in any further calls to mux for the same player, such as when <a href="#changing-the-video">changing the video</a>.
</p>

```videojs
// Initialize through player options
videojs('my-player', {
  plugins: {
    mux: {
      debug: false,
      data: {
        property_key: 'EXAMPLE_PROPERTY_KEY', // required
        page_type: '', // (see docs) 'watchpage', 'iframe', or leave empty
        viewer_user_id: '', // ex: '12345'

        // Player Metadata
        player_name: '', // ex: 'My Main Player'
        player_version: '', // ex: '1.0.0'

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
        video_is_live: false, // e.g. false or true
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

### SDK Options

Name	| Description	| Default
----------- | ----------- | --------
debug	| Put the SDK in debug mode to log operational details	| false
data | User, page, player, and video metadata for the video | { }

### Metadata

The data object allows you to provide details about the video and environment that can't be detected automatically or if the video fails to load.

All metadata details except for `property_key` are *optional*, however you'll be able to compare and see more interesting results as you include more details.

- Video details (prepended by `video_`) describe the current video that's playing and are all reset automatically when [changing the video](#changing-the-video). This metadata would come from your internal CMS or video management system.
- Player details (prepended by `player_`) describe the player configuration that's being used and should be set whenever monitoring is started on a new player. They do not reset when the video is changed.
- All other details can be set once per page load, and after being set they will persist between videos and player instances on a page.

Name	| Description
----- | -----------
property_key | Your property key from the Mux dashboard
viewer_user_id | Provide a user ID (if available) to search by in the Mux UI
page_type | Provide the context of the page for more specific analysis. Values include 'watchpage', 'iframe', or leave empty. <ul><li>**watchpage** &mdash; A web page that is dedicated to playing a specific video (for example [youtube.com/watch/ID](https://www.youtube.com/watch?v=WtA-IWdLMN0) or [hulu.com/watch/ID](http://www.hulu.com/watch/4183))</li><li>**iframe** &mdash; An iframe specifically used to embed a player on different sites/pages</li></ul>
player_name | If you have different configurations or types of players around your site or application you can use player_name to compare them. **This is *not* the player software (e.g. Video.js), which is tracked automatically by the SDK.**
player_version | As you make changes to your player you can compare how new versions of your player perform by updating this value. **This is *not* the player software version (e.g. Video.js 5.0.0), which is tracked automatically by the SDK.**
video_id | Your internal ID for the video
video_title | example: 'Awesome Show Episode 1'
video_series | example: 'Season 1'
video_variant_name | An optional detail that allows you to monitor issues with the files of specific versions of the content, for example different audio translations or versions with hard-coded/burned-in subtitles.
video_variant_id | Your internal ID for a video variant
video_language_code | The audio language of the video, assuming it's unchangeable after playing.
video_content_type | 'short', 'movie', 'episode', 'clip', 'trailer', or 'event'
video_duration | The length of the video in **milliseconds** [integer]
video_stream_type | 'live' or 'on-demand'
video_is_live | Boolean indicating if the video is a live stream or not
video_producer | The producer of the video title
video_encoding_variant | An optional detail that allows you to compare different encoding settings.
video_cdn | An optional detail that allows you to compare different CDNs (assuming the CDN selection is made at page load time).

## Changing the Video

```video-element
// Example of changing the source of a video element
// Should happen before emitting the videochange event
var myVideo = document.querySelector('#my-video');
myVideo.src = 'nextVideo.mp4';

mux.emit('#my-video', 'videochange', {
  video_id: 'abc345',
  video_title: 'My Other Great Video',
  video_series: 'Weekly Great Videos',
  ...
});
```

```videojs
// Example of changing the source of a Video.js player
// Should happen before emitting the videochange event
var myPlayer = videojs('my-player');
myPlayer.src('nextVideo.mp4');

myPlayer.mux.emit('videochange', {
  video_id: 'abc345',
  video_title: 'My Other Great Video',
  video_series: 'Weekly Great Videos',
  ...
});
```

When you change to a new video (in the same player) you need to update the information that Mux knows about the current video. Examples of when this is needed are:

* The player advances to the next video in a playlist
* The user selects a different video to play

**You do not need to change the video info when changing to a different source of the same video content (e.g. different resolution or video format).**

It's best to change the video info immediately after telling the player which new source to play.

This is done by emitting a `videochange` event through `mux`, and when this is emitted it removes all previous video data and resets all metrics for the video view. See [Metadata](#metadata) for the list of video details you can provide. You can include any metadata when changing the video but you only need to update the values that start with `video_`.

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
