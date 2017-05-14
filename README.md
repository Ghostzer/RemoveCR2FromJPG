# RemoveCR2FromJPG
Batch application for remove your CR2 files if your JPG doesn't exist

If you take photos RAW + JPG like me, maybe you want sort your photos automatically ?
You copie your photos in a folder, you deleting JPG and CR2 are still there, OK for 4 photos, but what for 500 photos ?
it's annoying...

This script have 2 menus :
"Simple sort"
"Advanced sort"

## Simple sort

Allows remove all CR2 orphan from deleted JPG. 

## Advanced sort

Like "Simple sort" allows remove all CR2 orphan from deleted JPG. After this, enter a path name when you want to copie your
photos with `pathdest\pathname` like `K:\photos\pathname`.

All JPG photos will be copied in `K:\photos\pathname`, and all CR2 photos `K:\photos\pathname\RAW`.

# Configure
Set your base folder, ex `K:\photos`

Line 3 : `set pathdest=K:\photos`

# How to
Copie this script into your directory when you have your JPG/CR2 and launch it.
