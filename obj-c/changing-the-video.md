/*
Sort: 3
 */

When you change to a new video (in the same player) you need to update the information that Mux knows about the current video. Examples of when this is needed are:

* The player advances to the next video in a playlist
* The user selects a different video to play

**You do not need to change the video info when changing to a different source of the same video content (e.g. different resolution or video format).**

It's best to change the video info immediately before telling the player which new source to play.

This is done by calling <code>videoChangeForPlayer:withVideoData:</code> which will remove all previous video data and reset all metrics for the video view. See <a href="#metadata">Metadata</a> for the list of video details you can provide. You can include any metadata when changing the video but you should only need to update the values that start with <code>video_</code>.

```objectivec
// Example of changing the AVPlayerItem
// Should happen before telling MUXSDKStats about the change.
[player replaceCurrentItemWithPlayerItem:[AVPlayerItem playerItemWithURL:@"..."]];

MUXSDKCustomerVideoData *videoData = [MUXSDKCustomerVideoData new];
videoData.videoId = @"abcd345";
videoData.videoTitle = @"My Other Great Video";
videoData.videoSeries = @"Weekly Great Videos";
[MUXSDKStats videoChangeForPlayer:@"awesome" withVideoData:videoData];
```
