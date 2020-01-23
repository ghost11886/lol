--[[
 _____ ____  _   _    _    _  _______
|_   _/ ___|| | | |  / \  | |/ / ____|
  | | \___ \| |_| | / _ \ | ' /|  _|
  | |  ___) |  _  |/ ___ \| . \| |___
  |_| |____/|_| |_/_/   \_\_|\_\_____|
           CH > @TSHAKETEAM
--]]
--------------------------------------
serpent = (loadfile  "./libs/serpent.lua")()
https = require("ssl.https")
HTTPS = require("ssl.https")
http = require("socket.http")
http.TIMEOUT = 10
bot=dofile('./libs/utils.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
json = dofile("./libs/JSON.lua")
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
chats = {}
day = 86400
bot_iid = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_iid[1])
sudo_users = {sudo_add,bot_id}
tdcli=dofile('./libs/utils.lua')
URL33 = require('socket.url')
---------- {Show Files} -----------
red = '\27[31m' reset = '\27[m' Blue = "\27[34m" Green = "\27[32m"
local files_tshake = database:smembers("files"..bot_id) 
print(Green.."\nFiles Now Started : \n "..reset)
for i,v in pairs(files_tshake) do
print(Blue..i..red..' - \27[10;33m'..v..',\27[m')  end
print(Green.."\nThes all Files.\n\n\n"..reset)
io.popen("mkdir files_tshake")
os.execute('cd .. &&  rm -rf .telegram-cli')
os.execute('cd .. &&  rm -fr .telegram-cli')
--         »»                 Start Functions                         ««              --
function is_devabas(msg)  
local ta = false  
for k,v in pairs(sudo_users) do  
if msg.sender_user_id_ == v then  
ta = true  
end  end  
return ta  
end 
function is_devabass(user)  
local ta = false  
for k,v in pairs(sudo_users) do  
if user == v then  
ta = true  
end  end  
return ta  
end 
function is_sudo(msg) 
local hash = database:sismember('tshake:'..bot_id..'dev', msg.sender_user_id_) 
if hash or is_devabas(msg)  then  
return true  
else  
return false  
end  
end
function is_creatorbasic(msg)
local hash = database:sismember('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) then 
return true 
else 
return false 
end 
end
function is_creatorbasicc(chat,user)
local hash = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat,user)
if hash then 
return true 
else 
return false 
end 
end
function is_creatorr(chat,user)
local hash = database:sismember('tshake:'..bot_id..'creator:'..chat, user) 
if hash then 
return true 
else 
return false 
end 
end
function is_creator(msg)
local hash = database:sismember('tshake:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) then    
return true    
else    
return false    
end 
end
function is_owner(msg)
local hash = database:sismember('tshake:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) then    
return true    
else    
return false    
end 
end
function is_ownerr(chat,user)
local hash = database:sismember('tshake:'..bot_id..'owners:'..chat, user) 
if hash then 
return true 
else 
return false 
end 
end
function is_mod(msg)
local hash = database:sismember('tshake:'..bot_id..'mods:'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) or is_owner(msg) then    
return true    
else    
return false    
end 
end

function is_vip(msg)
local hash = database:sismember('tshake:'..bot_id..'vipgp:'..msg.chat_id_,msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) or is_owner(msg) or is_mod(msg) then    
return true 
else 
return false 
end 
end

function is_setban(msg)
local hash = database:sismember('tshake:'..bot_id..'SET:BAN'..msg.chat_id_,msg.sender_user_id_) 
if hash then    
return true 
else 
return false 
end 
end
function is_zhf(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
var = false
local zahf = database:sismember('tshake:'..bot_id..'zhfs:dz:'..msg.chat_id_,msg.sender_user_id_)
if zahf then var = true end
return var
end
function is_m6e(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
var = false
local m6e = database:sismember('tshake:'..bot_id..'m6es:dz:'..msg.chat_id_,msg.sender_user_id_)
if m6e then var = true end
return var
end

--         »»                 ck_mod                         ««              --
function ck_mod(user_id,chat_id)
if is_devabass(user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'dev', user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = true
elseif is_creatorbasicc(chat_id, user_id) then
var = true
elseif database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 

function  Rutba(user_id,chat_id)
if is_devabass(user_id) then
var = 'المطور الاساسي'  
elseif database:sismember('tshake:'..bot_id..'dev', user_id) then
var = 'المطور'  
elseif database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = 'المنشئ اساسي'
elseif database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) then
var = 'المنشئ'  
elseif database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id) then
var = 'المدير'  
elseif database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id) then
var = 'الادمن'  
elseif database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id) then  
var = 'المميز'  
else  
var = 'العضو'
end  
return var
end 
function RemBot(user_id,chat_id)
if is_devabass(user_id) then
var = 'sudo1'  
elseif database:sismember('tshake:'..bot_id..'dev', user_id) then
var = 'sudo'  
elseif database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = 'creato1'
elseif database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) then
var = 'creato'  
elseif database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id) then
var = 'owner'  
else  
var = 'No'
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember("thsake:gog"..bot_id, chat_id) then
var = true
else 
var = false
end
return var
end
--         »»                 is_banned                         ««              --
function is_banned(user_id, chat_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'banned:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gbanned                         ««              --
function is_gbanned(user_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'gbanned:', user_id)
if banned then var = true end
return var
end
--         »»                 is_muted                         ««              --
function is_muted(user_id, chat_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'muted:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gmuted                         ««              --
function is_gmuted(user_id)
local var = false 
local banned = database:sismember('tshake:'..bot_id..'gmuted:', user_id)
if banned then var = true end
return var
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         »»                 check_filter_words                         ««              --
local function check_filter_words(msg, value)
local hash =  'tshake:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_vip(msg) and not is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
local function openChat(chat_id,dl_cb)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil)
end
--         »»                 resolve_username                         ««              --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--         »»                 changeChatMemberStatus                         ««              --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
--         »»                 getInputFile                         ««              --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--         »»                 del_all_msgs                         ««              --
function del_all_msgs(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
--         »»                 deleteMessagesFromUser                         ««              --
local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
},cb or dl_cb, cmd)
end
--         »»                 getChatId                         ««              --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--         »»                 chat_leave                         ««              --
function chat_leave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--         »»                 from_username                         ««              --
function from_username(msg)
function gfrom_user(extra,result,success)
if result.username_ then
F = result.username_
else F = 'nil' end
return F
end
local username = getUser(msg.sender_user_id_,gfrom_user)
return username
end
--         »»                 chat_kick                         ««              --
function chat_kick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end

--         »»                 getParseMode                         ««              --
local function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end end return P
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         »»                 sendContact                         ««              --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end
--         »»                 sendPhoto                         ««              --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},}, dl_cb, nil)
end
--         »»                 getUserFull                         ««              --
function getUserFull(user_id,cb)
tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
}, cb, nil)
end
--         »»                 vardump                         ««              --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--         »»                 dl_cb                         ««              --
function dl_cb(arg, data)
end
--         »»                 send                         ««              --

local function sendtext(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end

local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
if text then 
local TextParseMode = getParseMode(parse_mode)
local text2 = text
local text_key = database:get('key_ts'..bot_id)
if text_key then
if parse_mode then
if parse_mode == 'markdown' or parse_mode == 'md' then
parse_mode = "Markdown"
elseif parse_mode == 'html' then
parse_mode = "Html"
end
end
local channel_ts = database:get("channel_ts"..bot_id)
local channel_user_ts = database:get("channel_user_ts"..bot_id)
keyboard = {}
keyboard.inline_keyboard = {
{
{text = ''..(channel_ts or "TshAkE TEAM")..'', url=''..(channel_user_ts or 't.me/TSHAKETEAM')..''},
},
}
local keko = "https://api.telegram.org/bot" ..token.. '/sendMessage?chat_id=' .. chat_id
if reply_to_message_id ~= 0 then
keko = keko .. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5 -- جميع الحقوق محفوظه لفريق تشاكي لايمكنك نسخ او استخدام هذه السطر بدون موافقه الفريق
end
if disable_web_page_preview then
keko = keko .. '&disable_web_page_preview=true'
end
if text then
keko = keko..'&text='..URL33.escape(text2)
end
if parse_mode then
keko = keko .. '&parse_mode='..parse_mode
end
keko = keko..'&reply_markup='..JSON.encode(keyboard)
https.request(keko)
else
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},}, dl_cb, nil)
end
end
end

local function SendText(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
--         »»                 changetitle                         ««              --
function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
--         »»                 edit                         ««              --
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end
--         »»                 setphoto                         ««              --
function setphoto(chat_id, photo)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end
--         »»                 delmsg                         ««              --
function delmsg(arg,data)
for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
end
end
--         »»                 unpinmsg                         ««              --
function unpinmsg(channel_id)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 delete_msg                         ««              --
function delete_msg(chatid,mid)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chatid,
message_ids_=mid
},
dl_cb, nil)
end
--         »»                 chat_del_user                         ««              --
function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--         »»                 getChannelMembers                         ««              --
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
--         »»                 getChannelFull                         ««              --
function getChannelFull(channel_id)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 channel_get_bots                         ««              --
local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelMembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end
getChannelFull(channel,callback_admins)
end
--         »»                 getInputMessageContent                         ««              --
local function getInputMessageContent(file, filetype, caption)
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end local inmsg = {} local filetype = filetype:lower() if filetype == 'animation' then inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption} elseif filetype == 'audio' then inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption} elseif filetype == 'document' then inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption} elseif filetype == 'photo' then inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption} elseif filetype == 'sticker' then inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption} elseif filetype == 'video' then inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption} elseif filetype == 'voice' then inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption} end return inmsg end 
--end
--         »»                 send_file                         ««              --
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
}, dl_cb, nil)
end
--         »»                 getUser                         ««              --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
--         »»                 pin                         ««              --
function pin(channel_id, message_id, disable_notification)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
}, dl_cb, nil)
end
--         »»                 tsX000                         ««              --
function tsX000(value,msg,text)
if value == "lock" then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end 
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(msg.sender_user_id_, keko333)
end
if value == "prore" then
function get_tshakeX(tshakex1,tshakex2,tshakex3)
local id_tshakex = tshakex2.sender_user_id_
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end 
info = '👤┇العضو ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(id_tshakex, keko333)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_tshakeX)
end
if value ~= "prore" and value~= "lock"  then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end 
info = '👤┇العضو ~⪼ ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, keko333)
end
end -- end fun
function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
vardump(Json_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
SendText(msg.chat_id_,msg.id_,'\n🚸┇ صلاحياته منشئ الكروب 🍃')   
return false  end 
if Json_Info.result.status == "member" then
SendText(msg.chat_id_,msg.id_,'\n🚸┇ مجرد عضو هنا 🍃')   
return false  end
if Json_Info.result.status == 'left' then
SendText(msg.chat_id_,msg.id_,'\n🚸┇ الشخص غير موجود هنا 🍃')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ'
else
info = '✘'
end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ'
else
delete = '✘'
end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ'
else
invite = '✘'
end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ'
else
pin = '✘'
end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ'
else
restrict = '✘'
end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ'
else
promote = '✘'
end
SendText(chat,msg.id_,'\n📌┇ الرتبة : مشرف 🍃 '..'\n💢┇ والصلاحيات هي ↓ \nٴ━━━━━━━━━━'..'\n📋┇ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨┇ حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n🚷┇ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n♻┇ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n🔘┇ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n🚸┇ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
local function GetInputFile(file)  
local file = file or ""   if file:match('/') then  infile = {ID= "InputFileLocal", path_  = file}  elseif file:match('^%d+$') then  infile = {ID= "InputFileId", id_ = file}  else  infile = {ID= "InputFilePersistentId", persistent_id_ = file}  end return infile 
end
local function sendRequest(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra) 
tdcli_function ({  ID = request_id,    chat_id_ = chat_id,    reply_to_message_id_ = reply_to_message_id,    disable_notification_ = disable_notification,    from_background_ = from_background,    reply_markup_ = reply_markup,    input_message_content_ = input_message_content,}, callback or dl_cb, extra) 
end
local function sendAudio(chat_id,reply_id,audio,title,caption)  
tdcli_function({ID="SendMessage",  chat_id_ = chat_id,  reply_to_message_id_ = reply_id,  disable_notification_ = 0,  from_background_ = 1,  reply_markup_ = nil,  input_message_content_ = {  ID="InputMessageAudio",  audio_ = GetInputFile(audio),  duration_ = '',  title_ = title or '',  performer_ = '',  caption_ = caption or ''  }},dl_cb,nil)
end  
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd) 
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd) 
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)  
local input_message_content = {   ID = "InputMessageVoice",   voice_ = getInputFile(voice),  duration_ = duration or 0,   waveform_ = waveform,    caption_ = caption  }  sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)  
local input_message_content = {    ID = "InputMessageSticker",   sticker_ = getInputFile(sticker),    width_ = 0,    height_ = 0  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end

function tshake_run_file(data)
local files_tshake = database:smembers("files"..bot_id)
for i=1,#files_tshake do
local tshakeee = dofile("files_tshake/"..files_tshake[i])
local kt = tshakeee.keko_tshake(data)
if kt == 'end' then
return false
end
end
end


function tshake_run_(msg,data)
local text = msg.content_.text_
------------------------------------------------------------------------

if text == ("مسح ردود المطور") and is_devabas(msg) then
local list = redis:smembers('tshake:'..bot_id..'sudo:kekore')
for k,v in pairs(list) do
redis:del('tshake:'..bot_id.."sudo:add:reply1:gif"..v)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:vico"..v)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:stekr"..v)     
redis:del('tshake:'..bot_id.."sudo:add:reply:rd"..v)   
redis:del('tshake:'..bot_id.."sudo:addreply1:photo:gp"..v)
redis:del('tshake:'..bot_id.."sudo:addreply1:video:gp"..v)
redis:del('tshake:'..bot_id.."sudo:addreply1:document:gp"..v)
redis:del('tshake:'..bot_id.."sudo:addreply1:audio:gp"..v)
redis:del('tshake:'..bot_id..'sudo:kekore')
end
send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المطور` 🗑", 1, 'md')
end

if text == ("ردود المطور") and is_devabas(msg) then
local list = redis:smembers('tshake:'..bot_id..'sudo:kekore')
text = "📑┇قائمه ردود المطور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
if redis:get('tshake:'..bot_id.."sudo:add:reply1:gif"..v) then
db = 'متحركه 🎭'
elseif redis:get('tshake:'..bot_id.."sudo:add:reply1:vico"..v) then
db = 'بصمه 📢'
elseif redis:get('tshake:'..bot_id.."sudo:add:reply1:stekr"..v) then
db = 'ملصق 🃏'
elseif redis:get('tshake:'..bot_id.."sudo:add:reply:rd"..v) then
db = 'رساله ✉'
elseif redis:get('tshake:'..bot_id.."sudo:addreply1:photo:gp"..v) then
db = 'صوره 🎇'
elseif redis:get('tshake:'..bot_id.."sudo:addreply1:video:gp"..v) then
db = 'فيديو 📹'
elseif redis:get('tshake:'..bot_id.."sudo:addreply1:document:gp"..v) then
db = 'ملف 📁'
elseif redis:get('tshake:'..bot_id.."sudo:addreply1:audio:gp"..v) then
db = 'اغنيه 🎵'
end
text = text.."<b>|"..k.."|</b>~⪼("..v..") » {"..db.."}\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕┇لا يوجد ردود للمطور"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local keko1 = redis:get('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
local test = redis:get('tshake:'..bot_id..'sudo:msg'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 're' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الرد', 1, 'md')
redis:set('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
if msg.content_.sticker_ then   
redis:set('tshake:'..bot_id.."sudo:add:reply1:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
redis:set('tshake:'..bot_id.."sudo:add:reply1:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:voice:caption:gp"..test,(msg.content_.caption_ or ''))  
end   
if msg.content_.animation_ then   
redis:set('tshake:'..bot_id.."sudo:add:reply1:gif"..test, msg.content_.animation_.animation_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:animation:caption:gp"..test,(msg.content_.caption_ or ''))  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
redis:set('tshake:'..bot_id.."sudo:add:reply:rd"..test, text)  
end  
if msg.content_.audio_ then
redis:set('tshake:'..bot_id.."sudo:addreply1:audio:gp"..test, msg.content_.audio_.audio_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:audio:caption:gp"..test,(msg.content_.caption_ or ''))  
end
if msg.content_.document_ then
redis:set('tshake:'..bot_id.."sudo:addreply1:document:gp"..test, msg.content_.document_.document_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:document:caption:gp"..test,(msg.content_.caption_ or ''))  
end
if msg.content_.video_ then
redis:set('tshake:'..bot_id.."sudo:addreply1:video:gp"..test, msg.content_.video_.video_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:video:caption:gp"..test,(msg.content_.caption_ or ''))  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
redis:set('tshake:'..bot_id.."sudo:addreply1:photo:gp"..test, photo_in_group)  
redis:set('tshake:'..bot_id.."sudo:addreply1:photo:caption:gp"..test,(msg.content_.caption_ or ''))  
end
return false  
end  
end
if text and text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه )\n☑┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات  ', 1, 'md')
redis:set('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
redis:set('tshake:'..bot_id..'sudo:msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
redis:del('tshake:'..bot_id.."sudo:add:reply1:gif"..text)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:vico"..text)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:stekr"..text)     
redis:del('tshake:'..bot_id.."sudo:add:reply:rd"..text)   
redis:del('tshake:'..bot_id.."sudo:addreply1:photo:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:video:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:document:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:audio:gp"..text)
redis:sadd('tshake:'..bot_id..'sudo:kekore', text)
return false end
end
if text and text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الرد', 1, 'md')
redis:del('tshake:'..bot_id.."sudo:add:reply1:gif"..text)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:vico"..text)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:stekr"..text)     
redis:del('tshake:'..bot_id.."sudo:add:reply:rd"..text)   
redis:del('tshake:'..bot_id.."sudo:addreply1:photo:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:video:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:document:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:audio:gp"..text)
redis:del('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
redis:srem('tshake:'..bot_id..'sudo:kekore', text)
return false
end
end
if text == 'اضف رد للكل' and is_devabas(msg) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد اضافتها ', 1, 'md')
redis:set('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
return false 
end
if text == 'حذف رد للكل' and is_devabas(msg) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد حذفها ', 1, 'md')
redis:set('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
return false 
end
if text and not database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
local anemi = redis:get('tshake:'..bot_id.."sudo:add:reply1:gif"..text)   
local veico = redis:get('tshake:'..bot_id.."sudo:add:reply1:vico"..text)   
local stekr = redis:get('tshake:'..bot_id.."sudo:add:reply1:stekr"..text)     
local text1 = redis:get('tshake:'..bot_id.."sudo:add:reply:rd"..text)   
local photo = redis:get('tshake:'..bot_id.."sudo:addreply1:photo:gp"..text)
local video = redis:get('tshake:'..bot_id.."sudo:addreply1:video:gp"..text)
local document = redis:get('tshake:'..bot_id.."sudo:addreply1:document:gp"..text)
local audio = redis:get('tshake:'..bot_id.."sudo:addreply1:audio:gp"..text)
------------------------------------------------------------------------
local video_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:video:caption:gp"..text) or '' )
local photo_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:photo:caption:gp"..text) or '' )
local document_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:document:caption:gp"..text) or '' )
local audio_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:audio:caption:gp"..text) or '' )
local animation_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:animation:caption:gp"..text) or '' )
local voice_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:voice:caption:gp"..text) or '' )
------------------------------------------------------------------------
if text1 then 
function tshake_re(t1,t2)
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
local text1 = text1:gsub('#username',(t2.username_ or 'لا يوجد')) 
local text1 = text1:gsub('#name',(t2.first_name_ or 'لا يوجد'))
local text1 = text1:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local text1 = text1:gsub('#edit',(edit or 'لا يوجد'))
local text1 = text1:gsub('#msgs',(user_msgs or 'لا يوجد'))
local text1 = text1:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text1, 1, 'md')
end
getUser(msg.sender_user_id_, tshake_re)
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, anemi, '', nil)  
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,photo_caption)
end  
end

if text == ("مسح ردود المدير") and is_owner(msg) then
local list = redis:smembers('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
for k,v in pairs(list) do
redis:del('tshake:'..bot_id.."add:reply1:gif"..v..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:vico"..v..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:stekr"..text..msg.chat_id_)     
redis:del('tshake:'..bot_id.."add:reply:rd"..v..msg.chat_id_)   
redis:del('tshake:'..bot_id.."addreply1:photo:gp"..v..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:video:gp"..v..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:document:gp"..v..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:audio:gp"..v..msg.chat_id_)
redis:del('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
end
send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المدير` 🗑", 1, 'md')
end

if text == ("ردود المدير") and is_owner(msg) then
local list = redis:smembers('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
text = "📑┇قائمه ردود المدير\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
if redis:get('tshake:'..bot_id.."add:reply1:gif"..v..msg.chat_id_) then
db = 'متحركه 🎭'
elseif redis:get('tshake:'..bot_id.."add:reply1:vico"..v..msg.chat_id_) then
db = 'بصمه 📢'
elseif redis:get('tshake:'..bot_id.."add:reply1:stekr"..v..msg.chat_id_) then
db = 'ملصق 🃏'
elseif redis:get('tshake:'..bot_id.."add:reply:rd"..v..msg.chat_id_) then
db = 'رساله ✉'
elseif redis:get('tshake:'..bot_id.."addreply1:photo:gp"..v..msg.chat_id_) then
db = 'صوره 🎇'
elseif redis:get('tshake:'..bot_id.."addreply1:video:gp"..v..msg.chat_id_) then
db = 'فيديو 📹'
elseif redis:get('tshake:'..bot_id.."addreply1:document:gp"..v..msg.chat_id_) then
db = 'ملف 📁'
elseif redis:get('tshake:'..bot_id.."addreply1:audio:gp"..v..msg.chat_id_) then
db = 'اغنيه 🎵'
end
text = text.."<b>|"..k.."|</b>~⪼("..v..") » {"..db.."}\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕┇لا يوجد ردود للمدير"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
local test = redis:get('tshake:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 're' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الرد', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
if msg.content_.sticker_ then   
redis:set('tshake:'..bot_id.."add:reply1:stekr"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
redis:set('tshake:'..bot_id.."add:reply1:vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:voice:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end   
if msg.content_.animation_ then   
redis:set('tshake:'..bot_id.."add:reply1:gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:animation:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
redis:set('tshake:'..bot_id.."add:reply:rd"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
redis:set('tshake:'..bot_id.."addreply1:audio:gp"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:audio:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
if msg.content_.document_ then
redis:set('tshake:'..bot_id.."addreply1:document:gp"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:document:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
if msg.content_.video_ then
redis:set('tshake:'..bot_id.."addreply1:video:gp"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:video:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
redis:set('tshake:'..bot_id.."addreply1:photo:gp"..test..msg.chat_id_, photo_in_group)  
redis:set('tshake:'..bot_id.."addreply1:photo:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
return false  
end  
end
if text and text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه )\n☑┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات  ', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
redis:set('tshake:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
redis:del('tshake:'..bot_id.."add:reply1:gif"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:vico"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:stekr"..text..msg.chat_id_)     
redis:del('tshake:'..bot_id.."add:reply:rd"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."addreply1:photo:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:video:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:document:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:audio:gp"..text..msg.chat_id_)
redis:sadd('tshake:'..bot_id..'kekore'..msg.chat_id_..'', text)
return false end
end
if text and text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الرد', 1, 'md')
redis:del('tshake:'..bot_id.."add:reply1:gif"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:vico"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:stekr"..text..msg.chat_id_)     
redis:del('tshake:'..bot_id.."add:reply:rd"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."addreply1:photo:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:video:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:document:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:audio:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
redis:srem('tshake:'..bot_id..'kekore'..msg.chat_id_..'', text)
return false
end
end
if text == 'اضف رد' and is_mod(msg) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد اضافتها ', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
return false 
end
if text == 'حذف رد' and is_mod(msg) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد حذفها ', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
return false 
end
if text and not database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
local anemi = redis:get('tshake:'..bot_id.."add:reply1:gif"..text..msg.chat_id_)   
local veico = redis:get('tshake:'..bot_id.."add:reply1:vico"..text..msg.chat_id_)   
local stekr = redis:get('tshake:'..bot_id.."add:reply1:stekr"..text..msg.chat_id_)     
local text1 = redis:get('tshake:'..bot_id.."add:reply:rd"..text..msg.chat_id_)   
local photo = redis:get('tshake:'..bot_id.."addreply1:photo:gp"..text..msg.chat_id_)
local video = redis:get('tshake:'..bot_id.."addreply1:video:gp"..text..msg.chat_id_)
local document = redis:get('tshake:'..bot_id.."addreply1:document:gp"..text..msg.chat_id_)
local audio = redis:get('tshake:'..bot_id.."addreply1:audio:gp"..text..msg.chat_id_)
------------------------------------------------------------------------
local video_caption = (redis:get('tshake:'..bot_id.."addreply1:video:caption:gp"..text..msg.chat_id_) or '' )
local photo_caption = (redis:get('tshake:'..bot_id.."addreply1:photo:caption:gp"..text..msg.chat_id_) or '' )
local document_caption = (redis:get('tshake:'..bot_id.."addreply1:document:caption:gp"..text..msg.chat_id_) or '' )
local audio_caption = (redis:get('tshake:'..bot_id.."addreply1:audio:caption:gp"..text..msg.chat_id_) or '' )
local animation_caption = (redis:get('tshake:'..bot_id.."addreply1:animation:caption:gp"..text..msg.chat_id_) or '' )
local voice_caption = (redis:get('tshake:'..bot_id.."addreply1:voice:caption:gp"..text..msg.chat_id_) or '' )
------------------------------------------------------------------------
if text1 then 
function tshake_re(t1,t2)
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
local text1 = text1:gsub('#username',(t2.username_ or 'لا يوجد')) 
local text1 = text1:gsub('#name',(t2.first_name_ or 'لا يوجد'))
local text1 = text1:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local text1 = text1:gsub('#edit',(edit or 'لا يوجد'))
local text1 = text1:gsub('#msgs',(user_msgs or 'لا يوجد'))
local text1 = text1:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text1, 1, 'md')
end
getUser(msg.sender_user_id_, tshake_re)
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, anemi)   
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,photo_caption)
end  
end

------------------------------------------------------------------------
if database:get('tshake:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) and is_sudo(msg) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
send(msg.chat_id_, msg.id_, 1, "*📬┇ تم الغاء الاذاعه للمشتركين *\n", 1, "md") 
database:del('tshake:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
else 
local gps = database:scard('tshake:'..bot_id.."userss") or 0 
if msg.content_.text_ then
whatbc = 'الرساله'
local list = database:smembers('tshake:'..bot_id..'userss') 
for k,v in pairs(list) do 
send(v, 0, 1, '[ '..msg.content_.text_..' ]', 1, 'md')  
end
elseif msg.content_.photo_ then
whatbc = 'الصور'
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = database:smembers('tshake:'..bot_id..'userss') 
for k,v in pairs(list) do 
tdcli.sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
whatbc = 'المتحركه'
local list = database:smembers('tshake:'..bot_id..'userss') 
for k,v in pairs(list) do 
tdcli.sendDocument(v, 0,0, 1, nil, msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
whatbc = 'الملصق'
local list = database:smembers('tshake:'..bot_id..'userss') 
for k,v in pairs(list) do 
tdcli.sendSticker(v, 0,0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)
end 
end
send(msg.chat_id_, msg.id_, 1, '☑┇تم نشر الرساله الى {'..(gps)..'} مشترك ', 1, 'md')
database:del('tshake:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end 
------------------------------------------------------------------------
if database:get("tshake:set_if_bc_new:"..bot_id..msg.sender_user_id_) and is_sudo(msg) then  
database:del("tshake:set_if_bc_new:"..bot_id..msg.sender_user_id_)
local pro = database:scard('tshake:'..bot_id..'pro:groups') or 0
if text then 
local gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
send(gpss[i], 0, 1, text, 1, 'html')						
end
end
if (data.message_.content_.sticker_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendSticker(gpss[i], 0,0, 1, nil, data.message_.content_.sticker_.sticker_.persistent_id_)
end
elseif (data.message_.content_.voice_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendVoice(gpss[i], 0,0, 1, nil, data.message_.content_.voice_.voice_.persistent_id_)
end
elseif (data.message_.content_.video_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendVideo(gpss[i], 0,0, 1, nil, data.message_.content_.video_.video_.persistent_id_)
end
elseif (data.message_.content_.animation_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.animation_.animation_.persistent_id_)
end
end
elseif (data.message_.content_.document_) then
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('tshake:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.document_.document_.persistent_id_)
end
end
elseif (data.message_.content_.photo_) then
local id_keko = nil
if data.message_.content_.photo_.sizes_[0] then
id_keko = data.message_.content_.photo_.sizes_[0].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[1] then
id_keko = data.message_.content_.photo_.sizes_[1].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[2] then
id_keko = data.message_.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if data.message_.content_.photo_.sizes_[3] then
id_keko = data.message_.content_.photo_.sizes_[3].photo_.persistent_id_
end
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendPhoto(gpss[i], 0, 0, 1, nil, id_keko,(msg.content_.caption_ or " "))				
end
end
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, '☑┇تم نشر الرساله في {'..(#gpss)..'} مجموعه ', 1, 'md')
return false
end
------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'texts'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'texts'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'textst'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ تم حفظ الاسم ', 1, 'html')
redis:set('tshake:'..bot_id..'textst'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'name_bot', text)
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^+(.*)$") then
local kekoo = redis:get('tshake:'..bot_id..'sudoo'..text..'')
local keko2 = redis:get('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال الاسم الذي تريده` 🏷', 1, 'md')
redis:set('tshake:'..bot_id..'nmkeko', text)
redis:set('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'mmsg')
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'')
if keko2 == 'mmsg' then
send(msg.chat_id_, msg.id_, 1, '• `تم حفظ الاسم يمكنك اظهار الجه ب
