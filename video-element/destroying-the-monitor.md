/*
Title: Destroying the Monitor
Sort: 6
*/

If you need to remove a monitored video element from the page, you should tell Mux to stop monitoring that element prior to removing the element from the DOM. In order to do that, you should call either <code>window.mux.destroyMonitor</code> or, if you have a reference to the monitored video element, <code>el.mux.destroy</code>.

```javascript
// You must pass in the same ID (or video element reference) as you used in the
// initial call `mux.monitor`
window.mux.destroyMonitor(id);

// Alternatively, you can call destroy on the mux object placed on the media element
el.mux.destroy();
```
