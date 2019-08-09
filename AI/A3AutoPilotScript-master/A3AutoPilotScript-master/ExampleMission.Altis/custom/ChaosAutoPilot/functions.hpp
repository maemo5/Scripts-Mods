class ChaosPilot
{
	tag="ChaosPilot";
	class initialise
	{
		file = "custom\ChaosAutoPilot";
		class Init {};

	};
	class dialogs
	{
		file = "custom\ChaosAutoPilot\Dialog";
		class ShowLoiterDialog {};
		class OkLoiterDialog {};
	};
	class loiter
	{
		file = "custom\ChaosAutoPilot\Loiter";
		class CanOnAutoLoiter {};
		class CanOffAutoLoiter {};
		class AutoLoiterOff {};
		class AutoLoiterOn {};
	};
};