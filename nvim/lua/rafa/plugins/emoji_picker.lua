local emoji = vim.get_plugin("emoji_picker")
if not emoji then return end

emoji.setup({
  window = {
    width = 25,
    height = 10,
  },
  emoji_list = {
    "😀😃😄😁😆🥹😅😂🤣🥲😊😇",
    "🙂🙃😉😌🥰😍😘😗😙😚😋😛",
    "😝😠😤😭😢🥺😩😫😖😣🙁😕",
    "😟😔😞😒😏🥳🤩🥸😎🤓🧐🤨",
    "🤪😜😡🤬🤯😳🥵🥶😶🌫️😱😨",
    "😰😥😓🤗🤔🫣🤭🫢🫡🤫🫠🤥",
    "😶🫥😐🫤😑🫨😬🙄😯😦😧😮",
    "😲🥱😴🤤😪😮💨😵😵💫🤐🥴",
    "🤢🤮🤧😷🤒🤕🤑🤠😈👿👹👺",
    "🤡💩👻💀👽👾🤖🎃😺😸😼😽",
    "😿😾🫶🤲👐🙌👏🤚✋👇👆👉",
    "🫴🤏🤌🤘🤟🤞🫸🫷🤜🤛✊👊",
    "👎👍🤝🖐️🖖🫱🦾💄🦻👃👣👁️",
    "👀🫀🫁🧠🗣️👤🫂👶🧒👨🧑🦱",
    "👩🦱👨🦱🧑🦰👨🦰👱🧑🦳👩",
    "🦳👨🦳🧑🦲👩🦲👨🦲🧔🧔🧓",
    "👵👴👲👳👳👳🧕👮👮👮👷👷",
    "💂💂🕵️🕵️🧑👨🧑🌾👩🌾🧑🎓",
    "👩🎓👩🎤👨🎤🧑🏫👩🏫👨🏫",
    "👩🏭🧑💼👩💼👨💼🧑🔧👩🔧",
    "🧑🔬🧑🔬👩🔬👨🔬🧑🎨👩🎨",
    "👨🎨🧑🚒👨🚒🧑👩👨👩👨👰",
    "🤵🦸🦸🦹🧙🧙🧝🧌🧛🧟🧟🧜",
    "🧚🫃🧑🍼👩🍼💁💁💁🙅🙆🤦",
    "🤷🙍🙍💇💇💇💆💆💆🧖🧖🧖",
    "🤳⚽🏀🏈🥎🏑🪁🤾🤾🤺🤸🤸",
    "🤸🤼🤼🤼🏋️🏋️🏋️🪂🎿🥌🛷🛼",
    "🛹🎽🤾🏌️🏌️🏊🏊🤽🤽🚣🧗🧗",
    "🪇🎹🎼🎤🎬🎨🎭🤹🎟️🏵️🥈🥇",
    "🏆🚴🥁🪘🎷🪗🎸🪈🎲🧩⌚📱",
    "🖥️🖨️🖱️📼📟💵💸🛢️🧯🕯️🔦💡",
    "🔌🪫🔋📡⏳⌛🕰️⏰⏲️⏱️🧭🎚️🎙️",
    "📺💳💎⚖️🪜🧰🪛🔧🛠️⚙️🧲🪓🦠",
    "🧬🩸💉💊🩺🩹🕳️🔬🔭🪬🧿📿",
    "🔮🏺🪦🚬🛡️🗡️🔪🧫🌡️🧹🧺🚰",
    "🛁🛀🧼🪥🪒🪮🪣🧴🛎️🔑🗝️🚪",
    "🪑🛋️🛏️📧📨📩🧧🪩🎐🏮🪭🎎",
    "🎉🎊🪄🎀🎏🎈🛒🛍️🪟🖼️🪆🧸",
    "🛌💌📥📤📦🏷️🪧📪📫📯📜📃",
    "📊📈📉🗒️🗓️📆📅📇🧮📏📏📐",
    "🖇️📎🔗🧷🔖📖📚📙📘📗📒🗂️",
    "📂📋🗄️🗳️🗃️📌📍🖊️🔓💚🖤🩶"
  },
})
