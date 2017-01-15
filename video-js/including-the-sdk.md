## Including the SDK

```
<!-- Include videojs-mux after Video.js -->
<script src="/path/to/video.js"></script>
<!-- Include other videojs plugin files here -->
<script src="//src.litix.io/videojs/2/videojs-mux.js"></script>
```

```
# For npm installs, use the following
$ npm install --save videojs-mux
```


Include the videojs-mux plugin after Video.js in the page (or wherever your other Video.js plugins are loaded). If you utilize any ad integrations with Video.js, include the necessary ad integration JavaScript files before the videojs-mux plugin. You can use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions).


Alternatively, you can bundle videojs-mux into your own player script through `npm`. If you choose to go down this path, we suggest that you check for updates often and merge these into your player as soon as makes sense with your development schedule. The API will not change within major versions.
