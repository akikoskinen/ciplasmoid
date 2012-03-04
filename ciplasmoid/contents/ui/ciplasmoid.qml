import QtQuick 1.0
import org.kde.plasma.core 0.1 as PlasmaCore
import "citools.js" as CITools

Image {
	id: icon
	source: "plasmapackage:/images/success.png"

	Component.onCompleted: {
		plasmoid.addEventListener('ConfigChanged', configChanged)
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
		onTriggered: icon.configChanged()
	}
}
