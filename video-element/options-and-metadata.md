/*
Title: Options and Metadata
Sort: 2
*/

Name	| Description	| Default
----------- | ----------- | --------
debug	| Put the SDK in debug mode to log operational details	| false
data | User, page, player, and video metadata for the video | { }

The data object allows you to provide details about the video and environment that can't be detected automatically or if the video fails to load.

All metadata details except for `property_key` are *optional*, however you'll be able to compare and see more detailed results as you include more details.

- Video details (prepended by `video_`) describe the current video that's playing and are all reset automatically when [changing the video](changing-the-video). This metadata would come from your internal CMS or video management system.
- Player details (prepended by `player_`) describe the player configuration that's being used and should be set whenever monitoring is started on a new player. They do not reset when the video is changed.
- All other details will persist until explicitly changed.

Name	| Description
----- | -----------
property_key | Your property key from the Mux dashboard
viewer_user_id | Provide a user ID (if available) to search by in the Mux UI
page_type | Provide the context of the page for more specific analysis. Values include 'watchpage', 'iframe', or leave empty. <ul><li>**watchpage** &mdash; A web page that is dedicated to playing a specific video (for example [youtube.com/watch/ID](https://www.youtube.com/watch?v=WtA-IWdLMN0) or [hulu.com/watch/ID](http://www.hulu.com/watch/4183))</li><li>**iframe** &mdash; An iframe specifically used to embed a player on different sites/pages</li></ul>
experiment_name | You can use this field to separate views into different experiments, if you would like to filter by this dimension later. This should be a string value, but your account is limited to a total of 10 unique experiment names, so be sure that this value is not generated dynamically or randomly.
player_name | If you have different configurations or types of players around your site or application you can use player_name to compare them. **This is *not* the player software (e.g. Video.js), which is tracked automatically by the SDK.**
player_version | As you make changes to your player you can compare how new versions of your player perform by updating this value. **This is *not* the player software version (e.g. Video.js 5.0.0), which is tracked automatically by the SDK.**
player_init_time | If you are explicitly loading your player in page (perhaps as a response to a user interaction), include the timestamp (milliseconds since Jan 1 1970) when you initialize the player (or for HTML5 video, when right before you add the `<video>` element to the DOM) in order to accurately track page load time and player startup time.
video_id | Your internal ID for the video
video_title | example: 'Awesome Show Episode 1'
video_series | example: 'Season 1'
video_variant_name | An optional detail that allows you to monitor issues with the files of specific versions of the content, for example different audio translations or versions with hard-coded/burned-in subtitles.
video_variant_id | Your internal ID for a video variant
video_language_code | The audio language of the video, assuming it's unchangeable after playing.
video_content_type | 'short', 'movie', 'episode', 'clip', 'trailer', or 'event'
video_duration | The length of the video in **milliseconds** [integer]
video_stream_type | 'live' or 'on-demand'
video_producer | The producer of the video title
video_encoding_variant | An optional detail that allows you to compare different encoding settings.
video_cdn | An optional detail that allows you to compare different CDNs (assuming the CDN selection is made at page load time).
