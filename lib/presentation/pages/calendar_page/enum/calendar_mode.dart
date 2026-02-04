enum CalendarMode {
  list, grid;

  CalendarMode next() {
    final next = values[(index + 1) % values.length];
    return next;
  }
}