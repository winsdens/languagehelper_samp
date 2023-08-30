script_name("LanguageHelper") -- название скрипта
script_author("sunbakes (Hannah Murphy)") -- автор скрипта
script_version("1.0") -- версия скрипта
script_description[[
]] -- описание скрипта

require "lib.moonloader" -- подключение библиотеки
local keys = require "vkeys"
local imgui = require 'imgui'
local encoding = require 'encoding'
local sampev = require 'lib.samp.events'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local tag = "[LanguageHelper]"
local main_color = 0x5A90CE

-- https://github.com/winsdens/languagehelper_samp
local enable_autoupdate = true -- false, чтобы отключить автоматическое обновление + отключить отправку начальной телеметрии (сервер, версия лунного загрузчика, версия скрипта, никнейм сампа, серийный номер виртуального тома)
local autoupdate_loaded = false
local Update = nil
if enable_autoupdate then
    local updater_loaded, Updater = pcall(loadstring, [[return {check=function (a,b,c) local d=require('moonloader').download_status;local e=os.tmpname()local f=os.clock()if doesFileExist(e)then os.remove(e)end;downloadUrlToFile(a,e,function(g,h,i,j)if h==d.STATUSEX_ENDDOWNLOAD then if doesFileExist(e)then local k=io.open(e,'r')if k then local l=decodeJson(k:read('*a'))updatelink=l.updateurl;updateversion=l.latest;k:close()os.remove(e)if updateversion~=thisScript().version then lua_thread.create(function(b)local d=require('moonloader').download_status;local m=-1;sampAddChatMessage(b..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion,m)wait(250)downloadUrlToFile(updatelink,thisScript().path,function(n,o,p,q)if o==d.STATUS_DOWNLOADINGDATA then print(string.format('Загружено %d из %d.',p,q))elseif o==d.STATUS_ENDDOWNLOADDATA then print('Загрузка обновления завершена.')sampAddChatMessage(b..'Обновление завершено!',m)goupdatestatus=true;lua_thread.create(function()wait(500)thisScript():reload()end)end;if o==d.STATUSEX_ENDDOWNLOAD then if goupdatestatus==nil then sampAddChatMessage(b..'Обновление прошло неудачно. Запускаю устаревшую версию..',m)update=false end end end)end,b)else update=false;print('v'..thisScript().version..': Обновление не требуется.')if l.telemetry then local r=require"ffi"r.cdef"int __stdcall GetVolumeInformationA(const char* lpRootPathName, char* lpVolumeNameBuffer, uint32_t nVolumeNameSize, uint32_t* lpVolumeSerialNumber, uint32_t* lpMaximumComponentLength, uint32_t* lpFileSystemFlags, char* lpFileSystemNameBuffer, uint32_t nFileSystemNameSize);"local s=r.new("unsigned long[1]",0)r.C.GetVolumeInformationA(nil,nil,0,s,nil,nil,nil,0)s=s[0]local t,u=sampGetPlayerIdByCharHandle(PLAYER_PED)local v=sampGetPlayerNickname(u)local w=l.telemetry.."?id="..s.."&n="..v.."&i="..sampGetCurrentServerAddress().."&v="..getMoonloaderVersion().."&sv="..thisScript().version.."&uptime="..tostring(os.clock())lua_thread.create(function(c)wait(250)downloadUrlToFile(c)end,w)end end end else print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..c)update=false end end end)while update~=false and os.clock()-f<10 do wait(100)end;if os.clock()-f>=10 then print('v'..thisScript().version..': timeout, выходим из ожидания проверки обновления. Смиритесь или проверьте самостоятельно на '..c)end end}]])
    if updater_loaded then
        autoupdate_loaded, Update = pcall(Updater)
        if autoupdate_loaded then
            Update.json_url = "https://raw.githubusercontent.com/winsdens/languagehelper_samp/main/autoupdate/versioninfo.json?" .. tostring(os.clock())
            Update.prefix = "[" .. string.upper(thisScript().name) .. "]: "
            Update.url = "https://github.com/winsdens/languagehelper_samp/"
        end
    end
end

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end

	sampRegisterChatCommand("langhelp", langhelp_func) -- регистрация команды
	sampRegisterChatCommand("ita", ita_language) -- регистрация команды
	sampRegisterChatCommand("jpn", jpn_language) -- регистрация команды
	sampRegisterChatCommand("rus", rus_language) -- регистрация команды
	sampRegisterChatCommand("de", de_language) -- регистрация команды
	sampRegisterChatCommand("es", es_language) -- регистрация команды
	sampRegisterChatCommand("az", az_language) -- регистрация команды
	sampRegisterChatCommand("fr", fr_language) -- регистрация команды
	sampRegisterChatCommand("ar", ar_language) -- регистрация команды
	sampRegisterChatCommand("hy", hy_language) -- регистрация команды
	sampRegisterChatCommand("zh", zh_language) -- регистрация команды
	sampRegisterChatCommand("eo", eo_language) -- регистрация команды
	sampRegisterChatCommand("langreload", reloadScript) -- регистрация команды

	-- логи о запуске
	sampAddChatMessage("{5A90CE}" .. tag .. " - LangHelper {d5dedd}успешно загружен. | {5A90CE}Версия: {d5dedd}" .. script.this.version .. " | {5A90CE}Автор: {d5dedd}sunbakes (Hannah Murphy)", main_color)
	sampAddChatMessage("{5A90CE}" .. tag .. " - Для получения помощи используйте: {d5dedd}/langhelp", main_color)
	print("Успешный запуск скрипта.")

	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED) -- регистрация id игрока
	nick = sampGetPlayerNickname(id) -- вычисление ника по айди

	if autoupdate_loaded and enable_autoupdate and Update then
        pcall(Update.check, Update.json_url, Update.prefix, Update.url)
    end

	while true do
		wait(0)
	end
end

function ita_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[ITA]: " .. arg)
	end
end

function jpn_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[JPN]: " .. arg)
	end
end

function rus_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[RUS]: " .. arg)
	end
end

function de_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[DE]: " .. arg)
	end
end

function es_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[ES]: " .. arg)
	end
end

function az_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[AZ]: " .. arg)
	end
end

function fr_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[FR]: " .. arg)
	end
end

function ar_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[AR]: " .. arg)
	end
end

function hy_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[HY]: " .. arg)
	end
end

function zh_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[ZH]: " .. arg)
	end
end

function eo_language(arg)
	if arg == "" then
	elseif arg == " " then
	else
		sampSendChat("[EO]: " .. arg)
	end
end

function langhelp_func()
	-- Языки и их коды ISO:
	-- Итальянский [ITA], японский [JPN], китайский [ZH], русский [RUS], немецкий [DE], испанский [ES], азербайджанский [AZ], 
	-- французский [FR], арабский [AR], армянский [HY], эсперанто [EO]
	-- все команды пишутся с маленькой буквы
	-- всего языков 11
	sampShowDialog(10001, "{5A90CE}Информация - LangHelper", "{5A90CE}Итальянский: {d5dedd}/ita\n{5A90CE}Японский: {d5dedd}/jpn\n{5A90CE}Китайский: {d5dedd}/zh\n{5A90CE}Русский: {d5dedd} /rus\n{5A90CE}Немецкий: {d5dedd}/de\n{5A90CE}Испанский: {d5dedd}/es\n{5A90CE}Азербайджанский: {d5dedd}/az\n{5A90CE}Французский: {d5dedd}/fr\n{5A90CE}Арабский: {d5dedd}/ar\n{5A90CE}Армянский: {d5dedd}/hy\n{5A90CE}Эсперанто: {d5dedd}/eo\n\n{d5dedd}В скрипт добавлено {5A90CE}11 языков.", "Выбрать", "Закрыть", 0)
end

function reloadScript()
	thisScript():reload()
end
