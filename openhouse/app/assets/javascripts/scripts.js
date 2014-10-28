
window.onload = function(){
	$.ajax({
		url: "http://127.0.0.1:3000/houses",
		type: "GET"
	}).done(function(data){
		console.log(data);
		
		// people = JSON.parse(data);

		var houses = data;
		for (var i = 0; i < houses.length; i++) {
			addHouseToDom(houses[i]);
		}

		var mainSubmit = document.getElementById("main_submit");

		mainSubmit.addEventListener("click", function(){
			makeNewHouseFromPanel();
		});
	})
}

function addHouseToDom(house) {
//people[i] doesn't exist within this function
//you have to replace it with a parameter that is passed in
	var unorderedList = document.getElementById("moreHouses");

	var listItem = document.createElement("li");
	listItem.innerText = house["st_address"] + house["city"] + house["sch_date"] + house["sch_time"];
	unorderedList.appendChild(ListItem);
}

	//create a person hash from the bootstrap modal input boxes
	//send that person hash to the addPerson
function makeNewHouseFromPanel() {
	// var mainSubmit = document.getElementById("main_submit");

	var scheduleDate = document.getElementById("schedule_date");
	var newSchDate = scheduleDate.value;

	var scheduleTime = document.getElementById("schedule_time");
	var newSchTime = scheduleTime.value;

	var streetAddress = document.getElementById("street_address");
	var newStAddress = streetAddress.value;

	var city = document.getElementById("city");
	var newCity = city.value;

	var state = document.getElementById("state");
	var newState = state.value;

	var zip = document.getElementById("zip");
	var newZip = zip.value;

	var userId = document.getElementById("user_id");
	var newUserId = userId.value;

	$.ajax({
		url: "http://127.0.0.1:3000/houses",
		type: "POST",
		data: {	"sch_date": newSchDate,
		"sch_time": newSchTime,
		"st_address": newStAddress,
		"city": newCity,
		"state": newState,
		"zip": newZip,
		"user_id": newUserId}
	}).done(function(data) {
		console.log(data);
		var newHouse = data;

	addHouseToDom(newHouse);
	})
}
