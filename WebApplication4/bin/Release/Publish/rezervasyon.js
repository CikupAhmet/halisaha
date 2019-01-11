function degistir() {
    
    document.getElementById('btn8').value = ' Rezerve ';
    document.getElementById('btn8').style.backgroundColor = '#333';
}
function sweetalertclick2() {
    swal(
        'Kayıt Başarısız',
        'Eksik veya Yanlış Bir Bilgi Girdiniz',
        'error'
    )
}
function sweetalertclick() {
    swal(
        'Rezervasyon Başarılı',
        'Lütfen Halısaha Servisini 2 saat önce arayıp teyit ediniz!',
        'success'
    )
}