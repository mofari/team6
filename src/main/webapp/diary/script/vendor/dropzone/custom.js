$(function(){
	Dropzone.options.myAwesomedropzone = {
		paramName: "file",
		url: 'upload.php',
		maxFilesize: 5,
		addRemoveLinks: true,
		thumbnailWidth: 140,
		dictResponseError: "Server not Configured",
		acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
		init: function(){
			var self = this;
			// config
			self.options.addRemoveLinks = true;
			self.options.dictRemoveFile = "Delete";

			// Send file starts
			self.on("sending", function (file) {
				$(".meter").show();
			});

			// File upload Progress
			self.on("totaluploadprogress", function (progress) {
				$(".roller").width(progress + "%");
			});

			self.on("queuecomplete", function (progress) {
				$(".meter").delay(999).slideUp(999);
			});
		}
	};
});