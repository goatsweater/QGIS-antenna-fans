# Creating antenna fans in QGIS 3

This is the process for creating antenna fans in QGIS 3 using geometry 
generators.

Note: This process is based on [this work](https://gis.stackexchange.com/questions/181706/showing-antenna-symbols-on-the-map-point-symbols-or-features-polygons#233514), 
which was originally created for QGIS 2.

Antenna fans are made of three different markers combined to form a point 
symbol with a direction arrow representing the azimuth and a "fan" representing 
the beam width for the antenna.

There are a lot of settings that can be adjusted on any given symbol. The 
values below represent changes from the defaults.

## Before you start

This symbology relies on having a point file with following fields with numeric 
values in degrees:

* azimuth
* beamwidth

Omnidirectional antennas should have a beamwidth value of 360.

It also relies on having two variables set (in layer units):

* antenna_fan_arrow_length
* antenna_fan_radius

In the example below these are set on the layer, but they can be set at the 
project level as well.

## Point symbol

Select a single symbol as the basic marker type.

The first symbol is a basic marker point. The size is 3mm, with a border 
width of 0.4mm. The fill colour is #e5b636.

## Azimuth arrow

The azimuth arrow uses a geometry generator to create a line symbolized as the 
built in arrow marker to represent directionality.

Add a second symbol under the point marker and set the symbol layer type to 
'geometry generator'.

Geometry type: `LineString / MultiLineString`

The code for the geometry calculation is:

```
make_line(
  $geometry,
  make_point(
    $x + @antenna_fan_arrow_length * cos(
      radians(90 - "azimuth" )
	),
	$y +  @antenna_fan_arrow_length * sin(
	  radians(90 - "azimuth" )
	)
  )
)
```

### Arrow symbology

The line is then styled as:

Symbol Layer Type: `arrow`
Arrow width: 1.4mm
Head length: 1.7mm
Head thickness: 1.7mm

Fill colour: #0000ff
Border colour: #232323

## Fan polygon

The polygon to represent the beam width is also based on a geometry generator, 
symbolized using a basic polygon fill symbol.

There is one caveat that needs to be dealt with when creating the fan. As the 
beam width could be more than 180 degrees, a condition is used to determine 
when it is drawing a basic polygon or the inverse (difference) of it.

Note: In order to create nice rounded fan edges a buffer is used to create a circle. 
If the `antenna_fan_arrow_length` is not greater than `antenna_fan_radius`, the 
symbol will likely not show up as a nice fan shape.

Add a third symbol under the arrow marker and set the symbol layer type to 
'geometry generator'.

Geometry type: `Polygon / MultiPolygon`

The code for the geometry calculation is:

```
CASE
WHEN ( "beamwidth" ) <= 180
THEN
intersection(
  buffer($geometry, @antenna_fan_radius ),
	make_polygon(
	  geom_from_wkt(
		geom_to_wkt(
		  make_line(
			$geometry,
			make_point(
			  $x + @antenna_fan_arrow_length  *cos(radians(90 - "azimuth" - "beamwidth" / 2 )), 
			  $y + @antenna_fan_arrow_length *sin(radians(90 - "azimuth" - "beamwidth" / 2 ))
			),
			make_point(
			  $x + @antenna_fan_arrow_length *cos(radians(90 - "azimuth" )), 
			  $y + @antenna_fan_arrow_length *sin(radians(90 - "azimuth" ))
			),
			make_point(
			  $x + @antenna_fan_arrow_length *cos(radians(90 - "azimuth" + "beamwidth" / 2 )),
			  $y + @antenna_fan_arrow_length *sin(radians(90 - "azimuth" + "beamwidth" / 2 ))
			),
			$geometry)
		  )
		)
	  )
	)

WHEN ( "beamwidth" ) > 180
THEN
difference(
  buffer($geometry, @antenna_fan_radius ),
  make_polygon(
  geom_from_wkt(
	geom_to_wkt(
	  make_line(
	    $geometry,
		make_point(
		  $x + @antenna_fan_arrow_length *cos(radians(90 - "azimuth" - "beamwidth" / 2 )),
          $y + @antenna_fan_arrow_length *sin(radians(90 - "azimuth" - "beamwidth" / 2 ))),
		make_point(
		  $x - @antenna_fan_arrow_length *cos(radians(90 - "azimuth" )), 
		  $y - @antenna_fan_arrow_length *sin(radians(90 - "azimuth" ))),
		make_point(
		  $x + @antenna_fan_arrow_length *cos(radians(90 - "azimuth" + "beamwidth" / 2 )),
          $y + @antenna_fan_arrow_length *sin(radians(90 - "azimuth" + "beamwidth" / 2 ))),
		$geometry)
	  )
	)
  )
)
END
```

### Polygon symbology

The polygon is styled as:

Stroke colour: #525252
Border colour: #000000
