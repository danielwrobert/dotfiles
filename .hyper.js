// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
	config: {
		// Choose either "stable" for receiving highly polished,
		// or "canary" for less polished but more frequent updates
		updateChannel: 'canary',

		// default font size in pixels for all tabs
		fontSize: 14,

		windowSize: [1080, 720],

		// font family with optional fallbacks
		fontFamily: '"Monaco for Powerline", "Operator Mono", monospace',

		// `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
		cursorShape: 'BLOCK',

		// custom padding (css format, i.e.: `top right bottom left`)
		padding: '10px',

		// for advanced config flags please refer to https://hyper.is/#cfg
	},

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
	  'hyperterm-base-16-ocean',
	  'hypercwd'
	],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  }
};
