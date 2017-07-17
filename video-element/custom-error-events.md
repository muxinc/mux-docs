/*
Sort: 4
*/

Mux currently tracks fatal errors that are triggered by the player in use. However, in some cases, such as third-party HLS libraries for web players, fatal errors may occur outside of the context of the player. To handle these cases, Mux exposes a type of event that can be triggered via javascript. <strong>This event should only be used for fatal errors. Do not use this for "errors" that do not result in playback failure.</strong>

When triggering an error event, it is important to provide an <code>player_error_code</code> and <code>player_error_message</code> in an object as the second parameter. The <code>player_error_message</code> should provide a detailed description of the error as it happened. The <code>player_error_code</code> must be an integer, and should provide a category of the error. If the errors match up with the <a href="https://developer.mozilla.org/en-US/docs/Web/API/MediaError" target="_blank">HTML Media Element Error</a>, you can use the same codes as the corresponding HTML errors. However, for custom errors, you should choose a number greater than or equal to 100. Whether all errors use the same code or you use different codes for different types of errors is up to you. In general you should not send a distinct code for each possible error message, but rather group similar errors under the same code. For instance, if your library has two different conditions for network errors, both should have the same <code>player_error_code</code> but different messages.

```javascript
mux.emit('#myVideo', 'error', {
  player_error_code: 100,
  player_error_message: 'Description of error'
});
```
