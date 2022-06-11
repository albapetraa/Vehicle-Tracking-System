<%-- 
    Document   : anlik
    Created on : 8 Mar 2022, 13:07:45
    Author     : Emree
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="60">
    <title>Yazılım Laboratuvarı-2 1.Proje</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css">

            <link rel="stylesheet" type="text/css" href="css/dashboard.css"/>
            <link rel="stylesheet" type="text/css" href="css/mapstyle.css" />

            </head>
            <body>

            <div id="wrapper" class="toggled">

                <!-- Sidebar -->
                <div id="sidebar-wrapper">
                    <ul class="sidebar-nav">
                        <li class="sidebar-brand">
                            <a href="/">
                                YazLab Proje
                            </a>
                        </li>
                        <li>
                            <a href="/welcome">Ana Sayfa</a>
                        </li>
                        <li>
                            <a href="/anlik">Anlık Konum Bilgileri</a>
                        </li>
                        <li>
                            <a href="/sonkonumlar">Son Konumlar</a>
                        </li>
                        <li>
                            <a href="/gecmiskonum">Geçmiş Konum Sorgulama</a>
                        </li>
                        <li>
                            <a href="/logout">Çıkış Yap</a>
                        </li>


                    </ul>
                </div>
                <!-- /#sidebar-wrapper -->

                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <h1>Yazılım Laboratuvarı-2 Proje 1</h1>
                        <h4>Araçlarınızın anlık konum bilgileri aşağıda gösterilmektedir.</h4>
                        <h1>Zaman: ${mevcutGun} ${mevcutSaat} </h1>

                        <div id="map"></div>

                    </div>
                </div>
                <!-- /#page-content-wrapper -->

            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                    integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                    integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
            crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

            <script>
                var event_click = [];
                var anlikKonumlar = [];
                <c:if test="${not empty carCurrent}">

                    <c:forEach items="${carCurrent}" var="car">

                var arr = [];
                arr.push("<c:out value="${car.carDate}" />");
                arr.push("<c:out value="${car.carTime}" />");
                arr.push("<c:out value="${car.carLat}" />");
                arr.push("<c:out value="${car.carLng}" />");
                arr.push("<c:out value="${car.carId}" />");
                anlikKonumlar.push(arr);
                    </c:forEach>
                </c:if>

                var map;
                var latx = Number(anlikKonumlar[0][2])
                var laty = Number(anlikKonumlar[0][3])
                function initMap() {
                    map = new google.maps.Map(document.getElementById("map"), {
                        center: {lat: latx, lng: laty},
                        zoom: 12,
                    });
                    map.addListener('click', function (e) {
                        event_click.push(e);
                    });

                    for (x of anlikKonumlar) {
                        var tempLat = Number(x[2]);
                        var tempLng = Number(x[3]);
                        var mLatLng = new google.maps.LatLng(tempLat, tempLng);
                        createMarker(mLatLng, x[4], x[1]);
                    }
                }
                function createMarker(latlng, arabaId, time) {
                    let mark = new google.maps.Marker({
                        position: latlng,
                        map: map,
                        label: {
                            text: arabaId,
                            color: 'red',
                            fontSize: "25px",
                            fontWeight: "900"
                        },
                        icon: "track-0.png"
                    });
                    var contentString = "Araba Numarası " + arabaId + " Saat: " + time;
                    var infowindow = new google.maps.InfoWindow({
                        content: "" + contentString
                    });
                    mark.addListener('click', function (e) {
                        infowindow.open(map, mark);

                    });
                }


            </script>
            <script
                src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap"
                async
            ></script>

            </body>

            </html>