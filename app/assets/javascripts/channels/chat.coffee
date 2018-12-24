$(->
  $messages = $('#messages')
  if $messages.length > 0
    $newMessageForm = $('#new-message-form')
    $newMessageBody = $newMessageForm.find('#new-message-body')

    App.chat = App.cable.subscriptions.create {
        channel: "ChatChannel",
        chat_id: 1
      },
      connected: ->

      disconnected: ->

      received: (data) ->
        if $messages.find("#message-" + data.id).length == 0
          $messages.append(data.html)
          $messages.scrollTop($messages[0].scrollHeight)
)
