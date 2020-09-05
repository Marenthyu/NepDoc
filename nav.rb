#!/usr/bin/env ruby
levels = [0,0,0,0,0]
last_level = -1
lines = []
lines << '<nav>'
lines << '<ul>'
File.open('nepdoc.html', 'rt') do |f|
  f.each do |l|
    next unless l =~ /^<h([1-5]) id="([^"]+)">([^<]+)<\/h/
    level, href, heading = $1.to_i, '#'+$2, $3
    reset = (level < last_level)
    case level
    when 1
      levels = [levels[0]+1,0,0,0,0]
    when 2
      levels = [levels[0],levels[1]+1,0,0,0]
    when 3
      levels = [levels[0],levels[1],levels[2]+1,0,0]
    when 4
      levels = [levels[0],levels[1],levels[2],levels[3]+1,0]
    end
    lines << "<li><a href=\"#{href}\">#{levels[0..(level-1)].join('.')}&nbsp;&nbsp;#{heading}</a>"
    last_level = level
  end
end
lines << '</ul>'
lines << '</nav>'

in_nav = false
File.open('nepdoc.html', 'rt') do |inf|
  File.open('nepdoc.html.new', 'wt') do |outf|
    inf.each do |inline|
      # skip section between <nav></nav>
      if in_nav
        if inline.strip == '</nav>'
          in_nav = false
          outf.puts(lines.join("\n"))
        end

        next
      end
      if inline.strip == '<nav>'
        in_nav = true
        next
      end

      outf.puts(inline)
    end
  end
end

File.rename('nepdoc.html.new', 'nepdoc.html')

