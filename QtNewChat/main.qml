import QtQuick 2.11
import QtQuick.Window 2.11
import QtGraphicalEffects 1.0
import "./Compontents" as Ct
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Window {
    id:mainwindow
    visible: true
    width: 460
    height: 800
    title: qsTr("Hello World")
    flags: Qt.Window|Qt.FramelessWindowHint
    color: "transparent"
    onActiveChanged: {
     if(active)
     {
        mainDs.color="#aacff9"
     }else{
        mainDs.color= "#0a0a0a"
     }
    }
    Rectangle{
        id:mainRect
        anchors.fill: parent
        anchors.margins: 10
        radius: 8
        Rectangle{
            id:topRect
            anchors.top:parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: 25
            color: "#f5f5f5"

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
            Row{

                anchors.right:parent.right
                anchors.top: parent.top
               Ct.Button{
                id:minButton
                imageSource: "../Images/minB.png"

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
            anchors.top: parent.top-25
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: parent.height-25
            width: parent.width
            color: "#ececec"
            TabView {
                id: frame
                anchors.fill: parent
                Tab { title: "信息" }
                Tab { title: "搜索" }
                Tab { title: "回复" }
                Tab { title: "工具" }
                Tab { title: "设置" }
                style: TabViewStyle {
                    frameOverlap: 1
                    tab: Rectangle {
                        color: "#f5f5f5"
                        implicitWidth: Math.max(tabTxt.width + 4, 88.8)
                        implicitHeight: 35

                        Text {
                            id: tabTxt
                            anchors.centerIn: parent
                           font.bold: true
                            text: styleData.title
                            color: styleData.selected ? "#40a73f" : "black"
                        }
                     Rectangle{
                            width: parent.width
                            height: 2
                            anchors.bottom: parent.bottom
                            color: styleData.selected ? "#40a73f" : "#f5f5f5"
                     }

                    }
                    frame: Rectangle
                    {
                        color: "#ffffff"

                    }
                }
            }
        }
    }
    DropShadow
    {
        id:mainDs
        anchors.fill:mainRect
        horizontalOffset: 0
        verticalOffset: 0
        radius: 8.0
        samples: 17
        color: Qt.black
        source: mainRect
    }
}
