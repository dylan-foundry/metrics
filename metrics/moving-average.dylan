module: metrics
synopsis:
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define class <moving-average> (<object>)
end;

define method moving-average-tick (moving-average :: <moving-average>)
end;

define method moving-average-update (moving-average :: <moving-average>, value :: <integer>)
end;