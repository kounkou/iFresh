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
                    source: "qrc:/images/aqicn.png"
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
                    source: "qrc:/images/qt.png"
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
