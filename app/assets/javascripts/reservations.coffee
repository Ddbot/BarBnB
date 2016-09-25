# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jour_d = $("#reservation_start_date_3i").val()
mois_d = $("#reservation_start_date_2i").val() 
annee_d = $("#reservation_start_date_1i").val()

jour_f = $("#reservation_end_date_3i").val()
mois_f = $("#reservation_end_date_2i").val() 
annee_f = $("#reservation_end_date_1i").val()


price = $("#p_p_n").val()
ppn = parseInt(price)

var date_debut  = new Date(concat(mois_d,"/",jour_d,"/",annee_d)
var date_fin  = new Date(concat(mois_f,"/",jour_f,"/",annee_f)

var timeDiff = Math.abs(date_fin.getTime() - date_debut.getTime())
var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) 

total = diffDays * price

$("#totalprice").val(total)

