/*
Title: Getting Started
Sort: 1
*/

The Mux Objective-C SDK is available either via CocoaPods or you can manually install it. If you have any problems, feel free to get in touch.

## Installing with CocoaPods
Modify your `Podfile` to use frameworks by including `use_frameworks!` and then add `pod "Mux-Stats-SDK", "~> 0.0"`. This will use our current release which is version `0.0.3`. There will no be API breaking changes within our `0.0` releases, so you can safely run `pod update`.

## Installing manually
Include the correct Mux Objective-C SDK for your project by cloning our repository and dragging the framework into your Xcode project. The <code>Frameworks</code> folder contains two folders, one for iOS and one for tvOS. Inside these folders, there are 3 additional folders containing different architecture combinations. The <code>fat</code> folder contains a library with all architectures in one.

You can use the `fat` library when developing but this library cannot be used when compiling for submission to the App Store as it contains the simulator architectures that are not used by any Apple devices (the community believes <a href="http://www.openradar.me/radar?id=6409498411401216" target="_blank">this is a bug</a>). You can use the framework in the <code>release</code> folder when building a release version of your application, or you can run <a href="https://gist.github.com/brett-stover-hs/b25947a125ff7e38e7ca#file-frameworks_blogpost_removal_script_a-sh" target="_blank">a script to strip unneeded architectures</a>.

```bash
$ git clone https://github.com/muxinc/stats-sdk-objc.git
```

## Adding the monitor
Add the correct import statement for your target platform;

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
videoData.videoDuration = @(120000); // in milliseconds
videoData.videoIsLive = @NO;
videoData.videoEncodingVariant = @"Variant 1";
videoData.videoCdn = @"cdn";

AVPlayerLayer *player = [AVPlayerLayer new];
[MUXSDKStats monitorAVPlayerViewController:player withPlayerName:@"awesome" playerData:playerData videoData:videoData];
```

## Confirming it works

After you've integrated, start playing a video in the player you've integrated with. Then for your viewing session (called a "video view") to show up in the Mux dashboard, you need to stop watching the video. In a few minutes you'll see the results in your Mux account. We'll also email you when the first video view has been recorded.
