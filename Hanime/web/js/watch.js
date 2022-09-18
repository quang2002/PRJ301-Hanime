const userId = document.currentScript.getAttribute("user-id");
const videoId = document.currentScript.getAttribute("video-id");

window.addEventListener('load', () => {
    const rates = document.querySelectorAll('.hanime-rating');

    rates.forEach(rate => {
        const stars = rate.querySelectorAll('.hanime-rating__star');

        stars.forEach((s, i) => i < rate.dataset.value ? s.querySelector('i').classList.add('fas') : s.querySelector('i').classList.remove('fas'));

        stars.forEach((star, index) => {
            star.addEventListener('mouseenter', () => {
                stars.forEach((s, i) => i <= index ? s.querySelector('i').classList.add('fas') : s.querySelector('i').classList.remove('fas'));
            });

            star.addEventListener('mouseleave', () => {
                stars.forEach((s, i) => i < rate.dataset.value ? s.querySelector('i').classList.add('fas') : s.querySelector('i').classList.remove('fas'));
            });

            star.addEventListener('mousedown', () => {
                rate.dataset.value = star.dataset.value;
                fetch(`api/rate-video?vid=${videoId}&uid=${userId}&rate=${star.dataset.value}`);
            })
        });
    });

    const startTimestamp = Date.now();

    const timeCounter = setInterval(() => {
        const time = Date.now() - startTimestamp;

        if (time >= 1000 * 60 * 1) {
            clearInterval(timeCounter);

            fetch(`api/inc-video-view?id=${videoId}`).then(res => res.text()).then(view => {
                if (/\d+/.test(view))
                    document.getElementById('video-view').innerHTML = view;
            });
            fetch(`api/inc-user-exp?id=${userId}&exp=1`);
        }
    }, 1000);
});
