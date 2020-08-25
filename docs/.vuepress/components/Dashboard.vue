<template>
  <div>
    <h2>Last versions</h2>
    <section class="col-container-inner db__current">
      <div class="col-12 col-xl-6 db__current--item">
        <div>Core version</div>
        <span type="button" class="mc-tag-text mc-tag-text--s mc-tag-text--dark version up-to-date">
          <span class="mc-tag-text__label">{{currentCore}}</span>
        </span>
      </div>
      <div class="col-12 col-xl-6 db__current--item">
        <div>KOBI version</div>
        <span type="button" class="mc-tag-text mc-tag-text--s mc-tag-text--dark version up-to-date">
          <span class="mc-tag-text__label">{{currentKobi}}</span>
        </span>
      </div>
      <span class="col-12 db__update-time">Last update: {{lastUpdateDate}}</span>
    </section>

    <h2>Legend</h2>
    <section class="col-container-inner db__legend">
      <div class="col-12 col-xl-6">
        <p>
          <span class="db__legend--bullet up-to-date"></span> Up to date component
        </p>
        <p>
          <span class="db__legend--bullet behind-patch"></span> Same minor version, some patches missing
        </p>
        <p>
          <span class="db__legend--bullet behind-minor"></span> Same major version, some minor versions missing
        </p>
        <p>
          <span class="db__legend--bullet behind-major"></span> Some major versions missing
        </p>
        <p>
          <span class="db__legend--bullet not-on-tag"></span> Development version / Info unavailable
        </p>
      </div>
      <p class="col-12 col-xl-6">
        ⚠️ After the Github migration the application names and the URLs doesn't match.
        <br />We use the repository URL provided in Turbine.
        <br />If your application appears unavailable, please check this information in Turbine > component > details
      </p>
    </section>

    <h2>Dependencies versions in LMFR applications</h2>
    <section class="db__app">
      <div class="db__app--filter">
        <button class="mc-tag js-reset-filters">reset filters</button>
        <input
          class="db__app--input"
          type="text"
          id="filter"
          placeholder="Chercher des applications"
        />
      </div>
      <div class="db__app--content col-container-inner">
        <DashboardCard
          v-for="(item, i) in dashboardObject"
          :key="i"
          :name="item[0]"
          :team="item[1].team"
          :coreVersion="item[1].coreVersion"
          :statusCore="item[1].statusCore"
          :kobiVersion="item[1].kobiVersion"
          :statusKobi="item[1].statusKobi"
        />
      </div>
    </section>
  </div>
</template>

<script>
import DashboardCard from "./DashboardCard.vue";
const dashboard = require("../../pages/Dashboard/dependenciesdashboard");
const dashboardObject = dashboard.dashboardObject;
const currentCore = dashboard.currentCore;
const currentKobi = dashboard.currentKobi;
const lastUpdateDate = dashboard.lastUpdateDate;

export default {
  name: "Dashboard",
  components: {
    DashboardCard,
  },
  data: () => ({
    dashboardObject: dashboardObject,
    currentCore: currentCore,
    currentKobi: currentKobi,
    lastUpdateDate: lastUpdateDate,
  }),
  methods: {
    filterApp() {
      this.searchField.addEventListener("keyup", e => {
        let searchString = e.target.value;

        if (searchString == "") {
          [].forEach.call(this.appList, el => {
            el.classList.remove("kl-hidden");
          });
          return;
        }

        [].forEach.call(this.appList, el => {
          el.classList.add("kl-hidden");
        });

        let searchTerms = searchString.split(",");
        for (var i = searchTerms.length - 1; i >= 0; i--) {
          if (searchTerms[i].trim() == "") {
            continue;
          }
          let match = this.target.querySelectorAll(
            "article.js-app[id*=" + searchTerms[i] + "]"
          );
          [].forEach.call(match, el => {
            el.classList.remove("kl-hidden");
          });
        }
      });
    },
    filterByParams() {
      let urlParams = new URLSearchParams(window.location.search);
      let query = urlParams.get("search");
      this.searchField.value = query;
      this.searchField.dispatchEvent(new Event("keyup"));
    },
    filterByTeam(target) {
      let teamName = target.textContent;
      console.log(teamName);
      [].forEach.call(this.appList, el => {
        el.classList.add("kl-hidden");
      });

      let match = document.querySelectorAll(`[data-team="${teamName}"]`);
      [].forEach.call(match, el => {
        el.classList.remove("kl-hidden");
      });
    },
    resetFilters() {
      [].forEach.call(this.appList, el => {
        el.classList.remove("kl-hidden");
      });
    },
  },
  mounted() {
    // console.log("currentCore", currentCore);
    // console.log("currentKobi", currentKobi);
    // console.log("lastUpdateDate", lastUpdateDate);
    // dashboardObject.forEach((element) => {
    //   console.log(JSON.stringify(element));
    // });
  },
};
</script>

<style lang="scss" scoped>
@import '../public/sass/common';
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
@import 'css/assets/sass/_common/05-atoms/tags.atoms';

h2 {
  margin-top: 1.5rem;
  margin-bottom: 0.5rem;
  font-size: 1.5rem;
  font-family: LeroyMerlin, sans-serif;
  font-weight: 300;
}

.version {
  box-shadow: none;
}

.up-to-date {
  background: #91c854;
}

.behind-patch {
  background: #f8cc1c;
}

.behind-minor {
  background: #fc961e;
}

.behind-major {
  background: #df382b;
}

.not-on-tag {
  background: #54c4de;
}

.db {
  &__current {
    &--item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: 1rem;
      padding: 1rem;
      border: 1px solid #999;
      border-radius: 3px;
    }
  }

  &__update-time {
    margin-top: 1rem;
  }

  &__legend {
    &--bullet {
      border-radius: 50%;
      height: 1.25rem;
      width: 1.25rem;
      display: inline-block;
      vertical-align: middle;
    }
  }

  &__app {
    &--filter {
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    &--input {
      font-style: italic;
    }

    &--content {
      grid-row-gap: 16px;
      margin-top: 1rem;
    }
  }
}
</style>