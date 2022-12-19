// Product Detail Size choose Js
$(document).ready(function () {
    $(".size").click(function () {
        if ($(".size-active").length) {
            $(".size-active")
                .not($(this))
                .removeClass("size-active")
                .addClass("size");
        }
        $(this).removeClass("size").addClass("size-active");
    });
});
// Product Detail Size choose Js
// Product Detail Image Size choose Js
$(document).ready(function () {
    $(".imagesize").click(function () {
        if ($(".imagesize-active").length) {
            $(".imagesize-active")
                .not($(this))
                .removeClass("imagesize-active")
                .addClass("image-size");
        }
        $(this).removeClass("image-size").addClass("imagesize-active");
    });
});
// Product Detail Image Size choose Js

// Input Increase and Decrease
$(document).ready(function () {
    $(".count").prop("disabled", true);
    $(document).on("click", ".plus", function () {
        $(".count").val(parseInt($(".count").val()) + 1);
    });
    $(document).on("click", ".minus", function () {
        $(".count").val(parseInt($(".count").val()) - 1);
        if ($(".count").val() == 0) {
            $(".count").val(1);
        }
    });
});

// Input Increase and Decrease Ends
