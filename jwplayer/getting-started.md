/*
Title: Getting Started
Sort: 1
*/

Include the jwplayer-mux file after the core JW Player javascript file in the page. Use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions). Note that the key in the example should be replaced with the key provided by JW Player for your account.

```
<!-- Include jwplayer-mux after the core JW Player favascript file -->
<script src="//content.jwplatform.com/libraries/key.js"></script>
<script src="//src.litix.io/jwplayer/2/jwplayer-mux.js"></script>
```

After creating you instance of JW Player, simply pass that player reference to <code>initJWPlayerMux</code> along with the options for the SDK. We reccomend you retrieve the reference from the return of <code>jwplayer(id).setup({...})</code> so that Mux can track events as soon as possible.

```html
<div id="myPlayer"></div>
<script>
  var conf = {
    // Insert JW Player configuration here
  };

  var playerInitTime = Date.now();
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
  });
</script>
```
