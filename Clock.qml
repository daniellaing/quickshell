import QtQuick


Widget {
    id: root

    defaultComponent: compact

    Component {
        id: compact

        Pill {
            icon: "nest_clock_farsight_analog"
            label: Time.format("HH:mm dd/MM")
        }
    }

    Component {
        id: hovered

        Pill {
            icon: "nest_clock_farsight_analog"

            label: Time.format("HH:mm:ss dd MMM yyyy")
            implicitWidth: 500
        }
    }

    HoverHandler {
        id: mouse

        onHoveredChanged: {
            if (mouse.hovered) root.show(hovered)
            else root.reset()
        }
    }
}

