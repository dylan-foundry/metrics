module: metrics
synopsis:
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define class <clock> (<object>)
end;

define method clock-get-ticks (clock :: <clock>)
 => (ticks :: <integer>)
  0
end;

define constant $default-clock = make(<clock>);