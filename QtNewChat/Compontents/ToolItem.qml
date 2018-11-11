import QtQuick 2.0

Rectangle{
    id:root
    color: "transparent"
    property string imageSource
    property string overImageSource
    property string tooText
    signal clicked
    Image {
        id: toolImage
        source: imageSource
        height: 20
        width: 20
        fillMode: Image.Stretch
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        id: name
        text:tooText
        anchors.bottom: parent.bottom
    }
    MouseArea{
          anchors.fill: parent
          onHoveredChanged: {
            if(containsMouse)
            {
             toolImage.source=overImageSource

            }else{
                toolImage.source=imageSource
            }
          }
    }
}
