const PAGE_SIZE = 10;

window.addEventListener("load", function () {
    document.querySelectorAll(".datatables").forEach(function (datatable) {
        datatable["currentPage"] = 0;
        datatable["totalRecords"] = datatable.querySelectorAll("tbody>tr").length;
        datatable["totalPages"] = Math.ceil(datatable["totalRecords"] / PAGE_SIZE);

        datatable["update-page"] = function () {
            document.querySelectorAll(`.page-number`).forEach(function (pageNumber) {
                if (document.querySelector(pageNumber.dataset.yuyuDatatables) === datatable)
                    pageNumber.innerHTML = datatable["currentPage"] + 1;
            });

            datatable.querySelectorAll("tbody>tr").forEach(function (record, index) {
                if (datatable["currentPage"] * PAGE_SIZE <= index && index < (datatable["currentPage"] + 1) * PAGE_SIZE) {
                    record.classList.remove("hidden");
                } else {
                    record.classList.add("hidden");
                }
            });
        }

        datatable["prev-page"] = function () {
            datatable["currentPage"] = Math.max(datatable["currentPage"] - 1, 0);
            datatable["update-page"]();
        };

        datatable["next-page"] = function () {
            datatable["currentPage"] = Math.min(datatable["currentPage"] + 1, datatable["totalPages"] - 1);
            datatable["update-page"]();
        };

        datatable["search"] = function (col, query) {
            query = query.toLowerCase();

            if (query === "") {
                datatable["update-page"]();
                return;
            }

            datatable.querySelectorAll("tbody>tr").forEach(function (record) {
                const innerText = record.querySelectorAll("td")[col].innerText.toLowerCase();
                if (innerText.indexOf(query) === -1) {
                    record.classList.add("hidden");
                } else {
                    record.classList.remove("hidden");
                }
            });
        };
    });

    document.querySelectorAll(`*[data-yuyu-click`).forEach(function (btn) {
        btn.datatable = document.querySelector(btn.dataset.yuyuDatatables);

        btn.addEventListener("click", btn.datatable[btn.dataset.yuyuClick]);
    });

    document.querySelectorAll(`*[data-yuyu-search-col]`).forEach(function (txt) {
        txt.datatable = document.querySelector(txt.dataset.yuyuDatatables);

        txt.addEventListener("keyup", function () {
            txt.datatable["search"](parseInt(txt.dataset.yuyuSearchCol), txt.value.trim());
        });
    });
});