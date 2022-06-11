<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>`
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://bootswatch.com/5/sandstone/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/514ed7772a.js" crossorigin="anonymous"></script>
        <title>Yazılım Laboratuvarı-2 1.Proje</title>
    </head>
    <body>
    <div class="row mt-5">
        <div class="col-md-6 m-auto">
            <div class="card card-body">
                <h1 class="text-center mb-3"><i class="fas fa-sign-in-alt"></i>  Giriş Yap</h1>

                <form action="login" method="POST" modelAttribute="userModel">


                    <div class="form-group">
                        <label for="email">Kullanıcı Adı</label>
                        <input
                            type="text"
                            id="userName"
                            name="userName"
                            class="form-control"
                            placeholder="Kullanıcı Adınızı Girin"
                            />
                    </div>
                    <div class="form-group">
                        <label for="password">Şifre</label>
                        <input
                            type="password"
                            id="userPassword"
                            name="userPassword"
                            class="form-control"
                            placeholder="Şifrenizi girin"
                            />
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Giriş Yap</button>
                    <div id="wrongPasswordHelp" class="form-text">Bilgilerinizi 3 kez hatalı girmeniz halinde hesabınız bloke edilir.</div>

                    <c:choose>
                        <c:when test="${userCheck}">
                            <div class="alert alert-warning" role="alert">
                                Kullanıcı adınız hatalı.
                            </div>
                        </c:when>
                        <c:when test="${wrongCount >0 && wrongCount<3}">
                            <div class="alert alert-warning" role="alert">
                                Bilgilerinizi ${wrongCount} kere hatalı girdiniz.
                            </div>
                        </c:when>
                        <c:when test="${wrongCount >=3}">
                            <div class="alert alert-danger" role="alert">
                                Bilgilerinizi bir çok kez hatalı girdiniz.
                                Hesabınız bloke edildi. Lütfen Sistem Yöneticisiyle görüşün.
                            </div>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </div>
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
</body>
</html>
