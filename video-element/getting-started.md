/*
Title: Getting Started
Sort: 1
*/

Include the Mux JavaScript SDK on every page of your site/app that includes video. You can use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions, as in `core/MAJOR_VERSION/mux.js` ).

```
<script src="https://src.litix.io/core/2/mux.js"></script>
```

**Alternatively**, you can bundle Mux into your own app or player javascript using `npm`. If you choose this path we suggest that you update often to make sure you have the latest features.

```bash
# For npm installs, use the following
npm install --save mux-embed
```

To monitor the performance of a specific video element, call <code>mux.monitor</code>, passing
a valid CSS selector for your video element or the element itself, along with SDK options and metadata. If you use a CSS selector that matches multiple elements, the first matching element in the document will be used.

```html
<!-- Example html video element -->
<video id="myVideo" controls>
  <source src="path/to/video.mp4" type="video/mp4">
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

## Confirming it works

After you've finished integration, you can quickly see if it's working by opening your [browser developer tools](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_are_browser_developer_tools), selecting the network tab, and then clicking 'play' on the video you've set to be monitored. You should begin to see beacons being sent to the Mux servers (litix.io) like in the example image.

<img src="/images/chrome-dev-tools.png"
srcset="/images/chrome-dev-tools.png 1x, /images/chrome-dev-tools@2x.png 2x">

For your current viewing session (called a "video view") to show up in the Mux dashboard, you need to first finish viewing the video by closing or reloading the browser window. In a few minutes you'll see the results in your Mux account. We'll also email you when the first video view has been recorded.
