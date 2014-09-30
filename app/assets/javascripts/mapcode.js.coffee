# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  ondragend = ->
    m = marker.getLatLng()
    coordinates.innerHTML = "Latitude: " + m.lat + "<br />Longitude: " + m.lng
    return
  map = L.mapbox.map("map").setView([13.755725964737207,100.49674987792969], 11)
  L.mapbox.tileLayer("itbakerydev.j20f7al9").addTo(map)
  coordinates = document.getElementById("coordinates")
  marker = L.marker([13.755725964737207,100.49674987792969],
        icon: L.mapbox.marker.icon("marker-color": "#f86767")
        draggable: true
        ).addTo(map)
  marker.on "dragend", ondragend
  ondragend()


  L.control.layers(
    "รวมสายทางโครงการรถไฟฟ้า": L.mapbox.featureLayer("itbakerydev.j20f7al9").addTo(map)
    "สายสีส้ม ช่วงตลิ่งชัน-มีนบุรี": L.mapbox.featureLayer("itbakerydev.j455eid3")
    "สายสีเขียว ช่วงหมอชิต-สะพานใหม่-คูคต": L.mapbox.featureLayer("itbakerydev.j38mpdg2")
    "สายสีชมพู": L.mapbox.featureLayer("itbakerydev.ij92cj0p")
    "สายเฉลิมรัชมงคล": L.mapbox.featureLayer("itbakerydev.i8ib0jmi")
    "สายสีเขียว ช่วงแบริ่ง-สมุทรปราการ": L.mapbox.featureLayer("itbakerydev.ifo4lpcd")
    "สายสีเหลือง ช่วงลาดพร้าว-สำโรง": L.mapbox.featureLayer("itbakerydev.ie62580n")
    "สายสีม่วง ช่วงบางใหญ่-ราษฏร์บูรณะ": L.mapbox.featureLayer("itbakerydev.ic27e4i9")
    "สายสีน้ำเงิน ช่วงหัวลำโพง-บางแค และช่วงบางซื่อ-ท่าพระ": L.mapbox.featureLayer("itbakerydev.ic00jmg3")
    ).addTo map
