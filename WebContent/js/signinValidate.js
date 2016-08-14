function LowerCase(x){
        var t = document.getElementById('email').value;
        document.getElementById('email').value = t.toLowerCase();
    }
	function validate(){
        $("#login").validate({
            rules: {
                email: "required",
                password: "required"
            },
            messages: {
                email: "Please enter your email address",
                password: "Please enter your password"
            },
        });
        if(!$("form").valid()) {
            return false;
        }
        else {
        	document.login.submit();
        }

}