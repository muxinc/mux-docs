Include the correct Mux Objective-C SDK for your project by cloning our repository and dragging the framework into your Xcode project. The <code>Frameworks</code> folder contains two folders, one for iOS and one for tvOS. Inside these folders, there are 3 additional folders containing different architecture combinations. The <code>fat</code> folder contains a library with all architectures in one. This library cannot be used when compiling for submission to the App Store as it contains the simulator architectures that are not used by any Apple devices. You can use the framework in the <code>release</code> folder when building a release version of your application, or you can run <a href="https://gist.github.com/brett-stover-hs/b25947a125ff7e38e7ca#file-frameworks_blogpost_removal_script_a-sh" target="_blank">a script to strip unneeded architectures</a>. Finally, don't forget to add the correct import statement for your target platform.

```bash
$ git clone https://github.com/muxinc/stats-sdk-objc.git
```

```objectivec
// for iOS
@import MUXSDKStats;

// for tvOS
@import MUXSDKStatsTv;
```

To monitor the performance of an AVPlayer, call either <code>monitorAVPlayerViewController:withPlayerName:playerData:videoData:</code> or <code>monitorAVPlayerLayer:withPlayerName:playerData:videoData:</code>, passing a pointer to your AVPlayer container (either the <code>AVPlayerLayer</code> or <code>AVPlayerViewController</code>) to the SDK. When calling <code>destroyPlayer</code> or <code>videoChangeForPlayer:withVideoData:</code> to <a href="#changing-the-video">change the video</a> the same player name used for the monitor call must be used.

```objectivec
// Property and player data that persists until the player is destroyed
MUXSDKCustomerPlayerData *playerData = [[MUXSDKCustomerPlayerData alloc] initWithPropertyKey:@"EXAMPLE_PROPERTY_KEY"];
playerData.viewerUserId = @"1234";
playerData.experimentName = @"player_test_A";
playerData.playerName = @"My Main Player";
playerData.playerVersion = @"1.0.0";

// Video metadata (cleared with videoChangeForPlayer:withVideoData:)
MUXSDKCustomerVideoData *videoData = [MUXSDKCustomerVideoData new];
videoData.videoId = @"abcd123";
videoData.videoTitle = @"My Great Video";
videoData.videoSeries = @"Weekly Great Videos";
videoData.videoProducer = @"Bob the Producer";
videoData.videoContentType = @"type";
videoData.videoLanguageCode = @"en";
videoData.videoVariantName = @"Spanish Hard Subs";
videoData.videoVariantId = @"abcd1234";
videoData.videoDuration = @(120000); // in millisecons
videoData.videoIsLive = @NO;
videoData.videoEncodingVariant = @"Variant 1";
videoData.videoCdn = @"cdn";

AVPlayerLayer *player = [AVPlayerLayer new];
[MUXSDKStats monitorAVPlayerViewController:player withPlayerName:@"awesome" playerData:playerData videoData:videoData];
```

