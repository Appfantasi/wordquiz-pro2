const { app, BrowserWindow, Menu, session } = require("electron");
const path = require("path");
function createWindow() {
  const win = new BrowserWindow({
    width: 980, height: 800, minWidth: 380, minHeight: 560,
    title: "WordQuiz Pro", autoHideMenuBar: true,
    webPreferences: { contextIsolation: true }
  });
  Menu.setApplicationMenu(null);
  win.loadFile(path.join(__dirname, "www", "index.html"));
}
app.whenReady().then(() => {
  session.defaultSession.setPermissionRequestHandler((wc, perm, cb) => cb(perm === "media"));
  createWindow();
});
app.on("window-all-closed", () => app.quit());
