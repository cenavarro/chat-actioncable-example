$(->
  scrollToTop = (element) ->
    $messages.scrollTop($messages[0].scrollHeight)

  $messages = $('#messages')
  if $messages.length > 0
    scrollToTop($messages)
    $newMessageForm = $('#new-message-form')

    if $newMessageForm.length > 0
      $newMessageBody = $newMessageForm.find('#new-message-body')

      $newMessageBody.on("keypress", (event) ->
        if event.which == 13 && !event.shiftKey
          $(event.target).closest("form").find(":submit").click()
      );

      $newMessageForm.on("ajax:success", (event, data) ->
        $newMessageBody.val("")
        [data, status, xhr] = event.detail
        $messages.append(data.html)
        scrollToTop($messages)
      ).on("ajax:error", (event) ->
        alert("Error sending message. Please try again!")
      )
)
