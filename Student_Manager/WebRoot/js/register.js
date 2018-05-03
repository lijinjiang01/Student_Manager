function showPic(obj, id) {
	var newPreview = document.getElementById('pic' + id);
	if (obj) {
		// ie浏览器兼容
		if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
			obj.select();
			newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";

			var path = document.selection.createRange().text;
			var flag = judgeImgSuffix(path);
			if (flag) {
				newPreview.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.selection
						.createRange().text;
			} else {
				alert("要求图片格式为png,jpg,jpeg,bmp");
			}

			return;
		}
		// 其他浏览器兼容
		else{
			if (obj.files) {
				newPreview.src = window.URL.createObjectURL(obj.files.item(0));
				return;
			}
			newPreview.src = obj.value;
			return;
		}
		newPreview.src = obj.value;
		return;
	}
}

function judgeImgSuffix(path) {
	var index = path.lastIndexOf('.');
	var suffix = "";
	if (index > 0) {
		suffix = path.substring(index + 1);
	}
	if ("png" == suffix || "jpg" == suffix || "jpeg" == suffix
			|| "bmp" == suffix || "PNG" == suffix || "JPG" == suffix
			|| "JPEG" == suffix || "BMP" == suffix) {
		return true;
	} else {
		return false;
	}

}