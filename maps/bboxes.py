l = iface.activeLayer()
iter = l.getFeatures()
geoms = []
for feature in iter:
    geom = feature.geometry()
    if not(geom.isMultipart()):
        l.boundingBox(feature.id())
        geoms.append(geom)
 