Include the Mux SDK for your project by <a href="https://github.com/muxinc/stats-sdk-exoplayer/blob/release-v2/mux/mux.aar">downloading the AAR from our GitHub repo</a> and including it in your project.

We recommend using Android Studio's new module tool which can be accessed via `File > New > New Module...`. Select the `Import .JAR/.AAR Package` and then select the `mux.arr` that you downloaded from our GitHub repo. This should correctly configure the IDE as well as modify your build configuration (Gradle/Maven).

For an example integration, you can see [this commit on GitHub](https://github.com/muxinc/stats-sdk-exoplayer/commit/7384a0eabf4bf5c28d45ebd1240c0f4108cfed76) which integrates Mux into the ExoPlayer demo application.

After importing the AAR, you'll need to modify a few pieces of your ExoPlayer integration:

1) Create the `CustomerPlayerData` and `CustomerVideoData` objects as appropriate for your current playback, and be sure to set your property key.

```java
import com.mux.stats.core.models.CustomerPlayerData;
import com.mux.stats.core.models.CustomerVideoData;
...
CustomerPlayerData customerPlayerData = new CustomerPlayerData();
customerPlayerData.setPropertyKey("YOUR_PROPERTY_KEY");
CustomerVideoData customerVideoData = new CustomerVideoData();
customerVideoData.setVideoTitle("The most epic video ever");
```

2) Create the `MuxStats` object by passing the `ExoPlayer` instance, a player name and the customer data objects.

```java
import com.mux.stats.sdk.muxstats.MuxStats;
...
muxStats = new MuxStats(player, "demo-player", customerPlayerData, customerVideoData);
```

3) In order to correctly monitor if the player is full-screen, provide the screen size to the `MuxStats` instance.

```java
Point size = new Point();
getWindowManager().getDefaultDisplay().getSize(size);
muxStats.setScreenSize(size.x, size.y);
```

4) In order to determine a number of viewer context values as well as track the size of the video player, set the player view.

```java
muxStats.setPlayerView(simpleExoPlayerView.getVideoSurfaceView());
```

5) Next, we need to attach all the appropriate listeners to the player as well as all of your `ChunkSource` and `MediaSource` objects. There are two things that are tricky about this. First, there is no built in chaining of listeners meaning that if you already have listeners attached you will need to use the `get*EventListener(*EventListener):*EventListener` function to wrap your exisiting listener. Second, there is no base-class for these listeners which means that each object requires a different listener to be attached. Failure to attach the `MuxStats` listeners to all appropriate objects will result in at least partially broken integration.

**Note that `MuxStats` will call `ExoPlayer.addListener(EventListener)` itself.**

```java
// getAudioRendererEventListener():AudioRendererEventListener also exists.
player.setAudioDebugListener(muxStats.getAudioRendererEventListener(eventLogger));

// getVideoRendererEventListener():VideoRendererEventListener also exists.
player.setVideoDebugListener(muxStats.getVideoRendererEventListener(eventLogger));

// getMetadataRendererOutput():Output also exists.
player.setMetadataOutput(muxStats.getMetadataRendererOutput(eventLogger));

// A couple ChunkSource/MediaSource examples.

// getAdaptiveMediaSourceEventListener():AdaptiveMediaSourceEventListener also exists.
new HlsMediaSource(uri, mediaDataSourceFactory, mainHandler,
    muxStats.getAdaptiveMediaSourceEventListener(eventLogger));

// getExtractorMediaSourceEventListener():EventListener also exists.
return new ExtractorMediaSource(uri, mediaDataSourceFactory, new DefaultExtractorsFactory(),
    mainHandler, muxStats.getExtractorMediaSourceEventListener(eventLogger));
```

6) Finally, when you are destroying the player, call the `MuxStats.release()` function.
