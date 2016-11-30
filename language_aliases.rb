require 'rouge'
module Rouge
  module Lexers

    class VideoJS < Rouge::Lexers::Javascript
      tag 'videojs'
    end
    class VideoJSHTML < Rouge::Lexers::HTML
      tag 'videojs--html'
    end
    class VideoJSShell < Rouge::Lexers::Shell
      tag 'videojs--shell'
    end

    class VideoElement < Rouge::Lexers::Javascript
      tag 'video-element'
    end
    class VideoElementHTML < Rouge::Lexers::HTML
      tag 'video-element--html'
    end
    class VideoElementShell < Rouge::Lexers::Shell
      tag 'video-element--shell'
    end

    class JWPlayer < Rouge::Lexers::Javascript
      tag 'jwplayer'
    end
    class JWPlayerHTML < Rouge::Lexers::HTML
      tag 'jwplayer--html'
    end

    class Bitmovin < Rouge::Lexers::Javascript
      tag 'bitmovin'
    end
    class BitmovinHTML < Rouge::Lexers::HTML
      tag 'bitmovin--html'
    end

    class Ooyala < Rouge::Lexers::Javascript
      tag 'ooyala'
    end
    class OoyalaHTML < Rouge::Lexers::HTML
      tag 'ooyala--html'
    end

    class IOS < Rouge::Lexers::ObjectiveC
      tag 'objective-c'
    end
    class IOSShell < Rouge::Lexers::Shell
      tag 'objective-c--shell'
    end
  end
end
