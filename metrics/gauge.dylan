module: metrics
synopsis:
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define class <gauge> (<metric>)
  constant slot value-generator :: <function>,
    required-init-keyword: generator:;
end;

define method gauge-value (gauge :: <gauge>)
 => (value :: <integer>)
  gauge.value-generator()
end;