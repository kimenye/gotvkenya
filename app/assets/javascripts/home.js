$(function(){
    $('#mailinglist').validate({
        submitHandler: function(form) {
            $('.duplicate').hide();
            $.ajax(
                {
                    url: "/subscribe",
                    type: "POST",
                    data: { fan: {
                        answer: $('#answer').val(),
                        name: $('#name').val(),
                        email: $('#email').val()
                    }
                },
                success: function(resp){
                    var response = $.parseJSON(resp);
                    if (response.id == null) {
                        //user has already subscribed
                        $('.duplicate').show();
                    } else {
                        $('.register').hide();
                        $('#fan_name').html(response.name);
                        $('.thankyou').slideDown(500,function(){
                            $('.tab-title.tab1').trigger('click');
                        });
                    }

                }
            });
            return false;
        },
        invalidHandler: function(event, validator) {

        }
    });

    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
});