import QtQuick
import QtQuick.Controls

Item {
    id: root

    property var defaultComponent
    readonly property Item currentItem: stack.currentItem
    property alias stack: stack

    implicitWidth: currentItem ? currentItem.implicitWidth : 0
    implicitHeight: currentItem ? currentItem.implicitHeight : 0

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: root.defaultComponent

        replaceEnter: Transition {
            PropertyAnimation {
                duration: 100
                from: 0
                property: "opacity"
                to: 1
            }

            PropertyAnimation {
                duration: 100
                from: -5
                property: "anchors.topMargin"
                to: 0
            }
        }

        replaceExit: Transition {
            PropertyAnimation {
                duration: 100
                from: 1
                property: "opacity"
                to: 0
            }
        }
    }

    NumberAnimation {
        id: defaultCurve
        duration: 250
        easing.type: Easing.InOutCubic
    }

    Behavior on implicitWidth {
        animation: defaultCurve
    }

    Behavior on implicitHeight {
        animation: defaultCurve
    }

    function show(component) {
        if (root.currentItem?.objectName !== component.objectName)
        stack.replace(component)
    }

    function reset() {
        stack.replace(defaultComponent)
    }
}

