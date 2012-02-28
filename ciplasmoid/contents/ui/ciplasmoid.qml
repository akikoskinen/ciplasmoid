import QtQuick 1.0
import org.kde.plasma.core 0.1 as PlasmaCore
import "citools.js" as CITools

Image {
	id: icon
	source: "plasmapackage:/images/success.png"

	PlasmaCore.DataSource {
		id: dataSource
		engine: "rss"
		connectedSources: ["http://localhost:2000/rssLatest"]
		interval: 60 * 1000
		
		onNewData: {
			CITools.handleItems(data["items"])
		}
	}
}
