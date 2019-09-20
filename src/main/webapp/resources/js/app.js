$(function () {
    console.log("dupa");
    $.ajax({
        url: "http://localhost:8080/api/books/getAll"
    }).done(function (resp) {
        console.log("dupa");
        renderList(resp);
    }).fail(function (err) {
        console.warn(err);
    });
});

function renderList(items) {

    items.forEach(function (item) {
        let divContainer = $("<div class='col-lg-4'>");
        let header = $("<h3 data-title=${item.title} data-id=${item.id}>");
        header.text(item.title);
        divContainer.append(header);
        let details = $(`<p data-id="${item.id}"></p>`);
        details.text(item.description);
        divContainer.append(details);
        let moreInfoBtn = $("<p><a class='btn btn-primary' href='#' role='button'>View details »</a></p>");
        divContainer.append(moreInfoBtn);
        $("#userBooks").append(divContainer);
    });

}
