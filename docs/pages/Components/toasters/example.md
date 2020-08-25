<template>
<ShowHtml>
<p class="subtitle">Success</p>
<div class="mc-notification mc-notification--success mc-notification-closable myContainerClass" id="myContainerId" data-toto="toto"> <div class="mc-notification__content"> <h3 class="mc-notification__title">My notificatition title</h3> <p class="mc-notification__message"> Success <br> TEST </p> <a class="mc-notification__link mc-link" href="/tutu" data-cerberus="mycerberus-tag" id="myId">my link content</a> </div> <button type="button" class="mc-notification-closable__close " title="Close"> </button> </div>

<p class="subtitle">Info</p>
<div class="mc-notification "> <div class="mc-notification__content"> <p class="mc-notification__message"> Info <br> TEST </p> </div> </div>

<p class="subtitle">Warning</p>
<div class="mc-notification mc-notification--warning"> <div class="mc-notification__content"> <p class="mc-notification__message"> Warning <br> TEST </p> </div> </div>

<p class="subtitle">Danger</p>
<div class="mc-notification mc-notification--danger" role="alert"> <div class="mc-notification__content"> <p class="mc-notification__message"> Danger <br> TEST </p> </div> </div>
</ShowHtml>
</template>


<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/05-atoms/toaster.atoms';
</style>
