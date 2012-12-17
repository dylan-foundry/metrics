module: metrics-test-suite
synopsis: Test suite for the nanomsg library.
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

define suite metrics-test-suite ()
  test counter-metrics-test;
  test gauge-metrics-test;
  test meter-metrics-test;
end suite;

define test counter-metrics-test ()
  let counter = make(<counter>);
  check-equal("counter starts at zero",
              counter-value(counter), 0);
  counter-increment(counter, 1);
  check-equal("counter increments to one",
              counter-value(counter), 1);
  counter-clear(counter);
  check-equal("counter clears to zero",
              counter-value(counter), 0);
end test counter-metrics-test;

define test gauge-metrics-test ()
  let g = method () 3 end;
  let gauge = make(<gauge>, generator: g);
  check-equal("gauge returns correct value",
              gauge-value(gauge), 3);
end test gauge-metrics-test;

define test meter-metrics-test ()
  let meter = make(<meter>);
  check-equal("meter counter starts at zero",
              meter-counter-value(meter), 0);
  meter-mark(meter, 1);
  check-equal("meter counter increments to one on mark",
              meter-counter-value(meter), 1);
end test meter-metrics-test;
