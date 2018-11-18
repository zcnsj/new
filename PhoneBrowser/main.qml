import QtQuick 2.11
import QtQuick.Window 2.11
import QtWebEngine 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.2
import "./Compontents" as Ct
Window {
    id:mainwindow
    visible: true
    width: 800
    height: 800
    title: qsTr("Hello World")
    flags: Qt.Window|Qt.FramelessWindowHint
    color:"transparent"
    Rectangle{
        id:mainRect
        anchors.fill: parent
        anchors.margins: 2
        radius: 8
        Rectangle{
            id:topRect
            anchors.top:parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 20
            color: "#eeebe8"

            MouseArea{
                id: dragRegion
                anchors.fill: parent
                property point clickPos: "0,0"
                onPressed: {
                    clickPos  = Qt.point(mouse.x,mouse.y)
                }
                onPositionChanged: {
                    //鼠标偏移量
                    var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    //如果mainwindow继承自QWidget,用setPos
                    mainwindow.setX(mainwindow.x+delta.x)
                    mainwindow.setY(mainwindow.y+delta.y)
                }
            }
            Row{ anchors.right:parent.right
                anchors.top: parent.top
                Ct.Button{
                    id:minButton
                    imageSource: "../Images/minB.png"
                    bkcolor: "transparent"
                    color: "transparent"
                    onClicked: {
                        mainwindow.showMinimized()
                    }
                }
                Ct.Button{
                    id:closeButton
                    imageSource: "../Images/CloseB.png"

                    color: "transparent"
                    onClicked: {
                        mainwindow.close()
                    }
                }
            }

        }
        Rectangle{
            id:browserRect
            anchors.top: parent.top-50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: parent.height-50
            width: parent.width
        WebEngineView{
          anchors.fill: parent
          url:"http://www.baidu.com"
        }
        }
        Ct.StretchMouse{
            anchors.fill: parent
            target: mainwindow
        }
    }
    DropShadow
    {
        anchors.fill:mainRect
        horizontalOffset: 0
        verticalOffset: 0
        radius: 5.0
        samples: 17
        color: Qt.black
        source: mainRect
    }
}
