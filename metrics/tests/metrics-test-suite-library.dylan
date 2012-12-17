module: dylan-user
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define library metrics-test-suite
  use common-dylan;
  use io;
  use metrics;
  use testworks;

  export metrics-test-suite;
end library;

define module metrics-test-suite
  use common-dylan, exclude: { format-to-string };
  use format;
  use metrics;
  use testworks;

  export metrics-test-suite;
end module;
