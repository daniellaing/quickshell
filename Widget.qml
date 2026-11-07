import QtQuick
import QtQuick.Controls

Item {
    id: root

    property Component defaultComponent
    property alias stack: stack

    StackView {
        id: stack
        initialItem: root.defaultComponent
    }
}

