import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

Window {
    id: andhraPradeshMapWindow
    width: 1950
    height: 1200
    visible: true
    title: "Andhra Pradesh Map"
    x: 0
    flags: Qt.SplashScreen | Qt.FramelessWindowHint

    Image {
        id: andhraPradesh
        width: 1900
        height: 1000
        source: "qrc:/Maps/Andhra_Pradesh_Map.jpg"
    }
    Button {
        id: andhraPradeshMapCloseButton
        text: qsTr("Close")
        x: 1860
        y: 5
        font.pointSize: 10
        onClicked: {
            andhraPradeshMapWindow.close();
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
