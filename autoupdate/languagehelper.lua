script_name("LanguageHelper") -- �������� �������
script_author("sunbakes (Hannah Murphy)") -- ����� �������
script_version("1.0") -- ������ �������
script_description[[
{5A90CE}������� ������������ ��������.
]] -- �������� �������

require "lib.moonloader" -- ����������� ����������
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

	sampRegisterChatCommand("langhelp", langhelp_func) -- ����������� �������
	sampRegisterChatCommand("ita", ita_language) -- ����������� �������
	sampRegisterChatCommand("jpn", jpn_language) -- ����������� �������
	sampRegisterChatCommand("rus", rus_language) -- ����������� �������
	sampRegisterChatCommand("de", de_language) -- ����������� �������
	sampRegisterChatCommand("es", es_language) -- ����������� �������
	sampRegisterChatCommand("az", az_language) -- ����������� �������
	sampRegisterChatCommand("fr", fr_language) -- ����������� �������
	sampRegisterChatCommand("ar", ar_language) -- ����������� �������
	sampRegisterChatCommand("hy", hy_language) -- ����������� �������
	sampRegisterChatCommand("zh", zh_language) -- ����������� �������
	sampRegisterChatCommand("eo", eo_language) -- ����������� �������
	sampRegisterChatCommand("langreload", reloadScript) -- ����������� �������

	-- ���� � �������
	sampAddChatMessage("{5A90CE}" .. tag .. " - LangHelper {d5dedd}������� ��������. | {5A90CE}������: {d5dedd}1.0 | {5A90CE}�����: {d5dedd}sunbakes (Hannah Murphy)", main_color)
	sampAddChatMessage("{5A90CE}" .. tag .. " - ��� ��������� ������ �����������: {d5dedd}/langhelp", main_color)
	print("�������� ������ �������.")

	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED) -- ����������� id ������
	nick = sampGetPlayerNickname(id) -- ���������� ���� �� ����

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
	-- ����� � �� ���� ISO:
	-- ����������� [ITA], �������� [JPN], ��������� [ZH], ������� [RUS], �������� [DE], ��������� [ES], ��������������� [AZ], 
	-- ����������� [FR], �������� [AR], ��������� [HY], ��������� [EO]
	-- ��� ������� ������� � ��������� �����
	-- ����� ������ 11
	sampShowDialog(10001, "{5A90CE}���������� - LangHelper", "{5A90CE}�����������: {d5dedd}/ita\n{5A90CE}��������: {d5dedd}/jpn\n{5A90CE}���������: {d5dedd}/zh\n{5A90CE}�������: {d5dedd} /rus\n{5A90CE}��������: {d5dedd}/de\n{5A90CE}���������: {d5dedd}/es\n{5A90CE}���������������: {d5dedd}/az\n{5A90CE}�����������: {d5dedd}/fr\n{5A90CE}��������: {d5dedd}/ar\n{5A90CE}���������: {d5dedd}/hy\n{5A90CE}���������: {d5dedd}/eo\n\n{d5dedd}� ������ ��������� {5A90CE}11 ������.", "�������", "�������", 0)
end

function reloadScript()
	thisScript():reload()
end