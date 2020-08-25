<template>
<ShowHtml>
</ShowHtml>
</template>

<script>
export default {
    mounted() {
        // simple
        lm.fetch({
        'url': '/customer/services/userInfos'
        });

        // complex
        const fetchOptions = {
        url: '/customer/services/userInfos',
        method : 'GET',
        headers: new Headers({
            'Content-Type' : 'application/json;charset=UTF-8'
        }),
        success : (result, fetchData) => {
            console.log(result);
            // > {"firstName":"john","lastName":"doe","customerNumber":"12345678","title":"1","forumId":null,"avatar":null}
            console.log(fetchData);
            // > {status: 200, headers: {}}
        },
        error : (err, fetchData) => {
            console.log(err);
            // if no cookie is given :
            // > {"status":"UNAUTHORIZED","timestamp":"12-09-2019 15:11:03.469","message":"fr.leroymerlin.customer.controllers.exceptions.CookieNotFoundException: idToken.jwt cookie missing. Unable to retrieve customer informations"}
            console.log(fetchData);
            // > {status: 500, headers: {}}
        },
        complete : (data) => {
            console.log(data);
            // you stil get the data
            // > {"firstName":"john","lastName":"doe","customerNumber":"12345678","title":"1","forumId":null,"avatar":null}
            // or
            // > {"status":"UNAUTHORIZED","timestamp":"12-09-2019 15:11:03.469","message":"fr.leroymerlin.customer.controllers.exceptions.CookieNotFoundException: idToken.jwt cookie missing. Unable to retrieve customer informations"}
        }
        };
        lm.fetch(fetchOptions);
    }
}
</script>