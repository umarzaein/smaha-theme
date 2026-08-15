document.addEventListener("DOMContentLoaded", () => {

    // =========================
    // Login Loading
    // =========================

    const form = document.getElementById("kc-form-login");
    const button = document.getElementById("kc-login");

    if(form && button){

        form.addEventListener("submit", () => {

            button.classList.add("loading");
            button.disabled = true;

        });

    }

    // =========================
    // Show / Hide Password
    // =========================

    const password = document.getElementById("password");
    const toggle = document.getElementById("togglePassword");

    if(password && toggle){

        toggle.addEventListener("click", () => {

            const visible = password.type === "text";

            password.type = visible ? "password" : "text";

            toggle.classList.toggle("active", !visible);

            toggle.setAttribute(
    "aria-label",
    visible ? "Show password" : "Hide password"
);

        });

    }

});