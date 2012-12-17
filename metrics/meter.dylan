module: metrics
synopsis:
author: Bruce Mitchener, Jr.
copyright: See LICENSE file in this distribution.

// 5 seconds in nanoseconds.
define constant $tick-interval = 5000000000;

define class <meter> (<metric>)
  constant slot meter-counter :: <counter> = make(<counter>);
  constant slot meter-one-minute-moving-average = make(<moving-average>, minutes: 1);
  constant slot meter-five-minute-moving-average = make(<moving-average>, minutes: 5);
  constant slot meter-fifteen-minute-moving-average = make(<moving-average>, minutes: 15);
  constant slot meter-clock = $default-clock,
    init-keyword: clock:;
  //***--- This last-tick should be atomic.
  slot meter-last-tick :: <integer> = 0;
end;

define method meter-mark (meter :: <meter>, count :: <integer>)
 => ()
  meter-maybe-tick(meter);
  counter-increment(meter.meter-counter, count);
  moving-average-update(meter.meter-one-minute-moving-average, count);
  moving-average-update(meter.meter-five-minute-moving-average, count);
  moving-average-update(meter.meter-fifteen-minute-moving-average, count);
end;

define method meter-tick (meter :: <meter>)
 => ()
  moving-average-tick(meter.meter-one-minute-moving-average);
  moving-average-tick(meter.meter-five-minute-moving-average);
  moving-average-tick(meter.meter-fifteen-minute-moving-average);
end;

define method meter-maybe-tick (meter :: <meter>)
 => ()
  let old-tick = meter.meter-last-tick;
  let new-tick = clock-get-ticks(meter.meter-clock);
  let age = new-tick - old-tick;
  //***--- meter-last-tick assignment to new-tick should be
  //***---   conditional-update! inside the if test expression.
  if (age > $tick-interval)
    meter.meter-last-tick := new-tick;
    let required-ticks = floor/(age, $tick-interval);
    for (i from 0 below required-ticks)
      meter-tick(meter);
    end for;
  end if;
end;

define method meter-counter-value (meter :: <meter>)
  counter-value(meter.meter-counter)
end;