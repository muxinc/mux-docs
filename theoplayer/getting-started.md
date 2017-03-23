/*
Title: Getting Started
Sort: 1
*/

Include the theoplayer-mux file after the core THEOplayer javascript file in the page. Use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions).

```
<!-- Include theoplayer-mux after the core THEOplayer javascript files -->
<script type='text/javascript' src='//cdn.theoplayer.com/latest/~yourlicense~/theoplayer.loader.js'>
<script src="//src.litix.io/theoplayer/2/theoplayer-mux.js"></script>
```

After creating you instance of THEOplayer, simply pass that player reference to <code>initTHEOplayerMux</code> along with the options for the SDK. We recommend you retrieve the reference from the return of <code>new THEOplayer.Player(...)</code> so that Mux can track events as soon as possible.

```html
<div id='playerwrapper' class='video-js theoplayer-skin theo-seekbar-above-controls'></div>
<script>
  var element = document.querySelector('div');

  // Retrieve the current time prior to creating the player
  var playerInitTime = Date.now();

  // Get a reference to your player, and pass it to the init function
  var player = new THEOplayer.Player(element, {
    width: 854,
    height: 480
  });
  player.src = '/path/to/video';

  initTHEOplayerMux(player, {
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
