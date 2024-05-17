import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

Window {
    id: uttarPradeshMapWindow
    width: 1950
    height: 1200
    visible: true
    title: "Uttar Pradesh Map"
    x: 0
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    Image {
        id: uttarPradesh
        width: 1900
        height: 1000
        source: "qrc:/Maps/Uttar-pradesh-map.jpg"
    }
    Button {
        id: uttarPradeshMapCloseButton
        text: qsTr("Close")
        x: 1860
        y: 5
        font.pointSize: 10
        onClicked: {
            uttarPradeshMapWindow.close();
        }
        background: Rectangle {
            color: "#FF0000"
            radius: 5
            width: 50
            height: 30
        }
        ToolTip.visible: hovered
        ToolTip.text: "Click to Close"
    }
}
