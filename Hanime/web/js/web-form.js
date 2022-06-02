function webFormInputNotEmpty(i) {
    if (i.value.length > 0) {
        i.classList.add('web__form__input__not__empty');
    } else {
        i.classList.remove('web__form__input__not__empty');
    }
}

const signupForm = document.getElementById("signup-form");

if (signupForm) {
    var isExist = 'true';

    const pwd = signupForm.querySelector("#password");
    const repwd = signupForm.querySelector("#re-password");
    const submit = signupForm.querySelector("button[type='submit']");
    const username = signupForm.querySelector("#username");

    submit.disabled = true;

    signupForm.onchange = async function (e) {
        if (e.target.id === "username")
            isExist = await fetch(`api/is-user-exist?username=${encodeURIComponent(username.value)}`).then(r => r.text());

        if (repwd.value === pwd.value && isExist === "false") {
            submit.disabled = false;
        } else {
            submit.disabled = true;
        }
    };
}