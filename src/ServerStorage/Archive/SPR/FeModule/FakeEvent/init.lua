local signal = require(script:WaitForChild'ScriptConnection').new

local fakeEvent = {}

function fakeEvent.new()
	local conn = {
		_connections={};
	}
	
	setmetatable(conn,{__index=fakeEvent})
	
	return conn;
end

function fakeEvent:fire(...)
	for i = 1,#self._connections do
		local connection = self._connections[i]
		connection.Function(#connection.Args>0 and unpack(connection.Args) or ...)
	end	
end

function fakeEvent:connect(func,...)
	local obj = signal(self,func,...)
	table.insert(self._connections,obj)
	return obj
end

fakeEvent.Fire=fakeEvent.fire;
fakeEvent.Connect=fakeEvent.connect;

setmetatable(fakeEvent,{__call=fakeEvent.new})
return fakeEvent;