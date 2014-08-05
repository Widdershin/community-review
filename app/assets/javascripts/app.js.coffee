# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.upvote').on 'click', ->
    reviewId = $(this).parents('.review').attr('data-id')

    if $(this).hasClass('upvoted')
      $(this).removeClass('upvoted')
      $.delete '/votes', { id: reviewId }


    $.post('/votes', { id: reviewId })

    $pointText = $(this).next()

    points = parseInt $pointText.text().match(/\d+/)

    $pointText.text((points + 1) + ' point(s)')

    $(this).addClass('upvoted')