# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.upvote').on 'click', ->
    if $(this).hasClass('upvoted')
      return

    reviewId = $(this).parents('.review').attr('data-id')

    console.log(reviewId)

    $.post('/votes', { id: reviewId })

    $pointText = $(this).next()

    points = parseInt $pointText.text().match(/\d+/)

    console.log points

    $pointText.text((points + 1) + ' point(s)')

    $(this).addClass('upvoted')