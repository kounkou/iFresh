import QtQuick 2.7

Page1Form {
    button1.onClicked: {
        dataProvider.getPollutionInfos()
        console.log("Button Pressed. Entered text: " + textField1.text);
    }

    pm25Indice.onTextChanged: {
        if (dataProvider.indicePM25 <= 50) {
            pm25Rec.color = "#4CAF50"
            imageIndice.source = "Ecology-1.png"
        }
        else if (dataProvider.indicePM25 > 50 && dataProvider.indicePM25 <= 100) {
            pm25Rec.color = "#FFC107"
            imageIndice.source = "Ecology-2.png"
        }
        else if (dataProvider.indicePM25 > 100 && dataProvider.indicePM25 <= 150) {
            pm25Rec.color = "#FF5722"
            imageIndice.source = "Ecology-3.png"
        }
        else if (dataProvider.indicePM25 > 150 && dataProvider.indicePM25 <= 200) {
            pm25Rec.color = "#F44336"
            imageIndice.source = "Ecology-4.png"
        }
        else if (dataProvider.indicePM25 > 200 && dataProvider.indicePM25 <= 250) {
            pm25Rec.color = "#673AB7"
            imageIndice.source = "Ecology-5.png"
        }
        else
        {
            pm25Rec.color = "#E91E63"
            imageIndice.source = "Ecology-6.png"
        }
    }
}
