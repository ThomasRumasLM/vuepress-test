<template>
<ShowHtml>
<div class="ctn">
    <div class="example">
        <div class="km-table-card o-cards-card km-table-card--white">
            <h3 class="km-table-card__title">test</h3>
            <div class="km-table-card__step">
                <img alt="" class="km-table-card__step--icon"
                    src="https://m1.lmcdn.fr/media/15/5d382500b7c5054553961ae8/592480431/ecosaving5d38250058dcd300014824dd.png">
                <div class="km-table-card__step--container">
                    <p class="km-table-card__step--title">test1</p>
                    <span class="km-table-card__step--detail">test2</span>
                </div>
            </div>
            <input type="checkbox" id="tableCard-940-0-484" class="km-table-card__trigger">
            <div class="km-table-card__detail">
                <p class="km-table-card__detail--title">test3</p>
                <p>tototo</p>
            </div>
            <label for="tableCard-940-0-484" class="km-table-card__trigger--label">
                En savoir plus
            </label>
        </div>
    </div>
    <div class="example">
        <div class="km-table-card o-cards-card km-table-card--black">
            <h3 class="km-table-card__title">test</h3>
            <div class="km-table-card__step">
                <img alt="" class="km-table-card__step--icon"
                    src="https://m1.lmcdn.fr/media/15/5d382500b7c5054553961ae8/592480431/ecosaving5d38250058dcd300014824dd.png">
                <div class="km-table-card__step--container">
                    <p class="km-table-card__step--title">test1</p>
                    <span class="km-table-card__step--detail">test2</span>
                </div>
            </div>
            <input type="checkbox" id="tableCard-940-1-484" class="km-table-card__trigger">
            <div class="km-table-card__detail">
                <p class="km-table-card__detail--title">test3</p>
                <p>tototo</p>
            </div>
            <label for="tableCard-940-1-484" class="km-table-card__trigger--label">
                En savoir plus
            </label>
        </div>
    </div>
</div>
</ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/06-molecules/tableCard.molecules';

.ctn {
  display: flex;
  justify-content: center;
}

.example {
  flex: 0 0 33%;
  margin: 0 10px;
}
</style>