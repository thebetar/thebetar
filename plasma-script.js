// Clear all existing panels
panels().forEach(p => p.remove());

const allDesktops = desktops();

// Build panels for a given screen
function setupDesktop(desktop) {
    // --- Wallpaper ---
    desktop.wallpaperPlugin = "org.kde.image";
    desktop.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    desktop.writeConfig("Image", "/home/larsvonk/Pictures/wallpaper.jpg");

    // --- Top bar ---
    const screen = desktop.screen;

    print("Screen: " + screen + "\n");

    const topBar = new Panel();
    topBar.writeConfig("screen", screen);
    topBar.writeConfig("lastScreen", screen);
    topBar.location = "top";
    topBar.height = 36;
    topBar.offset = 0;

    const topBarWidth = screenGeometry(screen).width - 56;
    topBar.alignment = "right";
    topBar.minimumLength = topBarWidth;
    topBar.maximumLength = topBarWidth;

    topBar.addWidget("org.kde.plasma.panelspacer");

    const clock = topBar.addWidget("org.kde.plasma.digitalclock");
    clock.currentConfigGroup = ["Appearance"];
    clock.writeConfig("use24hFormat", 2);

    topBar.addWidget("org.kde.plasma.panelspacer");
    topBar.addWidget("org.kde.plasma.systemtray");

    // --- Side bar ---
    const sideBar = new Panel();
    sideBar.writeConfig("screen", screen);
    sideBar.location = "left";
    sideBar.height = 56;
    sideBar.offset = 0;

    const iconTasks = sideBar.addWidget("org.kde.plasma.icontasks");
    iconTasks.currentConfigGroup = ["General"];
    iconTasks.writeConfig("launchers", [
        "applications:code.desktop",
        "preferred://browser",
        "preferred://filemanager",
        "applications:dbeaver-ce.desktop",
        "applications:spotify_spotify.desktop",
        "applications:thunderbird_thunderbird.desktop",
        "applications:org.gnome.Boxes.desktop",
        "applications:systemsettings.desktop"
    ]);

    sideBar.addWidget("org.kde.plasma.systemmonitor.cpu");
    sideBar.addWidget("org.kde.plasma.systemmonitor.memory");
    sideBar.addWidget("org.kde.plasma.kickoff");
}

// Apply to every connected screen using screens() for reliable screen IDs
allDesktops.forEach(setupDesktop)
