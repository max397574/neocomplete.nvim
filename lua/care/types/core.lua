--- This module is for the core of care. Here everything comes together with the
--- most important things being the menu being opened and the completion triggered.
---@class care.core
--- Use this function to create a new instance. It takes no arguments and should be
--- called only once when the plugin is first set up.
---@field new fun(): care.core
--- This function starts the completion. It goes through all the sources, triggers
--- them (completion and sorting) and opens the menu with the result.
--- You can also add an optional filter to only complete certain sources.
---@field complete fun(self: care.core, reason: care.completionReason?, source_filter?: fun(name: string): boolean): nil
--- This function is invoked on every text change (by default, see
--- `completion_events` in config). It updates the context field and triggers
--- completion if the context changed.
---@field on_change fun(self: care.core): nil
--- The `block` method can be used to temporarily disable care. It returns a
--- function which is used to unblock it again. This is used for the `insert`
--- selection behavior where you don't want to get new completions when changing the
--- text.
---@field block fun(self: care.core): fun(): nil
--- The setup function is used to setup care so it will actually provide
--- autocompletion when typing by setting up an autocommand with the
--- `completion_events` from the configuration.
---@field setup fun(self: care.core): nil
--- Filter currently visible menu. This is used when moving the cursor.
---@field filter fun(self: care.core): nil
--- This is used to store the current context. There is always a new one created in
--- `on_change` and compared to see if it changed.
---@field context care.context
--- In this field a menu instance which is used in core is stored.
---@field menu care.menu
--- This field is used by the [block()](#block) method. It just completely disables
--- autocompletion when set to true.
---@field blocked boolean
--- This variable is used to determine where a new completion window was opened for
--- the last time. This is used to determine when to reopen the completion window.
---@field last_opened_at integer
--- Boolean to indicate if care is currently completing. This is used to avoid
--- completing and sorting on the same keystroke.
---@field completing boolean
