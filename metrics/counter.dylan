module: metrics
synopsis:
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define class <counter> (<metric>)
  slot value :: <integer> = 0;
end;

define method counter-value (counter :: <counter>)
 => (count :: <integer>)
  counter.value
end;

define method counter-increment (counter :: <counter>,
                                 by-value)
 => ()
  counter.value := counter.value + by-value;
end;

define method counter-clear (counter :: <counter>)
 => ()
  counter.value := 0;
end;