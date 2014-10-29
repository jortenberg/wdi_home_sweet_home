window.onload = function(){

		var clientSubmit = document.getElementById("client_submit");

		clientSubmit.addEventListener("click", function(){
			makeNewClientFromPanel();
		});
	}

function addClientToDom(client) {
//people[i] doesn't exist within this function
//you have to replace it with a parameter that is passed in
	var unorderedList = document.getElementById("moreClients");

	var listItem = document.createElement("li");
	listItem.innerHTML = "<a href='http://www.w3schools.com'>" + client["fname"] + " " + client["lname"] + "</a>";
	unorderedList.appendChild(listItem);
}

	//create a person hash from the bootstrap modal input boxes
	//send that person hash to the addPerson
function makeNewClientFromPanel() {
	// var mainSubmit = document.getElementById("main_submit");

	var firstName = document.getElementById("first_name");
	var newFirstName = firstName.value;
	firstName.value = "";

	var lastName = document.getElementById("last_name");
	var newLastName = lastName.value;
	lastName.value = "";

	var eMail = document.getElementById("email");
	var newEmail = eMail.value;
	eMail.value = "";

	var phoneNo = document.getElementById("phone");
	var newPhoneNo = phoneNo.value;
	phoneNo.value = "";

	var streetAddress = document.getElementById("st_address");
	var newStAddress = streetAddress.value;
	streetAddress.value = "";

	var city = document.getElementById("city");
	var newCity = city.value;
	city.value = "";

	var state = document.getElementById("state");
	var newState = state.value;
	state.value = "";

	var zip = document.getElementById("zip");
	var newZip = zip.value;
	zip.value = "";

	var areYou = document.getElementById("are_you");
	var newAreYou = areYou.value;
	areYou.value = "";

	var houseId = document.getElementById("house_id");
	var newHouseId = houseId.value;
	houseId.value = "";

	$.ajax({
		url: "http://localhost:3000/clients",
		type: "POST",
		data: {	"fname": newFirstName,
		"lname": newLastName,
		"email": newEmail,
		"phone": newPhoneNo,
		"st_address": newStAddress,
		"city": newCity,
		"state": newState,
		"zip": newZip,
		"house_id": newHouseId}
	}).done(function(data) {
		console.log(data);
		var newClient = data;

	addClientToDom(newClient);
	})
}
