var colors = ["#B3E700", "#05579C", "#F28C00", "#AD008C", "#FF2C00"]

function Data (choices, num) {
  var data=[
  ]
  

  this.data = data;
  // this.innerData = innerData
  this.choices = $(choices).find('td');

  for (var i = 0; i < num; i++) {
    value = this.choices[i]
    stringValue = $(value).text();
    integerValue = parseInt(stringValue);
    color = colors[i];
    data.push({})
    data[i].color = color
    data[i].value = integerValue
  };
  // console.log(this.data);
}


function Pie (index) {
  // this.data = data
  this.index = index
  this.choices = $('table .totals')[index];
  this.numOfChoices = $(this.choices).find('td').length;

  this.data = new Data(this.choices, this.numOfChoices)

  console.log(this.data.data);

  // this.data[index].value = 75;
  // console.log(this.data);


    ctx = $('canvas')[this.index].getContext("2d");
      piechart = new Chart(ctx).Pie(this.data.data);
    // console.log(data);
  }



$(document).ready(function() {

  numOfCharts = $('ol li');

  for (var i = 0; i <= numOfCharts.length - 1; i++) {

    new Pie(i);

  };




});
