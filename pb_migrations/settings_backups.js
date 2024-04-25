/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
    const dao = new Dao(db);

    const settings = dao.findSettings();

    settings.backups.cron = "0 0 * * *";
    settings.backups.keep = 3;
    settings.backups.s3.accessKey = $os.getenv('S3_ACCESS_KEY');
    settings.backups.s3.secret = $os.getenv('S3_SECRET');

    dao.saveSettings(settings);
}, (db) => {
    // add down queries...
})
