let tableBody = document.getElementById("tableBody");

let time = new Date();
time.setHours(7);
time.setMinutes(0);

while (time.getHours() < 20) {
    let row = document.createElement("tr");
    let timeCell = document.createElement("td");
    timeCell.classList.add("col-md-1");
    timeCell.textContent = time.toLocaleTimeString([], {
        hour: '2-digit',
        minute: '2-digit'
    });
    row.appendChild(timeCell);

    for (let i = 0; i < 5; i++) {
        let cell = document.createElement("td");
        row.appendChild(cell);
    }

    tableBody.appendChild(row);
    time.setMinutes(time.getMinutes() + 15);
}

let row = document.createElement("tr");
let timeCell = document.createElement("td");
timeCell.classList.add("col-md-1");
timeCell.textContent = time.toLocaleTimeString([], {
    hour: '2-digit',
    minute: '2-digit'
});
row.appendChild(timeCell);

for (let i = 0; i < 5; i++) {
    let cell = document.createElement("td");
    row.appendChild(cell);
}

tableBody.appendChild(row);
