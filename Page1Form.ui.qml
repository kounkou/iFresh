import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property alias textField1: textField1
    property alias button1: button1
    property alias pm25Indice: pm25Indice
    property alias pm25Rec: pm25Rec
    property alias rowLayout: rowLayout
    property alias imageIndice: imageIndice

    RowLayout {
        id:cityChange
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top

        TextField {
            id: textField1
            placeholderText: qsTr("Ville")
        }

        Button {
            id: button1
            text: qsTr("Recherche")
        }
    }

    ColumnLayout {
        id: rowLayout
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: cityChange.bottom
        anchors.topMargin: 40

        RowLayout
        {
            Rectangle {
                id: pm25Rec
                height: 80
                width: 80
                radius: 40
                color: "#4CAF50"

                Text {
                    id: pm25Indice
                    anchors.centerIn: parent
                    text: dataProvider.indicePM25
                    font.pointSize: 20
                    color: "white"
                }
            }
        }
    }

    Image {
        id: imageIndice
        x: 271
        source: "qrc:/Ecology-01.png"
        anchors.top:rowLayout.bottom
        anchors.topMargin: 21
        anchors.horizontalCenter: parent.horizontalCenter
    }

    RowLayout
    {
        id: othersIndices
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: imageIndice.bottom
        anchors.topMargin: 20
        spacing: 20

        RowLayout
        {
            Rectangle {
                height: 40
                width: 40
                radius: 20
                color: "#9E9E9E"

                Text {
                    id: pm10
                    anchors.centerIn: parent
                    text: dataProvider.indicePM10
                    font.pointSize: 15
                    color: "white"
                }
            }
        }
        RowLayout
        {
            Rectangle {
                height: 40
                width: 40
                radius: 20
                color: "#9E9E9E"

                Text {
                    id: o3
                    anchors.centerIn: parent
                    text: dataProvider.indiceO3
                    font.pointSize: 15
                    color: "white"
                }
            }
        }
        RowLayout
        {
            Rectangle {
                height: 40
                width: 40
                radius: 20
                color: "#9E9E9E"

                Text {
                    id: no2
                    anchors.centerIn: parent
                    text: dataProvider.indiceNo2
                    font.pointSize: 15
                    color: "white"
                }
            }
        }
        RowLayout
        {
            Rectangle {
                height: 40
                width: 40
                radius: 20
                color: "#9E9E9E"

                Text {
                    id: so2
                    anchors.centerIn: parent
                    text: dataProvider.indiceSo2
                    font.pointSize: 15
                    color: "white"
                }
            }
        }
        RowLayout
        {
            Rectangle {
                height: 40
                width: 40
                radius: 20
                color: "#9E9E9E"

                Text {
                    id: co
                    anchors.centerIn: parent
                    text: dataProvider.indiceCo
                    font.pointSize: 15
                    color: "white"
                }
            }
        }
    }

    RowLayout
    {
        anchors.top: othersIndices.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40

        Image {
            id: place
            source: "qrc:/marker.png"
        }

        Text {
            text: "Paris"
            font.pointSize: 30
        }
    }
}
