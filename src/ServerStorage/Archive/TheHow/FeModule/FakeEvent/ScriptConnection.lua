local ScriptConnection = {}

function ScriptConnection.new(event,func,...)
	local connObj = newproxy(true)
	local conn = {
		Event=event;
		Function=func;
		Args={...};
		Object=connObj;
	}
	getmetatable(connObj).__index=function(self,index)
		if(index=='Locked')then
			return nil;
		else
			return conn[index] or ScriptConnection[index]
		end
	end
	getmetatable(connObj).__newindex=function(self,index,value)
		if(index=='Locked' and getfenv(2).script==script)then
			conn.Locked=value
		elseif(index~='Locked')then
			conn[index]=value
		end
	end
	
	return connObj;
end

function ScriptConnection:disconnect()
	self.Event._connections[self]=nil;
end

function ScriptConnection:Lock(key)
	self.Locked=key;
end

function ScriptConnection:Unlock(key)
	if(self.Locked==key)then
		self.Locked=nil;
	else
		error("Invalid key!",2)
	end
end


ScriptConnection.Disconnect=ScriptConnection.disconnect;

setmetatable(ScriptConnection,{__call=function(s,...)ScriptConnection.new(...) end})
return ScriptConnection;