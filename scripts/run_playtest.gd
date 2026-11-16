@tool
extends SceneTree

# ==============================================================================
# HEADLESS CLI PLAYTEST RUNNER
# Run via: godot --headless --script res://scripts/run_playtest.gd
# ==============================================================================
func _init() -> void:
	print("🚀 Запуск Автономного Стенда Испытаний ОКБ-1...")
	
	# Parse command line args
	var total_sec: float = 300.0 # Default: 5 minutes of simulated gameplay
	var profile: String = "balanced"
	
	var args = OS.get_cmdline_args()
	for i in range(args.size()):
		var a = args[i]
		if a == "--seconds" and i + 1 < args.size():
			total_sec = float(args[i + 1])
		elif a == "--profile" and i + 1 < args.size():
			profile = args[i + 1]
			
	print("⏱️ Симулируемое время: %.0f сек (%.1f минут)" % [total_sec, total_sec / 60.0])
	print("⚙️ Профиль бота: %s" % profile)
	
	var gm = root.get_node_or_null("GameManager")
	if not gm:
		# Standalone scene tree execution
		print("USER WARNING: GameManager autoload not in tree, waiting for ready...")
		await process_frame
		gm = root.get_node_or_null("GameManager")
		
	if gm:
		var bot = PlaytestBot.new(gm)
		var start_time = Time.get_ticks_msec()
		bot.run_fast_simulation(total_sec, profile, 0.5)
		var duration_ms = Time.get_ticks_msec() - start_time
		
		print("⚡ Симуляция выполнена за: %.2f секунд реального времени!" % (duration_ms / 1000.0))
		var rpt = bot.generate_report()
		print(rpt)
	else:
		printerr("ERROR: GameManager не найден в корне дерева сцен!")
		
	quit()
