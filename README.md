Horrizon - Selfmade
===================

Hy leute, Zuck3rFr3i hier und diesesmal mit einem Git-
Repository, Ich habe im Forum zwar geschrieben das ich
Horrizon abgebe, habe aber nicht aufgehört dran zu arbeiten.

Jetzt gebe ich euch einen ersten einblick in das Script.

###ACHTUNG:
ich habe Horrizon nie komplett aufgegeben!
Horrizon wurde trotzdem weiterentwickelt.

------------------------------------------------------------
###Dev-blog

```
Update: Version 0.0.01
*Restructured the complete filesystem.
*Addet Server / Client settings file. (Ingame editing will be Possible)
*Addet Selfcontructing Mysql querys. (NO SQL files needet.)

```

------------------------------------------------------------

Solltet ihr das Script selbst weiterentwickeln wollen oder solltet
ihr es nutzen wollen um zu lernen hier einige Wichtige Resourcen
die ihr braucht um LUA zu lernen:

Alles über MTA [MTA Wiki](https://wiki.multitheftauto.com/wiki/Main_Page).

Alles über Mysql [Mysql Wiki](http://dev.mysql.com/doc/refman/5.7/en/sql-syntax-data-manipulation.html).

Alles über Objecte [Object ID,s](http://dev.prineside.com/en/gtasa_samp_model_id/).

###Interessante Links MTA

Die Meta.xml [MTA Meta](https://wiki.multitheftauto.com/wiki/Meta.xml).

MTA Elemente [Elemente](https://wiki.multitheftauto.com/wiki/Element).

Erklärung zu MTA Elementen [Element Tree](https://wiki.multitheftauto.com/wiki/Element_tree).

```lua
function init_Horrizon_Alpha()
    if not init_Horrizon_Alpha then
        print("Go Horrizon!")
    end
end
```
