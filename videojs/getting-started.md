Include the videojs-mux plugin after Video.js in the page (or wherever your other Video.js plugins are loaded). If you utilize any ad integrations with Video.js, include the necessary ad integration JavaScript files before the videojs-mux plugin. You can use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions).

```html
<!-- Include videojs-mux after Video.js -->
<script src="/path/to/video.js"></script>
<!-- Include other videojs plugin files here -->
<script src="//src.litix.io/videojs/2/videojs-mux.js"></script>
```

Alternatively, you can bundle videojs-mux into your own player script through `npm`. If you choose to go down this path, we suggest that you check for updates often and merge these into your player as soon as makes sense with your development schedule. The API will not change within major versions.

```bash
# For npm installs, use the following
npm install --save videojs-mux
```

Like other Video.js plugins, initialize the videojs-mux plugin by including options in the player plugin options. This can be in the options passed to the <code>videojs</code> function (or the <code>data-setup</code> attribute) or by calling the <code>mux</code> function directly on the player instance.


```javascript
// Record the player init time
var playerInitTime = Date.now();

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
        player_init_time: playerInitTime, // ex: 1451606400000

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

```html
<!-- OR in the data-setup attribute of the video.js element -->
<video id="my-player"
  data-setup='{"plugins": {"mux": {"debug": false, "data": { ... }}}}' >
  ...
</video>
```

```javascript
// OR by calling the plugin directly
var player = videojs('my-player');
player.mux({
  debug: false,
  data: { ... }
});
```
