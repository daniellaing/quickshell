import QtQuick


Widget {
    id: root

    defaultComponent: defaultComponent

    Pill {
        id: defaultComponent
        icon: "nest_clock_farsight_analog"

        label: Time.format("HH:mm dd/MM")
    }

    // Pill {
    //     id: hovered
    //     icon: "nest_clock_farsight_analog"
    //
    //     label: Time.format("HH:mm dd/MM")
    //     implicitWidth: defaultComponent.implicitWidth * 2
    // }

    // states: [
    //     State {
    //         name: "default"
    //         when: !mouse.hovered
    //
    //         PropertyChanges {
    //         }
    //
    //         StateChangeScript {
    //             script: {
    //                 root.stack.replace(defaultComponent);
    //             }
    //         }
    //     }
    //     State {
    //         name: "hovered"
    //         when: mouse.hovered
    //
    //         PropertyChanges {
    //         }
    //
    //         StateChangeScript {
    //             script: {
    //                 root.stack.replace(hovered);
    //             }
    //         }
    //     }
    // ]


    HoverHandler {
        id: mouse
    }
}

