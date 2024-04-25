/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db);

  const settings = dao.findSettings();

  settings.meta.appName = $os.getenv('APP_NAME') ?? 'K&MORE DASHBOARD';
  settings.meta.appUrl = $os.getenv('APP_URL') ?? 'localhost:8080';
  settings.meta.hideControls = true;

  dao.saveSettings(settings);
}, (db) => {
  // add down queries...
})
