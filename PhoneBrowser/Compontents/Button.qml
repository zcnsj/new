import QtQuick 2.0


Rectangle {
    id: root
    // export button properties
    property string bkcolor:"#f45454"
    property string imageSource
    signal clicked
    color:"transparent"
    height: 20
    width: 20
    Image {
        id: name
        height: 10
        width: 10
        source: imageSource
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        fillMode: Image.Stretch

    }
    MouseArea {
        id:mouse
        anchors.fill: parent
        hoverEnabled: true
        onHoveredChanged:{


            if(containsMouse)
            {
                root.color=bkcolor

            }else
            {
                root.color="transparent"

            }
        }
        onClicked: {
            root.clicked()
        }

    }
}
