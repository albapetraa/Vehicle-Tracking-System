<%-- Document : anlik Created on : 8 Mar 2022, 13:07:45 Author : Emree --%>


    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Yazılım Laboratuvarı-2 1.Proje</title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <link rel="stylesheet"
                    href="https://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css">
                <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
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
                            <h4>Son 30dk içerisinde bulunan konumlar aşağıda gösterilmektedir.</h4>
                            <h1>Zaman: ${mevcutGun} ${mevcutSaat} </h1>


                            <div id="map"></div>

                        </div>
                    </div>
                    <!-- /#page-content-wrapper -->

                </div>


                <script>




                    var event_click = [];
                    var anlikKonumlar1 = [];
                    var anlikKonumlar2 = [];
                    var carId = [];

                <c:forEach items="${carIds}" var="vehicle">
                carId.push(<c:out value="${vehicle}" />);
                </c:forEach>

                <c:if test="${not empty carLastThirty}">

                    <c:forEach items="${carLastThirty}" var="car">
                var arr = [];
                arr.push("<c:out value="${car.carDate}" />");
                arr.push("<c:out value="${car.carTime}" />");
                arr.push("<c:out value="${car.carLat}" />");
                arr.push("<c:out value="${car.carLng}" />");
                arr.push("<c:out value="${car.carId}" />");
                var currentCarId = Number(arr[4]);
                if (carId[0] == currentCarId) {
                    anlikKonumlar1.push(arr);
                } else if (carId[1] == currentCarId) {
                    anlikKonumlar2.push(arr);
                }

                    </c:forEach>
                </c:if>
                    var map;
                    var latx;
                    var laty;
                    if (anlikKonumlar1.length != 0) {
                        latx = Number(anlikKonumlar1[0][2])
                        laty = Number(anlikKonumlar1[0][3])
                    }

                    if (anlikKonumlar2.length != 0) {
                        latx = Number(anlikKonumlar2[0][2]);
                        laty = Number(anlikKonumlar2[0][3]);
                    }
                    function initMap() {
                        map = new google.maps.Map(document.getElementById("map"), {
                            center: { lat: latx, lng: laty },
                            zoom: 12,
                        });
                        if (anlikKonumlar1.length != 0) {
                            addMarkers(anlikKonumlar1);
                        }

                        if (anlikKonumlar2.length != 0) {
                            addMarkers(anlikKonumlar2);
                        }
                        function addMarkers(konumlar) {
                            for (let i = 0; i < konumlar.length; i++) {

                                var lat = Number(konumlar[i][2]);
                                var lng = Number(konumlar[i][3]);
                                var latlng = new google.maps.LatLng(lat, lng);
                                if (i == konumlar.length - 1) {
                                    endMarker(latlng, konumlar[i][4], konumlar[i][1]);
                                } else if (i == 0) {
                                    startMarker(latlng, konumlar[i][4], konumlar[i][1]);
                                } else {
                                    createMarker(latlng, konumlar[i][4], konumlar[i][1]);
                                }


                            }
                        }
                        function createMarker(latlng, vehicle, time) {

                            var marker = new google.maps.Marker({
                                position: latlng,
                                map: map,
                                icon: "grn-circle.png"

                            });
                            var contentString = "Araba Numarası " + vehicle + " Saat: " + time;
                            var infowindow = new google.maps.InfoWindow({
                                content: "" + contentString
                            });
                            marker.addListener('click', function (e) {
                                infowindow.open(map, marker);

                            });
                        }
                        function startMarker(latlng, vehicle, time) {

                            var marker = new google.maps.Marker({
                                position: latlng,
                                map: map,
                                icon: "go.png"
                            });
                            var contentString = "Araba Numarası " + vehicle + " Saat: " + time;
                            var infowindow = new google.maps.InfoWindow({
                                content: "" + contentString
                            });
                            marker.addListener('click', function (e) {
                                infowindow.open(map, marker);

                            });
                        }
                        function endMarker(latlng, vehicle, time) {

                            var marker = new google.maps.Marker({
                                position: latlng,
                                map: map,
                                icon: "grn-square.png"
                            });
                            var contentString = "Araba Numarası " + vehicle + " Saat: " + time;
                            var infowindow = new google.maps.InfoWindow({
                                content: "" + contentString
                            });
                            marker.addListener('click', function (e) {
                                infowindow.open(map, marker);

                            });
                        }

                    }

                </script>
                <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

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

                <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>



            </body>

            </html>