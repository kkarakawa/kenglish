# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@set_cookie = (e, id) ->
  cookie = $.cookie("bookmark")
  cookies = cookie.split(",")
  cookies.shift() if cookies[0] == ""
  idx = jQuery.inArray(id, cookies)
  $(e).toggleClass("btn-default").toggleClass("btn-warning")
  if $(e).hasClass("btn-default")
    cookies.splice idx, 1 unless idx == -1
  else
    cookies.push id if idx == -1
  $.cookie("bookmark", cookies, { expires: 7305, path: "/" })

@checkAnswer = (id) ->
  $("#" + id).prop "disabled", true
  $.ajax(
    type: "POST",
    url: "/test/answer",
    data: {
            "id": id
            "answer": $('#' + id).val()
          },
    dataType: "json",
    success: (data) ->
      if data.result == "OK"
        $("#result_" + id).text "正解!!"
        $("#result_" + id).addClass "text-success"
      else
        $("#result_" + id).text "不正解"
        $("#result_" + id).addClass "text-danger"
        $("#answer_" + id).text data.answer
  )
