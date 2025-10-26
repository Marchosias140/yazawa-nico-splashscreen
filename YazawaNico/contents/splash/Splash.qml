import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "#161616"
    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }
    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Rectangle {

        //property int sizeAnim: 500

        id: imageSource
	color:  "transparent"
	anchors.fill: parent
        clip: true;

        AnimatedImage {
            id: face
            source: "images/plasma_b.gif"
	    paused: false
	    anchors.fill: parent
            smooth: true
            visible: true
         }
    }
        Row {
            opacity: 1
            spacing: units.smallSpacing*3
            anchors {
                bottom: parent.bottom
                margins: units.gridUnit
            }
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
