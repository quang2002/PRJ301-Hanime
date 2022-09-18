const uid = document.currentScript.getAttribute("uid");
const fid = document.currentScript.getAttribute("fid");

async function toggleFollow(btn) {
    const res = await fetch(`api/toggle-follow?uid=${uid}&fid=${fid}`).then(r => r.text());

    if (res !== "follow") {
        btn.classList.add("btn-success");
        btn.classList.remove("btn-danger");
        btn.innerHTML = "follow";
    } else {
        btn.classList.remove("btn-success");
        btn.classList.add("btn-danger");
        btn.innerHTML = "unfollow";
    }
}