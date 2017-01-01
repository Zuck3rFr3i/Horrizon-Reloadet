--[[
	Author: Zuck3rFr3i
]]
GUIEditor = {
    tab = {},
    button = {},
    edit = {},
    label = {}
}
gui_loginmainframe = guiCreateWindow(0.06, 0.03, 0.33, 0.30, "Horrizon Reallife", true)
guiWindowSetMovable(gui_loginmainframe, false)
guiWindowSetSizable(gui_loginmainframe, false)
guiSetAlpha(gui_loginmainframe, 0.93)
guiSetProperty(gui_loginmainframe, "CaptionColour", "FEF2A80A")

GUIEditor.label[1] = guiCreateLabel(0.02, 0.10, 0.90, 0.06, "Username:", true, gui_loginmainframe)
guiSetFont(GUIEditor.label[1], "default-bold-small")
guiLabelSetColor(GUIEditor.label[1], 242, 168, 10)
guiLabelSetVerticalAlign(GUIEditor.label[1], "center")
GUIEditor.label[2] = guiCreateLabel(0.08, 0.21, 0.90, 0.06, "usertxt", true, gui_loginmainframe)
guiSetFont(GUIEditor.label[2], "default-bold-small")
guiLabelSetColor(GUIEditor.label[2], 67, 248, 3)
guiLabelSetVerticalAlign(GUIEditor.label[2], "center")
GUIEditor.label[3] = guiCreateLabel(0.02, 0.38, 0.90, 0.06, "Passwort:", true, gui_loginmainframe)
guiSetFont(GUIEditor.label[3], "default-bold-small")
guiLabelSetColor(GUIEditor.label[3], 242, 168, 10)
guiLabelSetVerticalAlign(GUIEditor.label[3], "center")
GUIEditor.edit[1] = guiCreateEdit(0.08, 0.49, 0.36, 0.13, "passwort", true, gui_loginmainframe)
guiEditSetMasked(GUIEditor.edit[1], true)
GUIEditor.button[1] = guiCreateButton(0.02, 0.82, 0.37, 0.14, "Einloggen", true, gui_loginmainframe)
guiSetFont(GUIEditor.button[1], "default-bold-small")
GUIEditor.button[2] = guiCreateButton(0.61, 0.82, 0.37, 0.14, "Disconnect", true, gui_loginmainframe)
guiSetFont(GUIEditor.button[2], "default-bold-small")


gui_updatemainframe = guiCreateWindow(0.48, 0.03, 0.50, 0.90, "Horrizon Updates", true)
guiWindowSetMovable(gui_updatemainframe, false)
guiWindowSetSizable(gui_updatemainframe, false)
guiSetAlpha(gui_updatemainframe, 0.93)
guiSetProperty(gui_updatemainframe, "CaptionColour", "FEF2A80A")


gui_tabpanel = guiCreateTabPanel(0.48, 0.05, 0.49, 0.86, true)
guiSetAlpha(gui_tabpanel, 0.88)

tabpanel_tab1 = guiCreateTab("Updates", gui_tabpanel)
GUIEditor.tab[1] = guiCreateTab("Bugfixes", gui_tabpanel)
GUIEditor.tab[2] = guiCreateTab("Changes", gui_tabpanel)
GUIEditor.tab[3] = guiCreateTab("News", gui_tabpanel)
GUIEditor.tab[4] = guiCreateTab("Team", gui_tabpanel)
GUIEditor.tab[5] = guiCreateTab("Server-Daten", gui_tabpanel)
GUIEditor.tab[6] = guiCreateTab("Server-Regeln", gui_tabpanel)
