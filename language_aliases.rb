require 'rouge'
module Rouge
  module Lexers

    class VideoJS < Rouge::Lexers::Javascript
      tag 'videojs'
    end
    class VideoJSHTML < Rouge::Lexers::HTML
      tag 'videojs--html'
    end

    class VideoElement < Rouge::Lexers::Javascript
      tag 'video-element'
    end
    class VideoElementHTML < Rouge::Lexers::HTML
      tag 'video-element--html'
    end

    class Android < Rouge::Lexers::Java
      tag 'android'
    end
  end
end
