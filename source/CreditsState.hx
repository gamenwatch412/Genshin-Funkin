package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];

	private static var creditsStuff:Array<Dynamic> = [ //Name - Icon name - Description - Link - BG Color
		["Genshin Funkin'"],
		['Gamenwatch412',		'gamenwatch412',		"Main Coder & Charter of Genshin Funkin', & cover maker for Celestial Destiny & Endless",		'https://www.youtube.com/channel/UCC0sf7IBgsVKVM9cEpwdfLQ', 0xFF660066],
		['RedFlaim',		'redflaim',		'Creator of Hu-Tao, Chongyun, Xingqiu sprites and Liyue background',		'https://gamebanana.com/members/1873543', 	0xFF4494E6],
		['Kurxmi',	 'kurxmi', 		'Artist for Keqing and Kaeya sprites',		'https://gamebanana.com/members/1837776',		0xFFE01F32],
		['Fenveon',		'fenveon',		'Artist for Venti sprite', 		'https://gamebanana.com/members/1775140', 		0xFFFF9300],
		['Doodle',		'doodle', 		'Artist for Aether sprite, creator credit icons and Inazuma background (Google Draw)', 		'https://discordapp.com/users/772212603857403904/', 		0xFFE6A0A0],
		['Minja',		'minja',		'Storywriter / Tester',		'https://www.youtube.com/channel/UC1bs54iU3nxb1i-MH9H6MSQ', 		0xFF17968E],
		['Rainbow1225',		'rainbow1225', 		'Moral and mental support',		'https://www.youtube.com/channel/UCPk5BmcnOj-zPJlz14_Inog', 		0xFF751911],
		['Washo789',		'washo789',		'Script developer for note camera movement',		'https://gamebanana.com/members/1971029',		0xFF03FCBA],
		['Song Credits'],
		['A Sweet Smile Groove Remix', 		'asweetsmilegroove', 		'Remixed by Miloh Productions',		'https://www.youtube.com/watch?v=UXTBxeWyuU8&t=0s', 		0xFFFFFFFF],
		['Koguchi Monou (English Version)',	 	'koguchimonou',		'Performed by PeachyFranny and Raayo', 'https://www.youtube.com/watch?v=8za2EYuDcjE',		0xFF00FF00],
		['Let the Wind Tell You', 		'letthewindtellyou',		'Performed by花园花玲, 喵☆酱, 宴宁ccccc, and kinsen', 'https://www.youtube.com/watch?v=KrNUrgaOsCc',		0xFF3495EB],
		['Hikaru Nara', 		'hikarunara', 		'Performed by 多多, kinsen, 花玲, 喵酱, 小N, 宴宁, 鹿喑, and 萧翟', 'https://www.youtube.com/watch?v=eF6preXfMHw',		0xFF61536A],
		['Renai Circulation', 		'renaicirculation', 		'Performed by kinsen & 鹿喑kana', 		'https://www.youtube.com/watch?v=1YrI0y1yG_0', 		0xFFF73838],
		['Saikai',		'saikai',		'Performed by kinsen & 鹿喑kana',		'https://www.youtube.com/watch?v=hHoBogOuxhw',		0xFF0066FF],
		['Vigilant Yaksha',		'vigilantyaksha',		'Performed by kinsen',		'https://www.youtube.com/watch?v=Q7x746k_lM0',		0xFFFFFFCC],
		['Bloom of the Wind',	'bloomofthewind',		'VA Singers are displayed on the video',		'https://www.youtube.com/watch?v=GeMIsH3XUuc', 		0xFFD10616],
		["Heaven's Map", 		'heavensmap', 		'Performed by 多多poi and 宴宁ccccc',		'https://www.youtube.com/watch?v=uHW9NMedm8A', 		0xFF6475F3],
		['Soldier, Poet, King', 		'soldierpoetking', 		'Performed by Joe Zieja and Erika Harlacher', 'https://www.youtube.com/watch?v=VTiqVG1qs7M',		0xFFFFBB1B],
		['MarStarBro', 		'marstarbro', 		'Original Composer for Endless (Sonic.exe)',		'https://twitter.com/MarStarBro1', 		0xFF6475F3],
		['Psych Engine Team'],
		['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',					'https://twitter.com/Shadow_Mario_',	0xFFFFDD33],
		['RiverOaken',			'riveroaken',		'Main Artist/Animator of Psych Engine',				'https://twitter.com/river_oaken',		0xFFC30085],
		[''],
		['Engine Contributors'],
		['shubs',				'shubs',			'New Input System Programmer',						'https://twitter.com/yoshubs',			0xFF4494E6],
		['PolybiusProxy',		'polybiusproxy',	'.MP4 Video Loader Extension',						'https://twitter.com/polybiusproxy',	0xFFE01F32],
		['gedehari',			'gedehari',			'Chart Editor\'s Sound Waveform base',				'https://twitter.com/gedehari',			0xFFFF9300],
		['Keoiki',				'keoiki',			'Note Splash Animations',							'https://twitter.com/Keoiki_',			0xFFFFFFFF],
		['SandPlanet',			'sandplanet',		'Mascot\'s Owner\nMain Supporter of the Engine',		'https://twitter.com/SandPlanetNG',		0xFFD10616],
		['bubba',				'bubba',		'Guest Composer for "Hot Dilf"',	'https://www.youtube.com/channel/UCxQTnLmv0OAS63yzk9pVfaw',	0xFF61536A],
		[''],
		["Funkin' Crew"],
		['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",				'https://twitter.com/ninja_muffin99',	0xFFF73838],
		['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",					'https://twitter.com/PhantomArcade3K',	0xFFFFBB1B],
		['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",					'https://twitter.com/evilsk8r',			0xFF53E52C],
		['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",					'https://twitter.com/kawaisprite',		0xFF6475F3]
	];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = creditsStuff[curSelected][4];
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if(controls.ACCEPT) {
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int = creditsStuff[curSelected][4];
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
