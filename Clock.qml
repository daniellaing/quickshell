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

            label: Time.format("HH:mm dd/MM")
            implicitWidth: compact.implicitWidth * 2
        }
    }

    states: [
        State {
            name: "default"
            when: !mouse.hovered

            PropertyChanges {
            }

            StateChangeScript {
                script: {
                    root.reset();
                }
            }
        },
        State {
            name: "hovered"
            when: mouse.hovered

            PropertyChanges {
            }

            StateChangeScript {
                script: {
                    root.show(hovered);
                }
            }
        }
    ]


    HoverHandler {
        id: mouse
    }
}

