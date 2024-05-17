import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

Window {
    id: mainWindowDashboard
    width: 1920
    height: 1080
    visible: true
    title: "Dashboard Window"
    x: 0
    //    flags: Qt.SplashScreen | Qt.FramelessWindowHint

      // Rectangle as a border
    Rectangle{
        id: rectangle
        anchors.fill: parent
        width: parent.width // Responsive width
        height: parent.height // Responsive height
        color: "indigo"
        border.color: "lime"
        border.width: 4
        radius: 10


        Image {
            id: map
            source: "qrc:/Maps/India_Map_3D.jpg"
            height: 1200
            width: 1950
        }


        //Current System Time
        property string currentTime: ""
        Text {
            id: timeDisplay
            text: currentTime
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.Left
            anchors.leftMargin: 50
            font.pixelSize: 24
            color: "white"
        }

        Timer {
            id: timer
            interval: 1000 // 1 second
            running: true
            repeat: true
            onTriggered: {
                updateTime();
            }
        }

        function updateTime() {
            var currentTimeObj = new Date();
            var hours = currentTimeObj.getHours();
            var minutes = currentTimeObj.getMinutes();
            var seconds = currentTimeObj.getSeconds();
            currentTime = formatTime(hours) + ":" + formatTime(minutes) + ":" + formatTime(seconds);
        }

        function formatTime(time) {
            return (time < 10 ? "0" + time : time);
        }

        Component.onCompleted: {
            updateTime();
        }


        //Click on Button to see the State Map Label
        Label{
            id:label
            font.family: modelData
            text: qsTr("Click on Button to see the State Map")
            font.bold :true
            font.pixelSize: 40
            color: "olivedrab"
            y: 30

            anchors {
                horizontalCenter: parent.horizontalCenter
            }
        }

        //Bihar Button
        StackView{
            id:biharStackView
            anchors.fill: parent
            initialItem: firstPage
        }
        Component{
            id:bihar_map
            Bihar_Map{}
        }
        Button {
            id: biharButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: password.bottom
                topMargin: 30
            }
            width: 170
            height: 60
            y: 100
            text: qsTr("Bihar")
            font.pixelSize: 20
            font.bold: true
            hoverEnabled: true

            background: Rectangle {
                id: buttonRect
                gradient: Gradient {
                    GradientStop { position: 0; color: "lightblue" }
                    GradientStop { position: 0.8; color: "green" }
                    GradientStop { position: 0.4; color: "magenta" }
                    GradientStop { position: 1; color: "skyblue" }
                }
                border.color: "black"
                border.width: 1
                radius: 5
            }
            contentItem: Text {
                text: biharButton.text
                font: biharButton.font
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "lightyellow"
            }
            onClicked: {
                stackView.push(bihar_map)
            }
        }

        //Jharkhand Button
        StackView{
            id:jharkandStackView
            anchors.fill: parent
            initialItem: firstPage
        }
        Component{
            id:jharkhand_map
            Jharkhand_Map{}
        }
        Button {
            //            ToolTip.visible: hovered
            //            ToolTip.text: "Click to See Jharkhand Map"
            id: jharkhandButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: password.bottom
                topMargin: 30
            }
            width: 170
            height: 60
            y: 200
            text: qsTr("Jharkhand")
            font.pixelSize: 20
            font.bold: true
            hoverEnabled: true

            background: Rectangle {
                id: buttonRectJharkhand
                gradient: Gradient {
                    GradientStop { position: 0; color: "lightblue" }
                    GradientStop { position: 0.8; color: "green" }
                    GradientStop { position: 0.4; color: "magenta" }
                    GradientStop { position: 1; color: "skyblue" }

                }
                border.color: "black"
                border.width: 1
                radius: 5
            }
            contentItem: Text {
                text: jharkhandButton.text
                font: jharkhandButton.font
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "lightyellow"
            }
            onClicked: {
                stackView.push(jharkhand_map)

            }
        }


        //Andhra Pradesh Button
        StackView{
            id:andhraPradeshStackView
        }
        Component{
            id:andhraPradesh_map
            Andhra_Pradesh{}
        }
        Button {
            id: andhraPradeshButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: password.bottom
                topMargin: 30
            }
            width: 170
            height: 60
            y: 300
            text: qsTr("Andhra Pradesh")
            font.pixelSize: 20
            font.bold: true
            hoverEnabled: true

            background: Rectangle {
                id: buttonRectAndhraPradesh
                gradient: Gradient {
                    GradientStop { position: 0; color: "lightblue" }
                    GradientStop { position: 0.8; color: "green" }
                    GradientStop { position: 0.4; color: "magenta" }
                    GradientStop { position: 1; color: "skyblue" }

                }
                border.color: "black"
                border.width: 1
                radius: 5
            }
            contentItem: Text {
                text: andhraPradeshButton.text
                font: andhraPradeshButton.font
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "lightyellow"
            }
            onClicked: {
                stackView.push(andhraPradesh_map)
            }
        }


        //Uttar Pradesh Button
        StackView{
            id:uttarPradeshStackView
        }
        Component{
            id:uttarPradesh_map
            Uttar_Pradesh{}
        }
        Button {
            id: uttarPradeshButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: password.bottom
                topMargin: 30
            }
            width: 170
            height: 60
            y: 400
            text: qsTr("Uttar Pradesh")
            font.pixelSize: 20
            font.bold: true
            hoverEnabled: true

            background: Rectangle {
                id: buttonRectUttarPradesh
                gradient: Gradient {
                    GradientStop { position: 0; color: "lightblue" }
                    GradientStop { position: 0.8; color: "green" }
                    GradientStop { position: 0.4; color: "magenta" }
                    GradientStop { position: 1; color: "skyblue" }

                }
                border.color: "black"
                border.width: 1
                radius: 5
            }
            contentItem: Text {
                text: uttarPradeshButton.text
                font: uttarPradeshButton.font
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "lightyellow"
            }
            onClicked: {
                stackView.push(uttarPradesh_map)
            }
        }


        //Karnataka Button
        StackView{
            id:karnatakaStackView
        }
        Component{
            id:karnataka_map
            Karnataka{}
        }
        Button {
            id: karnatakaButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: password.bottom
                topMargin: 30
            }
            width: 170
            height: 60
            y: 500
            text: qsTr("Karnataka")
            font.pixelSize: 20
            font.bold: true
            hoverEnabled: true

            background: Rectangle {
                id: buttonRectKarnataka
                gradient: Gradient {
                    GradientStop { position: 0; color: "lightblue" }
                    GradientStop { position: 0.8; color: "green" }
                    GradientStop { position: 0.4; color: "magenta" }
                    GradientStop { position: 1; color: "skyblue" }
                }
                border.color: "black"
                border.width: 1
                radius: 5
            }
            contentItem: Text {
                text: karnatakaButton.text
                font: karnatakaButton.font
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "lightyellow"
            }
            onClicked: {
                stackView.push(karnataka_map)
            }
        }


        //West Bengal Button
        StackView{
            id:westBengalStackView
        }
        Component{
            id:westBengal_map
            West_Bengal{}
        }
        Button {
            id: westBengalButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: password.bottom
                topMargin: 30
            }
            width: 170
            height: 60
            y: 600
            text: qsTr("West Bengal")
            font.pixelSize: 20
            font.bold: true
            hoverEnabled: true

            background: Rectangle {
                id: buttonRectWestBengal
                gradient: Gradient {
                    GradientStop { position: 0; color: "lightblue" }
                    GradientStop { position: 0.8; color: "green" }
                    GradientStop { position: 0.4; color: "magenta" }
                    GradientStop { position: 1; color: "skyblue" }

                }
                border.color: "black"
                border.width: 1
                radius: 5
            }
            contentItem: Text {
                text: westBengalButton.text
                font: westBengalButton.font
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "lightyellow"
            }
            onClicked: {
                stackView.push(westBengal_map)
            }
        }

        //Logout Button
        Button {
            id: logoutButton
            anchors {
                right: parent.right
                top: parent.top
                topMargin: 10
                rightMargin: 20
            }
            width: 150
            height: 60
            text: qsTr("Logout")
            font.pixelSize: 20
            font.bold: true
            hoverEnabled: true

            background: Rectangle {
                id: buttonRectLogout
                gradient: Gradient {
                    GradientStop { position: 0; color: "red" }
                    GradientStop { position: 1; color: "darkred" }

                }
                border.color: "#556B2F"
                border.width: 1
                radius: 5
            }
            contentItem: Text {
                text: logoutButton.text
                font: logoutButton.font
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "lightgreen"
            }
            onPressed: {
                buttonRect.color = "#6B8E23";
            }

            onReleased: {
                buttonRect.color = "#9ACD32";
            }

            onClicked: {
                mainWindowDashboard.close();
            }

        }
    }
}

