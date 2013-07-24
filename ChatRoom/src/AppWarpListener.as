package
{
    import com.shephertz.appwarp.WarpClient;
    import com.shephertz.appwarp.listener.ChatRequestListener;
    import com.shephertz.appwarp.listener.ConnectionRequestListener;
    import com.shephertz.appwarp.listener.NotificationListener;
    import com.shephertz.appwarp.listener.RoomRequestListener;
    import com.shephertz.appwarp.messages.Chat;
    import com.shephertz.appwarp.messages.LiveRoom;
    import com.shephertz.appwarp.messages.Lobby;
    import com.shephertz.appwarp.messages.Move;
    import com.shephertz.appwarp.messages.Room;
    import com.shephertz.appwarp.types.ResultCode;
    
    import flash.text.TextField;
    import flash.utils.ByteArray;
    
    public class AppWarpListener implements ConnectionRequestListener, RoomRequestListener, NotificationListener,ChatRequestListener
    {
		
        private var _owner:AppWarpChatRoomDemo;
        
        public function AppWarpListener(owner:AppWarpChatRoomDemo)
        {
            _owner = owner;
        }
        
        
		public function onConnectDone(res:int):void
		{
			if(res == ResultCode.success)
			{
				_owner.appwarp.joinRoom(_owner.roomID);
			}
			else{
				_owner.outputTextField.text += "\nConnection Failed!";
				_owner.connectbtn.backgroundColor = _owner.BLACK;
				_owner.chatBtn.backgroundColor = _owner.GREY;
				_owner.disconnectbtn.backgroundColor = _owner.GREY;
			}
		}
		
		public function onDisConnectDone(res:int):void
		{
			_owner.outputTextField.text += "\nDisconnected!";
			_owner.userinputTextField.text = _owner.NAME_PROMPT;
			_owner.userinputTextField.textColor = _owner.GREY;
			_owner.connectbtn.backgroundColor = _owner.BLACK;
			_owner.chatBtn.backgroundColor = _owner.GREY;
			_owner.disconnectbtn.backgroundColor = _owner.GREY;
		}
		
		
		public function onSubscribeRoomDone(event:Room):void
		{
			if(event.result == ResultCode.success){
				_owner.outputTextField.text += "\nReady To Chat!";
				_owner.userinputTextField.text = _owner.CHAT_PROMPT;
				_owner.userinputTextField.textColor = _owner.GREY;    
				_owner.chatBtn.backgroundColor = _owner.BLACK;
				_owner.disconnectbtn.backgroundColor = _owner.BLACK;
			}
			else{
				_owner.outputTextField.text += "\nSubscribe Room Failed!";
			}
		}
		public function onUnsubscribeRoomDone(event:Room):void
		{
		}
		
		public function onJoinRoomDone(event:Room):void
		{
			if(event.result == ResultCode.success){
				_owner.appwarp.subscribeRoom(_owner.roomID);
			}
			else{
				_owner.outputTextField.text += "Room Join Failed!"
			}
		}
		
		public function onLeaveRoomDone(event:Room):void
		{
		}
		
		public function onGetLiveRoomInfoDone(event:LiveRoom):void
		{
		}
		
		public function onSetCustomRoomDataDone(event:LiveRoom):void
		{
		}
		
		public function onUpdatePropertiesDone(event:LiveRoom):void
		{        
		}
		
		public function onLockPropertiesDone(result:int):void
		{
			
		}
		
		public function onUnlockPropertiesDone(result:int):void
		{
			
		}
		
		public function onSendChatDone(res:int):void
		{
			if(res != ResultCode.success){
				_owner.outputTextField.text += "\nonSendChatDone : "+res;
			}
			else{
				_owner.chatBtn.backgroundColor = _owner.BLACK;
				_owner.userinputTextField.text = _owner.CHAT_PROMPT;
				_owner.userinputTextField.textColor = _owner.GREY;
			}
		}
		
		public function onSendPrivateChatDone(res:int):void
		{
			
		}
		
		public function onRoomCreated(event:Room):void
		{
		}
		public function onRoomDestroyed(event:Room):void
		{
		}
		public function onUserLeftRoom(event:Room, user:String):void
		{
			_owner.outputTextField.text += "\n"+user+" has left";
		}
		public function onUserJoinedRoom(event:Room, user:String):void
		{
			_owner.outputTextField.text += "\n"+user+" has joined";	
		}
		public function onUserLeftLobby(event:Lobby, user:String):void
		{
		}
		public function onUserJoinedLobby(event:Lobby, user:String):void
		{
		}        
		public function onChatReceived(event:Chat):void
		{
			_owner.outputTextField.text += "\n"+ event.sender+ ": " +event.chat;
		}
		public function onPrivateChatReceived(sender:String, message:String):void
		{
			
		}
		public function onUpdatePeersReceived(update:ByteArray):void
		{	
		}
		public function onUserChangeRoomProperties(room:Room, user:String,properties:Object, lockTable:Object):void
		{
		}
		
		public function onMoveCompleted(moveEvent:Move):void
		{
			
		}
    }
}