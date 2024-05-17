import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

Window {
    id: mainWindow
    width: 2000
    height: 1000
    visible: true
    color: "dodgerblue" // chocolate  crimson
    title: qsTr("Login Window")

    Image {
        id: map
        source: "qrc:/Maps/India-Satellite-Map.jpg"
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
        anchors.topMargin: 680
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


    //Rectangle in the centre
    Rectangle{

        id: rectangle
        anchors.centerIn: parent
        width: mainWindow.width * 0.3 //Rectangle's width responsive
        height: mainWindow.height * 0.35 //Rectangle's height responsive
        color: "lemonchiffon" // greenyellow  azure
        border.color: "magenta"
        border.width: 4
        radius: 10
        //Enter User Name and Password Label
        Label{
            id:label
            text: qsTr("Enter User Name and Password")
            font.bold :true
            font.pixelSize: 20
            color: "royalblue"
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: userName.top
                bottomMargin: 50
            }
        }
        //User Name TextField
        TextField{
            id:userName
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 110
            }
            width: parent.width * 0.8
            height: parent.height * 0.1
            placeholderText: qsTr("Enter User Name")
            placeholderTextColor: "black"
        }
        //Password TextField
        TextField{
            id:password
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: userName.bottom
                topMargin: 40
            }
            width: parent.width * 0.8
            height: parent.height * 0.1
            placeholderText: qsTr("Enter Password")
            placeholderTextColor: "black"
            echoMode: TextInput.Password
        }
        //StackView to open another window
        StackView{
            id:stackView
            anchors.fill: parent
            initialItem: firstPage
        }
        Component{
            id:secondPage
            DashBoard{}
        }
        //Login Button
        Button {
            id: loginButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: password.bottom
                topMargin: 30
            }
            width: 150
            height: 60
            text: qsTr("Login")
            font.pixelSize: 20
            font.bold: true
            hoverEnabled: true

            background: Rectangle {
                id: buttonRect
                gradient: Gradient {
                    GradientStop { position: 0; color: "red" }
                    GradientStop { position: 1; color: "#6B8E23" }
                    GradientStop { position: 0.5; color: "blue" }
                    GradientStop { position: 0.8; color: "yellow" }
                    GradientStop { position: 0.9; color: "white" }
                    GradientStop { position: 0.7; color: "magenta" }
                    GradientStop { position: 0.6; color: "violet" }
                    GradientStop { position: 0.2; color: "lightgreen" }
                }
                border.color: "black"
                border.width: 1
                radius: 5
            }
            contentItem: Text {
                text: loginButton.text
                font: loginButton.font
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "lightyellow"
            }
            onPressed: {
                buttonRect.color = "#6B8E23";
            }

            onReleased: {
                buttonRect.color = "#9ACD32";
            }

            //Verification and validation of User Name and Password
            onClicked: {
                var messageDialog = Qt.createQmlObject('import QtQuick.Dialogs 1.2; MessageDialog{}',parent);
                messageDialog.standardButtons = StandardButton.Ok;
                if(userName.text == "pappu" && password.text == "pappu")
                {
                    stackView.push(secondPage)
                    userName.text = ""
                    password.text = ""
                    mainWindow.close();
                }
                else if(userName.text == "pappu" && password.text == "")
                {
                    messageDialog.text = "Please Enter Password";
                    password.text = ""
                    messageDialog.open();
                }
                else if(userName.text == "" && password.text == "")
                {
                    messageDialog.text = "Please Enter User Name and Password";
                    messageDialog.open();
                }
                else if(userName.text == "" && password.text == "pappu")
                {
                    messageDialog.text = "Please Enter User Name";
                    userName.text = ""
                    messageDialog.open();
                }
                else if(userName.text == "pappu" && password.text != "pappu")
                {
                    messageDialog.text = "Please Enter Valid Password";
                    password.text = ""
                    messageDialog.open();
                }
                else if(userName.text != "pappu" && password.text == "pappu")
                {
                    messageDialog.text = "Please Enter Valid User Name";
                    userName.text = ""
                    messageDialog.open();
                }
                else
                {
                    messageDialog.text = "Invalid User Name and Password";
                    userName.text = ""
                    password.text= ""
                    messageDialog.open();
                }
            }
            ToolTip.visible: hovered
            ToolTip.text: "Click to Login"
        }
    }
}
