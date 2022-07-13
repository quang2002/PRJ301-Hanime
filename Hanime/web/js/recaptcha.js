window.addEventListener('load', () => {
    document.getElementById('g-recaptcha-response').required = true;
    document.getElementById('g-recaptcha-response').onfocus = () => {
    };
});