import QtQuick
import Quickshell
import QtQuick.Layouts

Scope {
    Bar {
        id: bar
        spacing: 4


        RowLayout {
            id: left

            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: bar.spacing
            }
        }

        RowLayout {
            id: center

            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            Clock { }
        }

        RowLayout {
            id: right

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: bar.spacing
            }
        }
    }
}
