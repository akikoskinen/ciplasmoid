import QtQuick 1.0
import org.kde.plasma.core 0.1 as PlasmaCore
import "citools.js" as CITools

Item {
	id: root
	property bool allOK: true
	
	property int minimumWidth: childrenRect.width
	property int minimumHeight: childrenRect.height

	Component.onCompleted: {
		plasmoid.addEventListener('ConfigChanged', configChanged)

		root.allOK = false
		root.allOK = true
	}
	
	onAllOKChanged: {
		var iconName = root.allOK ? "weather-clear" : "weather-storm"
		plasmoid.setPopupIconByName(iconName)
	}
	
	function configChanged() {
		source = plasmoid.readConfig("ciServerUrl")
		dataSource.connectedSources = [source + "/rssLatest"]
		console.debug("Source: " + source)
	}
	
	PlasmaCore.DataSource {
		id: dataSource
		engine: "rss"
		interval: 60 * 1000
		
		onNewData: {
			CITools.handleItems(data["items"])
		}
	}
	
	Timer {
		interval: 1000
		running: true
		repeat: false
		onTriggered: root.configChanged()
	}
	
	Text {
		text: root.allOK ? "Everythings good" : "Some failures"
	}
}
