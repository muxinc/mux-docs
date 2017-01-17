Include the Mux JavaScript SDK on every page of your site/app that includes video. You can use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions).

```
<script src="//src.litix.io/core/2/mux.js"></script>
```


Alternatively, you can bundle Mux into your own player script through `npm`. If you choose to go down this path, we suggest that you check for updates often and merge these into your player as soon as makes sense with your development schedule. The API will not change within major versions.

```bash
# For npm installs, use the following
npm install --save mux-embed
```

To monitor the performance of a specific video element, call <code>mux.monitor</code>, passing options for the SDK along with either a valid CSS selector for your video element or a reference to the video element itself. If you pass a selector, it must return only a single element (the <code>&lt;video&gt;</code> element that is tracked). Any further calls to <code>mux</code> for the same player (such as when <a href="#changing-the-video">changing the video</a>) can be passed either the selector or the reference to the video element.

```html
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
