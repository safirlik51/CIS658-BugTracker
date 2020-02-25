let allBugs = document.getElementById('bugList');
let columnTitles = allBugs.getElementsByTagName('th');

for(let i = 0; i<columnTitles.length; i++) {
	columnTitles[i].addEventListener('click', (event) => {
		let unsorted = allBugs.getElementsByTagName('tbody')[0];
		let sorted = unsorted.getElementsByTagName('tr');

		let sortedDuplicate = [];
		for(let rows of sorted){
			sortedDuplicate.push(rows);
		}
		for(let rows of sorted){
			unsorted.removeChild(rows);
		}

		sortedDuplicate.sort((a,b) => {
			return a.cells[i].textContent.localeCompare(b.cells[i].textContent);
		})
		sortedDuplicate.forEach((element) => {
			unsorted.appendChild(element);
		});
	});
}