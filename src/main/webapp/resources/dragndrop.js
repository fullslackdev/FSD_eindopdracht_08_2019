$(document).ready(function() {
	var obj = $("#dragandrophandler");
	obj.on('dragenter', function (e) {
		e.stopPropagation();
		e.preventDefault();
		$(this).css('border', '2px solid #0B85A1');
	});
	obj.on('dragover', function (e) {
		e.stopPropagation();
		e.preventDefault();
	});
	obj.on('drop', function (e) {
		
		$(this).css('border', '2px dotted #0B85A1');
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files;
		
		//We need to send dropped files to Server
		handleFileUpload(files,obj);
	});
	$(document).on('dragenter', function (e) {
		e.stopPropagation();
		e.preventDefault();
	});
	$(document).on('dragover', function (e) {
		e.stopPropagation();
		e.preventDefault();
		obj.css('border', '2px dotted #0B85A1');
	});
	$(document).on('drop', function (e) {
		e.stopPropagation();
		e.preventDefault();
	}); 
});

function handleFileUpload(files,obj) {
	var fileSize = files[0].size;
	var fileName = files[0].name;
	if (checkFileSize(fileSize)) {
		$('.custom-file-label').text(fileName);
		file_selector.files = files;
		document.getElementById('file_button').removeAttribute('disabled');
		document.getElementById('button_icon').className = "fas fa-lock-open";
	} else {
		event.preventDefault();
		event.stopPropagation();
		document.getElementById('file_button').setAttribute('disabled', 'disabled');
		document.getElementById('button_icon').className = "fas fa-lock";
	}
	document.getElementById('demo_form').classList.add('was-validated');
}

function showPage() {
	document.getElementById('super_div').style.display = "block";
}

function hidePage() {
	document.getElementById('super_div').style.display = "none";
}	

$('#file_button').click(function () {
	console.log(file_selector.files[0].name + " " + file_selector.files[0].size);
	//document.getElementById('super_div').classList.add('dimScreen');
	hidePage();
	setTimeout(showPage, 3000);
});