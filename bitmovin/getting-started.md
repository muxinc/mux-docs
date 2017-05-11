/*
Title: Getting Started
Sort: 1
*/

Include the bitmovin-mux file after the core Bitmovin javascript file in the page. Use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions). Note that `stable` and `6` in the example can be replaced with the Release Channel and player version (5 or 6), respectively, that you want to use.

```
<!-- Include bitmovin-mux after the core Bitmovin javascript file -->
<script src="https://bitmovin-a.akamaihd.net/bitmovin-player/stable/6/bitmovinplayer.min.js"></script>
<script src="https://src.litix.io/bitmovin/2/bitmovin-mux.js"></script>
```

After creating the instance of the Bitmovin player, simply pass that player reference to <code>initBitmovinMux</code> along with the options for the SDK. It is preferred to retrieve the reference from the return of <code>bitmovin.player(id)</code> rather than on a player callback so that Mux can track events as soon as possible.

```html
<div id="playerdiv"></div>
<script>
  var conf = {
    // Insert Bitmovin player configuration here
  };

  var playerInitTime = Date.now();

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

## Confirming it works

After you've finished integration, you can quickly see if it's working by opening your [browser developer tools](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_are_browser_developer_tools), selecting the network tab, and then clicking 'play' on the video you've set to be monitored. You should begin to see beacons being sent to the Mux servers (litix.io) like in the example image.

<img src="/images/chrome-dev-tools.png"
srcset="/images/chrome-dev-tools.png 1x, /images/chrome-dev-tools@2x.png 2x">

For your current viewing session (called a "video view") to show up in the Mux dashboard, you need to first finish viewing the video by closing or reloading the browser window. In a few minutes you'll see the results in your Mux account. We'll also email you when the first video view has been recorded.
