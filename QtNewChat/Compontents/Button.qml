import QtQuick 2.0


Rectangle {
    id: root
    // export button properties
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

            console.log(name.source)
            if(containsMouse)
            {
                root.color="#f45454"

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

