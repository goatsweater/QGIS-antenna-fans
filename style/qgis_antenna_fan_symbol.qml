<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.16.0-Hannover" styleCategories="Symbology">
  <renderer-v2 enableorderby="0" forceraster="0" type="singleSymbol" symbollevels="0">
    <symbols>
      <symbol name="0" alpha="1" type="marker" clip_to_extent="1" force_rhr="0">
        <layer class="GeometryGenerator" locked="0" pass="0" enabled="1">
          <prop k="SymbolType" v="Fill"/>
          <prop k="geometryModifier" v="CASE&#xa;WHEN ( &quot;beamwidth&quot; ) &lt;= 180&#xa;THEN&#xa;intersection(&#xa;  buffer($geometry, @antenna_fan_radius ),&#xa;&#x9;make_polygon(&#xa;&#x9;  geom_from_wkt(&#xa;&#x9;&#x9;geom_to_wkt(&#xa;&#x9;&#x9;  make_line(&#xa;&#x9;&#x9;&#x9;$geometry,&#xa;&#x9;&#x9;&#x9;make_point(&#xa;&#x9;&#x9;&#x9;  $x + @antenna_fan_arrow_length  *cos(radians(90 - &quot;azimuth&quot; - &quot;beamwidth&quot; / 2 )), &#xa;&#x9;&#x9;&#x9;  $y + @antenna_fan_arrow_length *sin(radians(90 - &quot;azimuth&quot; - &quot;beamwidth&quot; / 2 ))&#xa;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;make_point(&#xa;&#x9;&#x9;&#x9;  $x + @antenna_fan_arrow_length *cos(radians(90 - &quot;azimuth&quot; )), &#xa;&#x9;&#x9;&#x9;  $y + @antenna_fan_arrow_length *sin(radians(90 - &quot;azimuth&quot; ))&#xa;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;make_point(&#xa;&#x9;&#x9;&#x9;  $x + @antenna_fan_arrow_length *cos(radians(90 - &quot;azimuth&quot; + &quot;beamwidth&quot; / 2 )),&#xa;&#x9;&#x9;&#x9;  $y + @antenna_fan_arrow_length *sin(radians(90 - &quot;azimuth&quot; + &quot;beamwidth&quot; / 2 ))&#xa;&#x9;&#x9;&#x9;),&#xa;&#x9;&#x9;&#x9;$geometry)&#xa;&#x9;&#x9;  )&#xa;&#x9;&#x9;)&#xa;&#x9;  )&#xa;&#x9;)&#xa;&#xa;WHEN ( &quot;beamwidth&quot; ) > 180&#xa;THEN&#xa;difference(&#xa;  buffer($geometry, @antenna_fan_radius ),&#xa;  make_polygon(&#xa;  geom_from_wkt(&#xa;&#x9;geom_to_wkt(&#xa;&#x9;  make_line(&#xa;&#x9;    $geometry,&#xa;&#x9;&#x9;make_point(&#xa;&#x9;&#x9;  $x + @antenna_fan_arrow_length *cos(radians(90 - &quot;azimuth&quot; - &quot;beamwidth&quot; / 2 )),&#xa;          $y + @antenna_fan_arrow_length *sin(radians(90 - &quot;azimuth&quot; - &quot;beamwidth&quot; / 2 ))),&#xa;&#x9;&#x9;make_point(&#xa;&#x9;&#x9;  $x - @antenna_fan_arrow_length *cos(radians(90 - &quot;azimuth&quot; )), &#xa;&#x9;&#x9;  $y - @antenna_fan_arrow_length *sin(radians(90 - &quot;azimuth&quot; ))),&#xa;&#x9;&#x9;make_point(&#xa;&#x9;&#x9;  $x + @antenna_fan_arrow_length *cos(radians(90 - &quot;azimuth&quot; + &quot;beamwidth&quot; / 2 )),&#xa;          $y + @antenna_fan_arrow_length *sin(radians(90 - &quot;azimuth&quot; + &quot;beamwidth&quot; / 2 ))),&#xa;&#x9;&#x9;$geometry)&#xa;&#x9;  )&#xa;&#x9;)&#xa;  )&#xa;)&#xa;END"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol name="@0@0" alpha="1" type="fill" clip_to_extent="1" force_rhr="0">
            <layer class="SimpleFill" locked="0" pass="0" enabled="1">
              <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="color" v="82,82,82,255"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="offset" v="0,0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="outline_color" v="0,0,0,255"/>
              <prop k="outline_style" v="solid"/>
              <prop k="outline_width" v="0.26"/>
              <prop k="outline_width_unit" v="MM"/>
              <prop k="style" v="solid"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" type="QString" value=""/>
                  <Option name="properties"/>
                  <Option name="type" type="QString" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer class="GeometryGenerator" locked="0" pass="0" enabled="1">
          <prop k="SymbolType" v="Line"/>
          <prop k="geometryModifier" v="make_line(&#xa;  $geometry,&#xa;  make_point(&#xa;    $x + @antenna_fan_arrow_length * cos(&#xa;      radians(90 - &quot;azimuth&quot; )&#xa;&#x9;),&#xa;&#x9;$y +  @antenna_fan_arrow_length * sin(&#xa;&#x9;  radians(90 - &quot;azimuth&quot; )&#xa;&#x9;)&#xa;  )&#xa;)"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol name="@0@1" alpha="1" type="line" clip_to_extent="1" force_rhr="0">
            <layer class="ArrowLine" locked="0" pass="0" enabled="1">
              <prop k="arrow_start_width" v="1"/>
              <prop k="arrow_start_width_unit" v="MM"/>
              <prop k="arrow_start_width_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="arrow_type" v="0"/>
              <prop k="arrow_width" v="1.4"/>
              <prop k="arrow_width_unit" v="MM"/>
              <prop k="arrow_width_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="head_length" v="1.7"/>
              <prop k="head_length_unit" v="MM"/>
              <prop k="head_length_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="head_thickness" v="1.7"/>
              <prop k="head_thickness_unit" v="MM"/>
              <prop k="head_thickness_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="head_type" v="0"/>
              <prop k="is_curved" v="1"/>
              <prop k="is_repeated" v="1"/>
              <prop k="offset" v="0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="offset_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="ring_filter" v="0"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" type="QString" value=""/>
                  <Option name="properties"/>
                  <Option name="type" type="QString" value="collection"/>
                </Option>
              </data_defined_properties>
              <symbol name="@@0@1@0" alpha="1" type="fill" clip_to_extent="1" force_rhr="0">
                <layer class="SimpleFill" locked="0" pass="0" enabled="1">
                  <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="color" v="0,0,255,255"/>
                  <prop k="joinstyle" v="bevel"/>
                  <prop k="offset" v="0,0"/>
                  <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="offset_unit" v="MM"/>
                  <prop k="outline_color" v="35,35,35,255"/>
                  <prop k="outline_style" v="solid"/>
                  <prop k="outline_width" v="0.26"/>
                  <prop k="outline_width_unit" v="MM"/>
                  <prop k="style" v="solid"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" type="QString" value=""/>
                      <Option name="properties" type="Map">
                        <Option name="fillColor" type="Map">
                          <Option name="active" type="bool" value="false"/>
                          <Option name="expression" type="QString" value=""/>
                          <Option name="type" type="int" value="3"/>
                        </Option>
                      </Option>
                      <Option name="type" type="QString" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </layer>
        <layer class="SimpleMarker" locked="0" pass="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="229,182,54,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="3"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerGeometryType>0</layerGeometryType>
</qgis>
