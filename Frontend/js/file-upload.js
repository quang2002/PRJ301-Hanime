window.addEventListener('load', () => {
    const fileUploads = document.querySelectorAll('.file-upload');
    fileUploads.forEach(fileUpload => {
        const hiddenData = fileUpload.parentElement.querySelector('.file-upload ~ input[type="hidden"]');

        fileUpload.addEventListener('change', function () {
            if (!this.files || !this.files[0]) return;

            if (fileUpload.dataset.maxSize && this.files[0].size > parseInt(fileUpload.dataset.maxSize)) {
                fileUpload.dataset.errorMaxSize && alert(fileUpload.dataset.errorMaxSize);
                this.value = '';
                return;
            }

            const fr = new FileReader();

            fr.addEventListener("load", function (evt) {
                document.getElementById(fileUpload.dataset.img).src = evt.target.result;
                if (hiddenData) hiddenData.value = evt.target.result;
            });

            fr.readAsDataURL(this.files[0]);
        });
    });
});