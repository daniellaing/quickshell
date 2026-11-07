import QtQuick
import QtQuick.Controls

Item {
    id: root

    property var defaultComponent
    readonly property Item currentItem: stack.currentItem
    property alias stack: stack

    property int duration: 250

    implicitWidth: currentItem ? currentItem.implicitWidth : 0
    implicitHeight: currentItem ? currentItem.implicitHeight : 0

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: root.defaultComponent

        replaceEnter: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: root.duration
                easing.type: Easing.InOutCubic
            }
        }

        replaceExit: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: root.duration
                easing.type: Easing.InOutCubic
            }
        }

        Component.onCompleted: stack.push(root.defaultItem)
        onCurrentItemChanged: {
            if (currentItem) {
                // Dynamically center the incoming child to the StackView
                currentItem.anchors.horizontalCenter = stack.horizontalCenter;
                currentItem.anchors.verticalCenter = stack.verticalCenter;
            }
        }
    }

    NumberAnimation {
        id: defaultCurve
        duration: root.duration
        easing.type: Easing.InOutCubic
    }

    Behavior on implicitWidth {
        animation: defaultCurve
    }

    Behavior on implicitHeight {
        animation: defaultCurve
    }

    function show(component) {
        stack.replace(component)
    }

    function reset() {
        stack.replace(defaultComponent)
    }
}


