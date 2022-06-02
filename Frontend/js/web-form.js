function webFormInputNotEmpty(i) {
    if (i.value.length > 0) {
        i.classList.add('web__form__input__not__empty');
    } else {
        i.classList.remove('web__form__input__not__empty');
    }
}
