local log = require("log")
local api = require("coreApi")
local json = require("json")
local http = require("http")

function ReceiveFriendMsg(CurrentQQ, data)
    log.notice("From Lua Log ReceiveFriendMsg %s", CurrentQQ)
    return 1
end
function ReceiveGroupMsg(CurrentQQ, data)
    if (string.find(data.Content, "复述") == 1) then
        keyWord = data.Content:gsub("复述", "")

        --log.notice("From Lua data.FromGroupId %d", data.FromGroupId)

        luaRes =
            api.api_SendMsg(
            CurrentQQ,
            {
                toUser = data.FromGroupId,
                sendToType = 2,
                sendMsgType = "TeXiaoTextMsg",
                groupid = 0,
                content = keyWord,
                atUser = 0
            }
        )
        log.notice("From Lua SendMsg Ret-->%d", luaRes.Ret)
    end
    return 1
end
function ReceiveFriendEvents(CurrentQQ, data, extData)
    return 1
end
function ReceiveGroupEvents(CurrentQQ, data, extData)
    return 1
end