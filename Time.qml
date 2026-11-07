pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  function format(formatStr): string {
      return Qt.formatDateTime(clock.date, formatStr)
  }

  SystemClock {
      id: clock
      precision: SystemClock.Seconds
  }
}
