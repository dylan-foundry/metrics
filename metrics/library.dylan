module: dylan-user

define library metrics
  use dylan;

  export metrics;
end library;

define module metrics
  use dylan;
  use threads;

  export <clock>, clock-get-ticks,
    $default-clock;

  export <metric>;

  export <gauge>, gauge-value;

  export <counter>, counter-value,
    counter-increment, counter-clear;

  export <meter>, meter-mark,
    meter-counter-value;

  export <timer>;
end module;
