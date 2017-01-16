/*
Title: Including the SDK
*/

Include the correct Mux Objective-C SDK for your project by cloning our repository and dragging the framework into your Xcode project. The <code>Frameworks</code> folder contains two folders, one for iOS and one for tvOS. Inside these folders, there are 3 additional folders containing different architecture combinations. The <code>fat</code> folder contains a library with all architectures in one. This library cannot be used when compiling for submission to the App Store as it contains the simulator architectures that are not used by any Apple devices. You can use the framework in the <code>release</code> folder when building a release version of your application, or you can run <a href="https://gist.github.com/brett-stover-hs/b25947a125ff7e38e7ca#file-frameworks_blogpost_removal_script_a-sh" target="_blank">a script to strip unneeded architectures</a>. Finally, don't forget to add the correct import statement for your target platform.


```bash
$ git clone https://github.com/muxinc/stats-sdk-objc.git
```

```
// for iOS
@import MUXSDKStats;

// for tvOS
@import MUXSDKStatsTv;
```
