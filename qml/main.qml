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

import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick 2.7
import QtPositioning 5.5
import QtLocation 5.6
import QtWebView 1.0
import QtQuick.Controls.Material 2.0
import panorama.Aqicn.DataProvider 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("iFresh")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        DataProvider {
            id: dataProvider
        }

        Page1 {
        }

        /*
         * This page will own the map.
         * The map gives accurate information
         * on the pollution sensors
         */
        Page {
            Pane {
                id: cardInfosProvider
                width: parent.width - 10
                height: parent.height/2 - 5
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                Material.elevation: 2

                Image {
                    id: aqicnImage
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 10
                    source: "qrc:/aqicn.png"
                }

                Label {
                    width: parent.width - 10
                    anchors.top: aqicnImage.bottom
                    anchors.topMargin: 10
                    anchors.leftMargin: 5
                    textFormat: Text.RichText
                    wrapMode: Text.WordWrap
                    text: qsTr("The World Air Quality Index project is a social enterprise project started in 2007.
                                Its mission is to promote Air Pollution awareness and provide a unified Air Quality
                                information for the whole world.
                                The project is proving a transparent Air Quality information for more than 70 countries,
                                covering more than 9000 stations in 600 major cities, via those two websites:
                                <a href=\"aqicn.org\">aqicn.org</a> and <a href=\"waqi.info\">waqi.info</a>. ")
                }
            }

            Pane {
                width: parent.width - 10
                height: parent.height/2 - 5
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: cardInfosProvider.bottom
                anchors.topMargin: 5
                Material.elevation: 2

                Image {
                    id: qtImage
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 10
                    source: "qrc:/qt.png"
                }

                Label {
                    width: parent.width - 10
                    anchors.top: qtImage.bottom
                    anchors.topMargin: 10
                    anchors.leftMargin: 5
                    textFormat: Text.RichText
                    wrapMode: Text.WordWrap
                    text: qsTr("Thanks for design reviews to : <br><br><b>* Claudia Emmanuelle <br>* Silaho Armelle </b><br><br>
                                Qt is a cross-platform application development framework for desktop, embedded and mobile.
                                Supported Platforms include Linux, OS X, Windows, VxWorks, QNX, Android, iOS, BlackBerry,
                                Sailfish OS and others.")
                }
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Search")
        }
        TabButton {
            text: qsTr("About")
        }
    }
}
