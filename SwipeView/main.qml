import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    width: 1280
    height: 480
    visible: true
    title: qsTr("Swipe view & Page indicator")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: pageIndicator.currentIndex

        Item {
            Rectangle {
                width: 500
                height: width
                radius: width
                color: "orange"
                anchors.centerIn: parent
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                Image {

                }
                Text {
                    font.bold: true
                    font.pixelSize: 100
                    text: qsTr("Washing")
                }

            }
        }

        Item {
            Rectangle {
                width: 500
                height: width
                radius: width
                color: "orange"
                anchors.centerIn: parent
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                Image {

                }
                Text {
                    font.bold: true
                    font.pixelSize: 100
                    text: qsTr("Drying")
                }

            }
        }

        Item {
            Rectangle {
                width: 500
                height: width
                radius: width
                color: "orange"
                anchors.centerIn: parent
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                Image {

                }
                Text {
                    font.bold: true
                    font.pixelSize: 100
                    text: qsTr("Cleaning")
                }

            }
        }


    }

    PageIndicator {
        id: pageIndicator
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        interactive: true
        currentIndex: swipeView.currentIndex
        count: swipeView.count
    }
}
