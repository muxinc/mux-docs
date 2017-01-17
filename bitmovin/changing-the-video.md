/*
Sort: 3
 */

When you change to a new video (in the same player) you need to update the information that Mux knows about the current video. Examples of when this is needed are:

* The player advances to the next video in a playlist
* The user selects a different video to play

**You do not need to change the video info when changing to a different source of the same video content (e.g. different resolution or video format).**

It's best to change the video info immediately after telling the player which new source to play.

This is done by emitting a <code>videochange</code> event via <code>mux.emit</code> which has been added to the <code>player</code> object. When this is emitted it removes all previous video data and resets all metrics for the video view. See <a href="/sdk-options">metadata</a> for the list of video details you can provide. You can include any metadata when changing the video but you should only need to update the values that start with <code>video_</code>.

```javascript
// Call this immediately after loading the new video into the player
player.mux.emit('videochange', {
  video_id: 'abc345',
  video_title: 'My Other Great Video',
  video_series: 'Weekly Great Videos',
  ...
});
```

