script_name("LanguageHelper") -- название скрипта
script_author("sunbakes (Hannah Murphy)") -- автор скрипта
script_version("1.0") -- версия скрипта
script_description[[
{5A90CE}Система абонентского контроля.
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
	sampAddChatMessage("{5A90CE}" .. tag .. " - LangHelper {d5dedd}успешно загружен. | {5A90CE}Версия: {d5dedd}1.0 | {5A90CE}Автор: {d5dedd}sunbakes (Hannah Murphy)", main_color)
	sampAddChatMessage("{5A90CE}" .. tag .. " - Для получения помощи используйте: {d5dedd}/langhelp", main_color)
	print("Успешный запуск скрипта.")

	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED) -- регистрация id игрока
	nick = sampGetPlayerNickname(id) -- вычисление ника по айди

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