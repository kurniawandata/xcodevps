#!/bin/bash
#Desain front end halaman login ini dibuat oleh awan - e-mail: hermawan9815@gmail.com , untuk back end oleh kurniawan - e-mail: kurniawanajazenfone@gmail.com
echo "Content-type: text/html"
echo ""
patch=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
cat <<EOT
<!DOCTYPE html>
<html>
<head>
    <title>Pendaftaran VPS</title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <style>
    {
        font: bold 16px;
        color:WHITE;
        background-color:BLACK;
        width:100px;border-radius: 5px;
        text-align:center;
    }
    .errmsg
    {color:#ff0000;}
    </style>
</head>
<body>
<script>
function hideButton(x)
 {
  x.style.display = 'none';
 }
</script>
    <div class="container">
        <div class="row">
            <div class="offset-1 col-10 mt-4">
                <h3 style="text-align: center;">Pendaftaran akun VPS</h3>
<br>
                <form action="aksesrun.sh" method="get">
                <table class="table">
                    <tr>
                        <td>Nama Sub domain : </td>
                        <td>
                            <input type="text" name="name" pattern="^[a-z0-9]+$"  title="Hanya mendukung huruf kecil dan angka.">.securityhub.id
                        </td>
                    </tr>

                     <tr>
                        <td>Password : </td>
                        <td>
                            <input type="password" name="password" pattern="^[a-z0-9]+$"  title="Hanya mendukung huruf kecil dan angka." class="form-control">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Alamat e-mail : </td>
                        <td>
                            <input type="email" name="email" pattern="^[a-zA-Z0-9.@]+$" title="Hanya format e-mail.." class="form-control">
                        </td>
                    </tr>

                    <tr>
                        <td>Nomor whatsapp : </td>
                        <td>
                            <input type="text" name="wa" pattern="^[0-9]+$" title="Jika nomor whatsapp tidak diisi maka tidak bisa recovery password & sebagainya" class="form-control">
                        </td>
                    </tr>

                        <td>Kode aktivasi : </td>
                        <td>
                            <input type="text" name="cek" pattern="^[a-zA-Z0-9]+$" title="kode." class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:right;">
                            <input onclick="hideButton(this)" type="submit" value="Daftar" class="btn btn-sm btn-primary form-control"/>
                        </td>
                    </tr>
                </table>
                </form>
</a>

            </div>
        </div>
    </div>
<br>
<br>
</body>
</html>
EOT
