/*
Sort: 4
*/

Mux currently tracks most fatal ExoPlayer errors automatically. However, in some cases, such as when you have your own HLS or DASH manifest loader, fatal errors may occur outside of the context of the player. To handle these cases, Mux exposes a class you can instantiate and send to the SDK. <strong>This should only be used for fatal errors. Do not use this for "errors" that do not result in playback failure.</strong>

Create an instance of `com.mux.stats.sdk.muxstats.MuxErrorException` with an error code and message. Then, pass that instance to `MuxStats.error(MuxErrorException)`.

```java
import com.mux.stats.sdk.muxstats.MuxErrorException;
...

MuxErrorException error = new MuxErrorException(1000, "something went wrong");
muxStats.error(error);
```

In addition, if you would like to send _all_ errors directly yourself, you can turn off Mux's automatic error detection by calling `muxStats.setAutomaticErrorTracking(false)`. This will cause Mux to not track any errors that the underlying ExoPlayer throws, and relies on your integration to pass all errors to Mux.
