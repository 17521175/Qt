import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import Counter 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Stopwatch")

    Counter {
        id: counter
    }

    Text {
        text: "Current time: "
        font.pixelSize: 20
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -80
    }

    Text {
        id: display
        text: counter.display
        font.pixelSize: 60
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -40
    }

    Text {
        text: "Laps split: "
        font.pixelSize: 20
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 10
    }

    Text {
        id: laps
        anchors.verticalCenterOffset: 50
        font.pixelSize: 40
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 3

        Button {
            text: "Start"
            onPressed: {
                counter.start()
            }
        }

        Button {
            text: "Stop"
            onClicked: {
                counter.stop();
            }
        }

        Button {
            text: "Split"
            onClicked: {
                laps.text = display.text
            }
        }

        Button {
            text: "Reset"
            onClicked: {
                counter.reset();
            }
        }

    }
}
