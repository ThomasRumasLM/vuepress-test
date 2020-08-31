/* eslint-disable no-console */
const shell = require('shelljs');
const path = require('path');
const fs = require('fs');
const http = require('https');
const colors = require('colors/safe');

// ---------------- VARS --- /
const turbineEnv = 'cdp-due-website-frlm-uat1';
const generatorApiUrl = 'api.github.com/repos/adeo/';
const turbineToken = process.env.npm_config_turbinetoken || process.env.turbinetoken;
const token = process.env.npm_config_githubToken || process.env.githubToken;

if (!token || !turbineToken) {
  if (!token) {
    console.log('No environment variable found for <token>');
  }
  if (!turbineToken) {
    console.log('No environment variable found for <turbineToken>');
  }
  process.exit(0);
}

let socle = '';
const kobi = '2.1.1';
const dashboardData = new Map();

// ---------------- UTILS --- /
const getURL = (url, authorization, fn) => {
  const hostLimit = url.indexOf('/');
  const opt = {
    hostname: url.substring(0, hostLimit),
    path: url.substring(hostLimit),
    headers: {
      Authorization: `${authorization}`,
      'User-Agent': 'LMFR version monitoring'
    }
  };
  
  const req = http.request(opt, res => {
    let response = '';
    res.setEncoding('utf8');
    res.on('data', chunk => {
      response = response + chunk;
    });
    res.on('end', () => {
      fn(response);
    });
  });

  req.on('error', e => {
    console.error(`problem with request: ${e.message}`);
  });
  req.end();
};

const getGithubFile = (url, fn) => {
  getURL(url, `token ${token}`, response => {
    // console.log(`RESPONSE: ${response.substring(0, 300)}`);
    const res = JSON.parse(response);
    if (res.message === 'Not Found' || res.message === 'Moved Permanently') {
      fn();
      return false;
    }
    content = new Buffer.from(res.content, 'base64').toString('ascii');
    fn(content);
  });
};

const getPackage = (appName, callback) => {
  // console.time(` -- HTTP for ${appName} Package`);
  let repoName = appName;

  getURL(
    `turbine.prod.leroymerlin.fr/api/models/components/${appName}`,
    `Bearer ${turbineToken}`,
    response => {
      const turbineAppInfo = JSON.parse(response);
      if (
        turbineAppInfo.source &&
        turbineAppInfo.source.indexOf('github') > 0
      ) {
        repoName = turbineAppInfo.source.replace(/\.git/g, '');
        repoName = repoName.split('github.com/adeo/')[1];
      }
      const url = `${generatorApiUrl}${repoName}/contents/package.json`;
      getGithubFile(url, response => {
        // console.timeEnd(` -- HTTP for ${appName} Package`);
        callback(response);
      });
    }
  );
};

const getPom = (appName, callback) => {
  // console.time(` -- HTTP for ${appName} POM.xml`);
  let repoName = appName;

  getURL(
    `turbine.prod.leroymerlin.fr/api/models/components/${appName}`,
    `Bearer ${turbineToken}`,
    response => {
      const turbineAppInfo = JSON.parse(response);
      if (
        turbineAppInfo.source &&
        turbineAppInfo.source.indexOf('github') > 0
      ) {
        repoName = turbineAppInfo.source.replace(/\.git/g, '');
        repoName = repoName.split('github.com/adeo/')[1];
      }
      const url = `${generatorApiUrl}${repoName}/contents/pom.xml`;
      getGithubFile(url, response => {
        // console.timeEnd(` -- HTTP for ${appName} POM.xml`);
        callback(response);
      });
    }
  );
};

const isVersionFormat = v => /(\d{1,3})\.(\d{1,3})\.(\d{1,3})/.test(v);

const upToDateStatus = (appVersion, socle) => {
  const vSocle = socle.split('.');
  // let vApp = appVersion.replace(/([v])/g, "").split(".");
  const vApp = appVersion.split('.');
  // console.log("VAPP: ", vApp)

  let status = 'up-to-date';
  if (parseInt(vSocle[2]) > parseInt(vApp[2])) {
    status = 'behind-patch';
  } // Patch version
  if (parseInt(vSocle[1]) > parseInt(vApp[1])) {
    status = 'behind-minor';
  } // Minor version
  if (parseInt(vSocle[0]) > parseInt(vApp[0])) {
    status = 'behind-major';
  } // Minor version

  if (!isVersionFormat(appVersion)) {
    status = 'not-on-tag';
  }
  if (appVersion === 'unavailable') {
    status = 'not-on-tag';
  }

  return status;
};
// ---------------- PROCESSING FUNCTIONS --- /
const getLatestSocleVersion = (resolve, reject) => {
  const promise_socle = new Promise((resolve, reject) => {
    const repoUrl__socle = `${generatorApiUrl}integration-web-core--socle/contents/package.json`;
    getGithubFile(repoUrl__socle, response => {
      socle = JSON.parse(response).version;
      resolve();
    });
  });

  Promise.all([promise_socle]).then(() => {
    resolve(socle);
  });
};

const getAppList = () => {
  const getAppListCommand = `curl --location --request GET 'https://turbine.prod.leroymerlin.fr/api/models/environments/${turbineEnv}' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer ${turbineToken}' \
  --data-raw ''`;

  let appList = shell.exec(getAppListCommand, { silent: true }).stdout;

  appList = JSON.parse(appList).services;
  for (let i = appList.length - 1; i >= 0; i--) {
    const app = appList[i];
    if (!app.name.match(/(lmfr-)([a-zA-Z0-9-_]*)(-module)/)) {
      continue;
    }
    if (!dashboardData.has(app.name)) {
      dashboardData.set(app.name, {});
    }
  }
  return dashboardData;
};

const getAppDependencies = (resolve, reject) => {
  const appPromiseList = [];

  for (const [app, value] of dashboardData) {
    // console.log(`Récupération de la version du socle de l'appli ${app}`);
    const appDependencies = new Promise((resolve, reject) => {
      getPackage(app, packageJson => {
        try {
          packageJson = JSON.parse(packageJson);
          let coreVersionEntry = {};

          if(packageJson.devDependencies.hasOwnProperty('integration-web-core--socle') == true) {
            if (packageJson.devDependencies['integration-web-core--socle'].includes('^') == true) {
              coreVersionEntry = {
                coreVersion: packageJson.devDependencies['integration-web-core--socle'].split('^')[1]
              };
            } else if(packageJson.devDependencies['integration-web-core--socle'].includes('#v') == true) {
              coreVersionEntry = {
                coreVersion: packageJson.devDependencies['integration-web-core--socle'].split('#v')[1]
              };
            } else {
              coreVersionEntry = {
                coreVersion: packageJson.devDependencies['integration-web-core--socle']
              };
            }
          } else {
            coreVersionEntry = {
              coreVersion: 'unavailable'
            };
          }
          dashboardData.set(app, coreVersionEntry);
        } catch (error) {
          const coreVersionEntry = {
            coreVersion: 'unavailable'
          };
          dashboardData.set(app, coreVersionEntry);
          console.log(
            colors.red(
              `Impossible de récupérer la version du socle du module ${app}`
            )
          );
          resolve();
        }
        resolve();
      });
    });
    appPromiseList.push(appDependencies);
  }

  Promise.all(appPromiseList).then(() => {
    resolve(dashboardData);
  });
};

const getKobiVersion = (resolve, reject) => {
  const kobiVersionPromiseList = [];
  for (const [app, value] of dashboardData) {
    let kobiVersionEntry = {};
    // console.log(`Récupération de la version du pom.xml de l'appli ${app}`);
    const kobiVersions = new Promise((resolve, reject) => {
      getPom(app, pom => {
        try {
          const kobiVersion = pom.substring(
            pom.lastIndexOf('<kobi.version>') + 14,
            pom.lastIndexOf('</kobi.version>')
          );
          // console.log(`\n kobi version => ${app}`, colors.yellow(kobiVersion));

          if (/^(\*|\d+(\.\d+){0,2}(\.\*)?)$/.test(kobiVersion)) {
            kobiVersionEntry = {
              kobiVersion: kobiVersion
            };
          } else {
            kobiVersionEntry = {
              kobiVersion: 'unavailable'
            };
          }
          dashboardData.set(app, Object.assign(kobiVersionEntry, value));
        } catch (error) {
          kobiVersionEntry = {
            kobiVersion: 'unavailable'
          };
          dashboardData.set(app, Object.assign(kobiVersionEntry, value));
          console.log(
            colors.red(`Impossible de récupérer le pom.xml du module ${app}`)
          );
          resolve();
        }
        resolve();
      });
    });
    kobiVersionPromiseList.push(kobiVersions);
  }

  Promise.all(kobiVersionPromiseList).then(() => {
    resolve(dashboardData);
  });
};

const getCompTeam = () => {
  for (const [app, value] of dashboardData) {
    const getAppListCommand = `curl -X GET -H "Authorization: Bearer ${turbineToken}" "https://turbine.prod.leroymerlin.fr/api/models/components/${app}" -H "accept: application/json"`;

    const appTeam = shell.exec(getAppListCommand, { silent: true }).stdout;
    const teamEntry = {
      team: JSON.parse(appTeam).support
    };
    dashboardData.set(app, Object.assign(teamEntry, value));
  }
  return dashboardData;
};

const checkAppFreshness = (socle, kobi) => {
  let statusCore = '';
  let statusKobi = '';

  for (const [app, value] of dashboardData) {
    if (value.coreVersion) {
      statusCore = upToDateStatus(value.coreVersion, socle);
      // console.log("STATUS CORE: ", statusCore)
    }
    if (value.kobiVersion) {
      statusKobi = upToDateStatus(value.kobiVersion, kobi);
      // console.log("STATUS KOBI: ", statusKobi)
    }
    const freshnessEntry = {
      statusCore: statusCore,
      statusKobi: statusKobi
    };
    dashboardData.set(app, Object.assign(freshnessEntry, value));
  }
  return dashboardData;
};

// ---------------- LET'S GO --- /
new Promise(function(resolve, reject) {
  console.log(colors.bgCyan.gray('START BUILDING DATA MAP'));
  getLatestSocleVersion(resolve, reject);
})
  .catch(error => {
    console.log(error);
    process.exit(1);
  })
  .then(socle => {
    console.log(colors.bgCyan.gray('\n DERNIERE VERSION DU SOCLE \n'));
    console.log(socle);
    return getAppList();
  })
  .then(dashboardData => {
    console.log(colors.bgCyan.gray('\n APPLICATION LIST \n'));
    // console.log(dashboardData);
    return new Promise((resolve, reject) => {
      getAppDependencies(resolve, reject);
    });
  })
  .then(dashboardData => {
    console.log(colors.bgCyan.gray('\n VERSIONS DU SOCLE PAR APPLICATION \n'));
    console.log(dashboardData);
    return new Promise((resolve, reject) => {
      getKobiVersion(resolve, reject);
    });
  })
  .then(dashboardData => {
    console.log(
      colors.bgCyan.gray('\n VERSIONS DU KOBI STARTER PAR APPLICATION \n')
    );
    // console.log(dashboardData);
    return getCompTeam();
  })
  .then(dashboardData => {
    console.log(colors.bgCyan.gray('\n TEAM PAR APPLICATION \n'));
    // console.log(dashboardData);
    return checkAppFreshness(socle, kobi);
  })
  .then(dashboardData => {
    console.log(colors.bgCyan.gray('\n STATUT DU SOCLE PAR APPLICATION \n'));
    // console.log(dashboardData);
    const dashboard = new Map([...dashboardData.entries()].sort());
    const dashboardJsonString = JSON.stringify(Array.from(dashboard.entries())).replace(/"/g, '\'');
    // console.log("/// JSONTEXT", dashboardJsonString);
    const now = new Date();
    const tab_mois = new Array('Janvier','Février','Mars','Avril','Mai','Juin','Juillet','Août','Septembre','Octobre','Novembre','Décembre');
    const lastUpdateDate = `${now.getDate()} ${tab_mois[now.getMonth()]} ${now.getFullYear()}, ${now.getHours()}h${now.getMinutes()}`;
    const dashboardObject = `
module.exports = {
  'dashboardObject': ${dashboardJsonString},
  'currentCore': '${socle}',
  'currentKobi': '${kobi}',
  'lastUpdateDate': '${lastUpdateDate}',
};`;
    fs.writeFileSync(
      'documentation/pages/Dashboard/dependenciesdashboard.js',
      dashboardObject
    );
    return;
  })
  .then(() => {
    process.exit(0);
  });
