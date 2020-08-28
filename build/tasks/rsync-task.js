#! /usr/bin/env node
const rsync         = require("rsyncwrapper");
const path          = require('path');
const fs            = require('fs-extra');
const colors        = require('colors/safe');
const mkdirp        = require('mkdirp');
const currentDir    = process.cwd();

const processTask = (task, callback) => {

    if(callback == null) {
        callback = function() {};
    }

    if (task != null && task.filePath != null) {
      //console.log("rsyncTask : " + task.filePath + " action : " + task.action);
      // Détermine le fichier ou répertoire de destination dans dist.
        var dest = path.join(currentDir, "target/classes/") + task.filePath.replace(currentDir, '').replace('./src/main/resources/', '');
        if (task.action == 'unlinkDir') {
          // Suppression de répertoire.
            fs.removeSync(dest);
            console.log(colors.green("Deletion of directory " + dest.replace(currentDir, '') + " succeed"));
        } else if (task.action == 'unlink') {
          // Suppression de fichier.
            fs.removeSync(dest);
            console.log(colors.green("Deletion of file " + dest.replace(currentDir, '') + " succeed"));
        } else if (task.action == 'addDir') {
            // Création répertoire.
            mkdirp.sync(dest);
        } else {
          // Création / modification de fichier.
            fs.copySync(task.filePath, dest);
            console.log(colors.green("Copy of " + task.filePath.replace(currentDir, '') + " to " + dest.replace(currentDir, '') + " succeed"));
        }
        //console.log(task.filePath);
        callback();
    } else {

        console.log(colors.cyan("\n\nSTART : Synchronization to dist directory"))
        console.time('rsyncTask');

        // Pas de fichier en entrée, rsync global.
        config = {
            src: ["./src/main/resources/*"],
            dest: "./target/classes/",
            recursive: true,
            deleteAll: true,
            dryRun: false,
            exclude: ["sass", "javascript", "node_modules", "package.json", "*.orig"]
        };

        rsync(config, (err, stdout, stderr, cmd) => {

            console.log("commande : " + cmd);
            if (err) {
                // failed
                console.log(stdout);
                console.log(stderr);
                console.log(colors.red("Synchronization to dist failed : " + err.message));
            } else {
                console.log(colors.cyan("FINISH : Synchronization to dist ") + colors.green("succeed"));
            }

            console.timeEnd('rsyncTask');
            callback(err);
        });
    }
}

module.exports.processTask = processTask;

//rsyncTask();
