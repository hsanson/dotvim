return {
  "hsanson/vim-android",
  dev = true,
  config = function()
    local g = vim.g

    g.android_sdk_path='~/Apps/android-sdk'
    g.gradle_daemon=1
    g.gradle_show_signs=0
    g.gradle_loclist_show=0
    g.gradle_sync_on_load=1
    g.netrw_browsex_viewer='google-chrome'

    g.gradle_glyph_error= g.symbol_error
    g.gradle_glyph_warning= g.symbol_warn
    g.gradle_glyph_gradle = g.symbol_gradle
    g.gradle_glyph_android = g.symbol_android
    g.gradle_glyph_building = g.symbol_progress
  end
}
