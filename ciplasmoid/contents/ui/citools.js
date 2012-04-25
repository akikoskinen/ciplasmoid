// While a build is in progress the status is reported with a question mark
var OKCodes = ["stable", "back to normal", "?"];

function handleItems(items) {
	var jenkinsTitleRE = /(.*) #[0-9]+ \((.*)\)/;
	var allOK = true;
	for (var i in items) {
		var result = jenkinsTitleRE.exec(items[i].title);
		if (result) {
			if (OKCodes.indexOf(result[2]) == -1) {
				allOK = false;
			}
		}
	}
	
	if (allOK) {
		icon.source = "plasmapackage:/images/success.png"
	} else {
		icon.source = "plasmapackage:/images/failure.png"
	}
}
