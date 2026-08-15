function togglePassword(){

    const password=document.getElementById("password");

    const eyeIcon=document.getElementById("eyeIcon");

    if(password.type==="password"){

        password.type="text";

        eyeIcon.setAttribute("href","#icon-eye-off");

    }

    else{

        password.type="password";

        eyeIcon.setAttribute("href","#icon-eye");

    }

}

const form=document.querySelector("form");

form.addEventListener("submit",function(e){

    e.preventDefault();

    const btn=document.getElementById("loginButton");

    btn.classList.add("loading");

    btn.disabled=true;

    btn.querySelector(".button-text").textContent="Sedang Masuk...";

});