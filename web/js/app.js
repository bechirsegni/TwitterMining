Chart.defaults.scale.ticks.beginAtZero = true

function includeJs(jsFilePath) {
    var js = document.createElement("script");

    js.type = "text/javascript";
    js.src = jsFilePath;

    document.body.appendChild(js);
}

includeJs("./js/bar.js");
includeJs("./js/line.js");
