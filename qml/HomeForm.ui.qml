/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the iFresh application.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

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
    property alias indiceMessage: indiceMessage
    property alias pm25ClickableArea: pm25ClickableArea

    RowLayout {
        id:cityChange
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top

        TextField {
            id: textField1
            anchors.verticalCenter: parent.verticalCenter
            placeholderText: qsTr("City")
        }

        Button {
            id: button1
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("Search")
        }
    }

    ColumnLayout {
        id: rowLayout
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: cityChange.bottom
        anchors.topMargin: 30

        RowLayout
        {
            id: mainIndice
            antialiasing: true

            Rectangle {
                id: pm25Rec
                height: 120
                width : 120
                radius: 60
                color: "#9E9E9E"
                anchors.horizontalCenter: mainIndice.horizontalCenter

                Text {
                    id: indiceType
                    anchors.bottom: pm25Indice.top
                    anchors.horizontalCenter: pm25Rec.horizontalCenter
                    text: qsTr("PM2.5")
                    color: "white"
                }

                Text {
                    id: pm25Indice
                    anchors.centerIn: parent
                    text: dataProvider.indicePM25
                    font.pointSize: 30
                    color: "white"
                }

                Text {
                    id: indiceMessage
                    anchors.top: pm25Indice.bottom
                    anchors.horizontalCenter: pm25Rec.horizontalCenter
                    text: qsTr("Unhealthy")
                    color: "white"
                }

                MouseArea {
                    id: pm25ClickableArea
                    anchors.fill: parent
                }
            }
        }
    }

    Image {
        id: imageIndice
        source: "qrc:/images/Ecology-01.png"
        anchors.top:rowLayout.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
    }

    RowLayout {
        id: othersIndices
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: imageIndice.bottom
        anchors.topMargin: 20
        spacing: 10

        RowLayout {
            Rectangle {
                id: pm10Rec
                height: 60
                width: 60
                radius: 30
                color: "#9E9E9E"

                Text {
                    anchors.bottom: pm10.top
                    anchors.horizontalCenter: pm10Rec.horizontalCenter
                    text: qsTr("PM10")
                    font.pointSize: 13
                    color: "white"
                }

                Text {
                    id: pm10
                    anchors.centerIn: parent
                    text: dataProvider.indicePM10
                    font.pointSize: 15
                    color: "white"
                }
            }
        } RowLayout {
            Rectangle {
                id: o3Rec
                height: 60
                width: 60
                radius: 30
                color: "#9E9E9E"

                Text {
                    anchors.bottom: o3.top
                    anchors.horizontalCenter: o3Rec.horizontalCenter
                    textFormat: Text.RichText
                    text: qsTr("O<SUB>3</SUB>")
                    font.pointSize: 13
                    color: "white"
                }
                Text {
                    id: o3
                    anchors.centerIn: parent
                    text: dataProvider.indiceO3
                    font.pointSize: 15
                    color: "white"
                }
            }
        } RowLayout {
            Rectangle {
                id: no2Rec
                height: 60
                width: 60
                radius: 30
                color: "#9E9E9E"

                Text {
                    anchors.bottom: no2.top
                    anchors.horizontalCenter: no2Rec.horizontalCenter
                    textFormat: Text.RichText
                    text: qsTr("NO<SUB>2</SUB>")
                    font.pointSize: 13
                    color: "white"
                }
                Text {
                    id: no2
                    anchors.centerIn: parent
                    text: dataProvider.indiceNo2
                    font.pointSize: 15
                    color: "white"
                }
            }
        } RowLayout {
            Rectangle {
                id: so2Rec
                height: 60
                width: 60
                radius: 30
                color: "#9E9E9E"

                Text {
                    anchors.bottom: so2.top
                    anchors.horizontalCenter: so2Rec.horizontalCenter
                    textFormat: Text.RichText
                    text: qsTr("SO<SUB>2</SUB>")
                    font.pointSize: 13
                    color: "white"
                }
                Text {
                    id: so2
                    anchors.centerIn: parent
                    text: dataProvider.indiceSo2
                    font.pointSize: 15
                    color: "white"
                }
            }
        } RowLayout {
            Rectangle {
                id: coRec
                height: 60
                width: 60
                radius: 30
                color: "#9E9E9E"

                Text {
                    anchors.bottom: co.top
                    anchors.horizontalCenter: coRec.horizontalCenter
                    textFormat: Text.RichText
                    text: qsTr("CO<SUB>2</SUB>")
                    font.pointSize: 13
                    color: "white"
                }
                Text {
                    id: co
                    anchors.centerIn: parent
                    text: dataProvider.indiceCo
                    font.pointSize: 15
                    color: "white"
                }
            }
        }
    } RowLayout {
        anchors.top: othersIndices.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40

        Image {
            id: place
            source: "qrc:/marker.png"
        }

        Text {
            text: dataProvider.city
            font.pointSize: 30
        }
    }
}
