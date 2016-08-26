const CHART = document.getElementById('lineChart');
const RADAR = document.getElementById('radarChart');
Chart.defaults.scale.ticks.beginAtZero = true

var keys = [];
var values = [];

$.getJSON("nikefrequency.json", function(json) {
  $.each(json, function(k, v) {
    keys.push(k);
    values.push(v);
  });


var lineChart = new Chart(CHART, {
    type: 'bar',
    data: data = {
        labels: keys.slice(0,15),
        datasets: [
            {
                label: "Words frequency Based on 100 tweets about ruby",
                fill: false,
                lineTension: 0.1,
                backgroundColor: "rgba(75,192,192,0.4)",
                borderColor: "rgba(75,192,192,1)",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgba(75,192,192,1)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: values.slice(0,15)
            }

        ]
    }
});
});

var sentiment = [];
var scores = [];

$.getJSON("nike.json", function(json) {

  $.each(json, function(k, v) {
  sentiment.push(v.sentiment);
  scores.push(v.score);

  });


var radarChart = new Chart(RADAR, {
    type: 'line',
    data: data = {
        labels: sentiment,
        datasets: [
            {
                label: "Sentimental Based on 100 tweets about ruby",
                fill: false,
                lineTension: 0.1,
                backgroundColor: "rgba(75,192,192,0.4)",
                borderColor: "rgba(75,192,192,1)",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgba(75,192,192,1)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: scores
            }

        ]
    }
});
});
