$(->
  $messages = $('#messages')
  if $messages.length > 0
    App.chatUsers = App.cable.subscriptions.create {
        channel: "ChatUsersChannel",
        chat_id: gon.chat_id
      },
      connected: ->

      disconnected: ->

      received: (data) ->
        switch data.type
          when "connected" then @user_connected(data)
          when "disconnected" then @user_disconnected(data)

      user_connected: (data) ->
        user = $("#chat-user-" + data.id)
        if user.length == 0
          $("#chat-users-list").append(data.html)

      user_disconnected: (data) ->
        $("#chat-user-" + data.id).remove()
)
