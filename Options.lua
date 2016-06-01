local name, ns = ...

Stuff = {};
 Stuff.panel = CreateFrame( "Frame", "StuffPanel", UIParent );
 -- Register in the Interface Addon Options GUI
 -- Set the name for the Category for the Options Panel
 Stuff.panel.name = "Stuff";
 -- Add the panel to the Interface Options
 InterfaceOptions_AddCategory(Stuff.panel);
 
 -- Make a child panel
 Stuff.childpanel = CreateFrame( "Frame", "StuffChild", Stuff.panel);
 Stuff.childpanel.name = "MyChild";
 -- Specify childness of this panel (this puts it under the little red [+], instead of giving it a normal AddOn category)
 Stuff.childpanel.parent = Stuff.panel.name;
 -- Add the child to the Interface Options
 InterfaceOptions_AddCategory(Stuff.childpanel)