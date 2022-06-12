window.addEventListener('load', () => {
    const fileUploads = document.querySelectorAll('.file-upload');
    fileUploads.forEach(fileUpload => {
        const hiddenData = fileUpload.parentElement.querySelector('.file-upload ~ input[type="hidden"]');

        fileUpload.addEventListener('change', function () {
            if (!this.files || !this.files[0])
                return;

            if (fileUpload.dataset.maxSize && this.files[0].size > parseInt(fileUpload.dataset.maxSize)) {
                fileUpload.dataset.errorMaxSize && alert(fileUpload.dataset.errorMaxSize);
                this.value = '';
                return;
            }

            const reader = new FileReader();

            reader.onloadend = function () {
                const img = new Image();
                img.src = reader.result;

                img.onload = function () {
                    const MAX_WIDTH = parseInt(fileUpload.dataset.maxWidth) || Infinity;
                    const MAX_HEIGHT = parseInt(fileUpload.dataset.maxHeight) || Infinity;

                    let width = img.width;
                    let height = img.height;

                    if (width > height) {
                        if (width > MAX_WIDTH) {
                            height *= MAX_WIDTH / width;
                            width = MAX_WIDTH;
                        }
                    } else {
                        if (height > MAX_HEIGHT) {
                            width *= MAX_HEIGHT / height;
                            height = MAX_HEIGHT;
                        }
                    }

                    const canvas = document.createElement('canvas');
                    canvas.width = width;
                    canvas.height = height;
                    const ctx = canvas.getContext("2d");
                    ctx.drawImage(this, 0, 0, width, height);
                    const b64 = canvas.toDataURL("image/jpeg");

                    document.getElementById(fileUpload.dataset.img).src = b64;
                    if (hiddenData)
                        hiddenData.value = b64;
                };
            };

            reader.readAsDataURL(this.files[0]);
        });
    });
});