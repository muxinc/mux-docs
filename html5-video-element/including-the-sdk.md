/*
Title: Including the SDK
*/

Include the Mux JavaScript SDK on every page of your site/app that includes video. You can use the Mux-hosted version of the script to receive automatic updates (the API will not change within major versions).

```
<script src="//src.litix.io/core/2/mux.js"></script>
```


Alternatively, you can bundle Mux into your own player script through `npm`. If you choose to go down this path, we suggest that you check for updates often and merge these into your player as soon as makes sense with your development schedule. The API will not change within major versions.

```bash
# For npm installs, use the following
npm install --save mux-embed
```

