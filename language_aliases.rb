require 'rouge'
module Rouge
  module Lexers
    class VideoJS < Rouge::Lexers::Javascript
      tag 'videojs'
    end
    class VideoJSHTML < Rouge::Lexers::HTML
      tag 'videojs_html'
    end
    class VideoElement < Rouge::Lexers::Javascript
      tag 'video_element'
    end
    class Android < Rouge::Lexers::Java
      tag 'android'
    end
  end
end
