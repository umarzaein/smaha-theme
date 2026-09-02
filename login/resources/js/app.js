function togglePassword(){

    const password = document.getElementById("password");

    const eyeIcon = document.getElementById("eyeIcon");

    if(password.type === "password"){

        password.type = "text";

        eyeIcon.setAttribute("href","#icon-eye-off");

    }

    else{

        password.type = "password";

        eyeIcon.setAttribute("href","#icon-eye");

    }

}

document.addEventListener("DOMContentLoaded", function(){

    const form = document.querySelector("form");

    if (!form) {
        return;
    }

    form.addEventListener("submit", function(){

        const btn = document.getElementById("loginButton");

        if (!btn) {
            return;
        }

        btn.classList.add("loading");

        btn.disabled = true;

        const buttonText = btn.querySelector(".button-text");

        if (buttonText) {
            buttonText.textContent = "Sedang Masuk...";
        }

    });

});