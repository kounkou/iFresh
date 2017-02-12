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
import QtPositioning 5.5
import QtLocation 5.6
import QtWebView 1.0

Page1Form {

    Timer {
        interval: 900000 // 15 min
        running: true
        repeat: true
        onTriggered: dataProvider.getPollutionInfos(dataProvider.city)
    }

    /*
    Popup {

        id: popup
        x: window.width - 2*window.width/3 - window.width/6
        y: window.height - 2*window.height/3 - window.width/6
        width: 2*window.width/3
        height: 2*window.height/3

        modal: true
        focus: true

        Pane {
            width: parent.width
            height: parent.height

            Material.elevation: 6

            Label {
                text: qsTr("I'm a card!")
                anchors.centerIn: parent
            }
        }

        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    }
    */

    button1.onClicked: {
        button1.enabled = false
        dataProvider.getPollutionInfos(textField1.text)
        textField1.text = ""
        button1.enabled = true
        console.log("Button Pressed. Entered text: " + textField1.text);
    }

    pm25Indice.onTextChanged: {
        if (dataProvider.indicePM25 <= 50) {
            pm25Rec.color = "#4CAF50"
            imageIndice.source = "qrc:/Ecology-1.svg"
            indiceMessage.text = "Good"
        }
        else if (dataProvider.indicePM25 > 50 && dataProvider.indicePM25 <= 100) {
            pm25Rec.color = "#FFC107"
            imageIndice.source = "qrc:/Ecology-2.svg"
            indiceMessage.text = "Moderate"
        }
        else if (dataProvider.indicePM25 > 100 && dataProvider.indicePM25 <= 150) {
            pm25Rec.color = "#FF5722"
            imageIndice.source = "qrc:/Ecology-3.svg"
            indiceMessage.text = "Unhealthy"
        }
        else if (dataProvider.indicePM25 > 150 && dataProvider.indicePM25 <= 200) {
            pm25Rec.color = "#F44336"
            imageIndice.source = "qrc:/Ecology-4.svg"
            indiceMessage.text = "Unhealthy"
        }
        else if (dataProvider.indicePM25 > 200 && dataProvider.indicePM25 <= 250) {
            pm25Rec.color = "#673AB7"
            imageIndice.source = "qrc:/Ecology-5.svg"
            indiceMessage.text = "Unhealthy"
        }
        else
        {
            pm25Rec.color = "#E91E63"
            imageIndice.source = "qrc:/Ecology-6.svg"
            indiceMessage.text = "Hazardous"
        }
    }

    pm25ClickableArea.onClicked : {
        // popup.open()
    }
}
