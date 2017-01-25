import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import QtQuick 2.7
import QtPositioning 5.5
import QtLocation 5.6
import QtWebView 1.0

import panorama.Aqicn.DataProvider 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("iFresh")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        DataProvider
        {
            id: dataProvider
        }

        Page1 {
        }

        /*
         * This page will own the map.
         * The map gives accurate information
         * on the area of interest.
         */
        Page {
            Rectangle {
               width: parent.width
               height: parent.height

               Plugin {
                   id: myPlugin
                   name: "osm"
               }

               PositionSource {
                   id: positionSource
                   property variant lastSearchPosition: locationOslo
                   active: true
                   updateInterval: 300000 // 5 mins
                   onPositionChanged:  {
                       var currentPosition = positionSource.position.coordinate
                       map.center = currentPosition
                       var distance = currentPosition.distanceTo(lastSearchPosition)
                       if (distance > 500) {
                           lastSearchPosition = currentPosition
                           searchModel.searchArea = QtPositioning.circle(currentPosition)
                           searchModel.update()
                       }
                   }
               }

               property variant locationOslo: QtPositioning.coordinate( 59.93, 10.76)

               PlaceSearchModel {
                   id: searchModel

                   plugin: myPlugin

                   searchTerm: mapSearch
                   searchArea: QtPositioning.circle(locationOslo)

                   Component.onCompleted: update()
               }

               Map {
                   id: map
                   anchors.fill: parent
                   plugin: myPlugin;
                   center: locationOslo
                   zoomLevel: 13

                   MapItemView {
                       model: searchModel
                       delegate: MapQuickItem {
                           coordinate: place.location.coordinate

                           anchorPoint.x: image.width * 0.5
                           anchorPoint.y: image.height

                           sourceItem: Column {
                               Image { id: image; source: "marker.png" }
                               Text  { text: title; font.bold: true }
                           }
                       }
                   }
               }

               Connections {
                   target: searchModel
                   onStatusChanged: {
                       if (searchModel.status == PlaceSearchModel.Error)
                           console.log(searchModel.errorString());
                   }
               }
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Recherche")
        }
        TabButton {
            text: qsTr("Carte")
        }
    }
}
