document.addEventListener("turbolinks:load", function () {
    $input = $('#term')

    let options = {
        getValue: "title",
        url: function (phrase) {
            return "/microposts.json?term=" + phrase;
        },
        list: {
            onChooseEvent: function () {
                let url = $input.getSelectedItemData().id
                console.log(url);
                document.location = "/microposts/"+url
                
            }
        }
    }

    $input.easyAutocomplete(options)

})