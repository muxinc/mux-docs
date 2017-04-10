/*
Title: Getting Started
Sort: 1
*/

Include the jwplayer-mux file after the core JW Player javascript file in the page. Use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions). Note that the `KEY` in the example should be replaced with the key provided by JW Player for your account.

```
<!-- Include jwplayer-mux after the core JW Player favascript file -->
<script src="//content.jwplatform.com/libraries/KEY.js"></script>
<script src="//src.litix.io/jwplayer/2/jwplayer-mux.js"></script>
```

After creating you instance of JW Player, simply pass that player reference to <code>initJWPlayerMux</code> along with the options for the SDK. We recommend you retrieve the reference from the return of <code>jwplayer(id).setup({...})</code> so that Mux can track events as soon as possible.

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

## Confirming it works

After you've finished integration, you can quickly see if it's working by opening your [browser developer tools](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_are_browser_developer_tools), selecting the network tab, and then clicking 'play' on the video you've set to be monitored. You should begin to see beacons being sent to the Mux servers (litix.io) like in the example image.

<img src="/images/chrome-dev-tools.png"
srcset="/images/chrome-dev-tools.png 1x, /images/chrome-dev-tools@2x.png 2x">

For your current viewing session (called a "video view") to show up in the Mux dashboard, you need to first finish viewing the video by closing the browser window. In a few minutes you'll see the results in your Mux account. We'll also email you when the first video view has been recorded.
