<#assign defaultMissingMessage="Ce champ est obligatoire" >
<#assign defaultMismatchMessage="Ce champ ne respecte pas le format attendu : " >
<#assign defaultPatterns = {
    "input" : {
        "email" : {
            <#--  ISO Legacy - Validation ADEO  -->
            "pattern" : "^[a-zA-Z0-9!\x23$%\x26\x27*+=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!\x23$%\x26\x27*+=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$",
            "mismatch" : "le champ doit contenir @ et une extension comme .fr ou .com"
        },
        "password" : {
            <#--  ISO Legacy - Validation ADEO  -->
            "pattern" : "^(?=^.{6,}$)(?=.*\\d)(?=.*[A-Za-z])[A-Za-z\\d&<>!#$%()*+,\\-\\./:;=?@\\[\\]^_{|}~]*$",
            "minlength" : 6,
            "maxlength" : 50,
            "mismatch" : "le mot de passe doit comporter au moins 6 caractères, dont au moins une lettre et un chiffre "
        },
        "search" : {
            "pattern" : "([^<>{}])*" <#-- A completer -->
        },
        "tel" : {
            "pattern" : "^((\\+|00)33\\s?|0)[1-9](\\s?\\d{2}){4}$",
            "maxlength": 30
        },
        "text" : {
            "pattern" : "([a-zA-Z0-9_\\-éèëêàâäôöùûüîïç' ]*)",
            "maxlength" : 250,
            "minlength" : 6
        },
        "date" : {},
        "number" : {}
    },
    "none" : {
        <#-- A minima - bloque la saisie de css {} et de balise html <> -->
        "pattern" : "([^<>{}])*"
    }
} >
<#assign defaultCaptchaKey = '6LdGeDcUAAAAALfoMZ2Ltv4EE6AHIYb8nSxhCRh_'>