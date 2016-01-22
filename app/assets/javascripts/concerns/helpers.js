// show the Ad dynamic after it "upload_intent"
function show_brand(input, img_ref) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(img_ref)
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

// Trigger click on invisible element
function trigger_invisible(target) {
    $(target).trigger('click');
}

// Onclick it element fire click on another
function trigger_click(target) {
    $(target).trigger('click');
}