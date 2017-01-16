You must register an <code>onCreate</code> handler when you create the Ooyala player, and in that callback simply pass that player reference to <code>initOoyalaMux</code> along with the options for the SDK.

```html
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

