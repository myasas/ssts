<%@page import="model.StutteredSpeech"%>
<%@page import="dao.StutteredSpeechDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Activity"%>
<%@page import="util.RandomIndexGenerator"%>
<%@page import="dao.ActivityDAO"%>
<%@page import="configuration.StaticPanels"%>
<%@page import="configuration.StaticReferences"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.StutteredSpeechController"%>    
<%@page import="model.UPHistory"%>
<%@ page import ="dao.UPHistoryDAO" %>
    
<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else {

%>    
    
<html>
<head>

<!-- Test -->
  <link rel="stylesheet" type="text/css" href="/css/result-light.css">
  <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/css/foundation.min.css">
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/js/foundation.min.js"></script><meta class="foundation-data-attribute-namespace"><meta class="foundation-mq-xxlarge"><meta class="foundation-mq-xlarge"><meta class="foundation-mq-large"><meta class="foundation-mq-medium"><meta class="foundation-mq-small"><style></style>
  <style type="text/css">
    @media only screen and (max-width: 40em) {
    .title-area {
    }
    .name {
    }
    .name img {
            height:35px;
            margin-top:5px;
            margin-left:5px;
    }
}
.name img {
    margin-left:20px;
    
}
  </style>

<script type="text/javascript">//<![CDATA[
$(window).load(function(){
$(document).foundation();
});//]]> 
</script>
<meta class="foundation-mq-topbar">
<!-- Test -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
    
  <script type="text/javascript">//<![CDATA[
function myAnalyzer(){  

var canvasCtx = document.getElementById('canvas').getContext('2d');
var bufferSize = 4096;
var audioContext;

try {
    window.AudioContext = window.AudioContext || window.webkitAudioContext;
    audioContext = new AudioContext();
} catch (e) {
    alert('Web Audio API is not supported in this browser');
}

// Check if there is microphone input.
try {
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia ||     navigator.mozGetUserMedia || navigator.msGetUserMedia;
    var hasMicrophoneInput = (navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);
} catch (e) {
    alert("getUserMedia() is not supported in your browser");
}

// Create analyser node.
var analyser = audioContext.createAnalyser();

analyser.fftsize = 512;
analyser.smoothingTimeConstant = 0.9;
var bufferLength = analyser.frequencyBinCount;
var dataArray = new Uint8Array(bufferLength);

var errorCallback = function (e) {
    alert("Please provide sufficient permission to access microphone. Error in getUserMedia: " + e);
};

// Get access to the microphone and start pumping data through the  graph.
navigator.getUserMedia({
    audio: true
}, function (stream) {
    // microphone -&gt; myPCMProcessingNode -&gt; destination.
    var microphone = audioContext.createMediaStreamSource(stream);
    microphone.connect(analyser);
    analyser.connect(audioContext.destination);
    //microphone.start(0);
}, errorCallback);

// draw an oscilloscope of the current audio source

function draw() {

    drawVisual = requestAnimationFrame(draw);

    analyser.getByteFrequencyData(dataArray);

    canvasCtx.fillStyle = 'rgb(200, 200, 200)';
    var WIDTH = 500;
    var HEIGHT = 256;
    canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);

    for (var i = 0; i < dataArray.length; i++) {
      barHeight = HEIGHT - dataArray[i];
      canvasCtx.fillRect(i * 2, barHeight, 1, dataArray[i]);
      // It is a bad idea to update an element in this loop:
      // However, if I do, the following line always gives 0, which seems like a bug.
      document.getElementById("arrayIndex").innerHTML = dataArray[i];
      // This line works though.
      document.getElementById("arrayIndex").innerHTML = dataArray[50];
    }
};

draw();
}//]]> 
</script>
<!-- Script - Speech Graph with DAF -->

<!-- Script - Diff Text Setting -->
<script>
function setdifftexttodb(){
	
var difftext = document.getElementById('diffid').innerHTML;

document.getElementById('addresultsdb').value = difftext;

	}
</script>
<!-- Script - Diff Text Setting -->

<!-- Script* clicks the hidden save button after a delay -->

<script type="text/javascript">
    function delayedclickadduph(delayms) {
        console.log("clicked...waiting...");

        setTimeout(
            function() {
//                 alert("Called after delay.");
                document.getElementById('addresultsbutton').click();
            },
            delayms);
    }
    
</script>

<title>Smart Speech Therapist</title>		
</head>
<body>


	<div data-role="page" id="page-1" data-theme="a">
<!-- Left panel -->	
<%=StaticPanels.homePanelMember %>

<!-- Top bar -->	
		<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
  <ul class="title-area">
    <li class="name">
    <a href="#panel-userhome" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
        <a href="#"><img src="img/ssts_logo_150px.png" ></a>
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
  </ul>
  
<section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
      <li class="active"><a href="#"><%=session.getAttribute(StaticReferences.ssnUserlogindisplay)%></a></li>
      <li class="has-dropdown not-click">
        <a href="#">Account</a>
        <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
          <li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>
        </ul>
      </li>
    </ul>
  </section></nav>
		</div>	
		
<% 	
	

	ActivityDAO activityDao = new ActivityDAO();
	Activity activity = new Activity();
	RandomIndexGenerator rig = new RandomIndexGenerator();
	
	activity = activityDao.getMinMaxIDs();
	int randomIndexNumber = rig.generateRandomIndex(activity.getMinID(), activity.getMaxID());
	String randomIndexNumberString = String.valueOf(randomIndexNumber);
	
	activity.setActID(randomIndexNumberString);
	
// 	ActivityDAO getActDao = new ActivityDAO();	
	activity = activityDao.getActivityBySettingValues(activity);
	
	String actSession=activity.getActSession();
	session.setAttribute(StaticReferences.ssnActivityID, randomIndexNumber); 
	
%>		

<!-- White Paragraph  -->					
		<div data-role="content">		
		<form >		

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Smart Therapy</h4>		
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p><em>(This exercise is DAF enabled. It is advised to choose a calm environment or to wearing headsets while performing this exercise.)</em></p>
		<p><strong>Please click the black color button and read out following paragraph loud and slow :</strong></p>
<script type="text/javascript">//<![CDATA[
window.onload=function(){
var traindata = [
    "'Til Lies Do Us Part", 
    "Twinkle twinkle little star",
    "How I wonder what you are",
    "Up above the world so high",
    "Like a diamond in the sky",
    "When the glorious sun is set",
    "When the grass with dew is wet",
    "Then you show your little light",
    "Twinkle twinkle all the night",
    "In the dark-blue sky you keep",
    "And often through my curtains peep",
    "For you never shut your eye",
    "Till the sun is in the sky",
    "As your bright and tiny spark",
    "Guides the traveller in the dark",
    "Though I know not what you are",
    "Twinkle twinkle little star",
    "The year’s at the spring",
    "The day’s at the morn",
    "Morning’s at seven",
    "The hillside’s dew pearled",
    "The lark’s on the wing",
    "The snail’s on the thorn",
    "God’s in His heaven",
    "All’s right with the world",
    "Thirty days hath September",
    "April June and November",
    "February has twenty-eight alone",
    "All the rest have thirty-one",
    "Excepting leap-yearthat’s the time",
    "When February’s days are twenty-nine",
    "There was never a Queen like Balkis",
    "From here to the wide world’s end",
    "But Balkis talked to a butterfly",
    "As you would talk to a friend",
    "There was never a King like Solomon",
    "Not since the world began",
    "But Solomon talked to a butterfly",
    "As a man would talk to a man",
    "She was Queen of Sabaea",
    "And he was Asia’s Lord",
    "But they both of ’em talked to butterflies",
    "When they took their walks abroad",
    "I have a little shadow that goes in and out with me",
    "And what can be the use of him is more than I can see",
    "He is very very like me from the heels up to the head",
    "And I see him jump before me when I jump into my bed",
    "The funniest thing about him is the way he likes to grow",
    "Not at all like proper children which is always very slow",
    "For he sometimes shoots up taller like an india-rubber ball",
    "And he sometimes gets so little that there’s none of him at all",
    "He hasn’t got a notion of how children ought to play",
    "And can only make a fool of me in every sort of way",
    "He stays so close beside me he’s a coward you can see",
    "I’d think shame to stick to nursie as that shadow sticks to me",
    "One morning very early before the sun was up",
    "I rose and found the shining dew on every buttercup",
    "But my lazy little shadow like an arrant sleepy-head",
    "Had stayed at home behind me and was fast asleep in bed",
    "Little White Lily",
    "Sat by a stone",
    "Drooping and waiting",
    "Till the sun shone",
    "Little White Lily",
    "Sunshine has fed",
    "Little White Lily",
    "Is lifting her head",
    "Little White Lily",
    "Said It is good",
    "Little White Lily’s",
    "Clothing and food",
    "Little White Lily",
    "Dressed like a bride",
    "Shining with whiteness",
    "And crownèd beside",
    "Little White Lily",
    "Drooping with pain",
    "Waiting and waiting",
    "For the wet rain",
    "Little White Lily",
    "Holdeth her cup",
    "Rain is fast falling",
    "And filling it up",
    "Little White Lily",
    "Said Good again",
    "When I am thirsty",
    "To have the nice rain",
    "Now I am stronger",
    "Now I am cool",
    "Heat cannot burn me",
    "My veins are so full",
    "Little White Lily",
    "Smells very sweet",
    "On her head sunshine",
    "Rain at her feet",
    "Thanks to the sunshine",
    "Thanks to the rain",
    "Little White Lily",
    "Is happy again",
    "I’ll tell you how the leaves came down",
    "The great Tree to his children said",
    "You’re getting sleepy Yellow and Brown",
    "Yes very sleepy little Red",
    "It is quite time to go to bed",
    "Ah begged each silly pouting leaf",
    "Let us a little longer stay",
    "Dear Father Tree behold our grief",
    "’Tis such a very pleasant day",
    "We do not want to go away",
    "So for just one more merry day",
    "To the great Tree the leaflets clung",
    "Frolicked and danced and had their way",
    "Upon the autumn breezes swung",
    "Whispering all their sports among",
    "Perhaps the great Tree will forget",
    "And let us stay until the spring",
    "If we all beg and coax and fret",
    "But the great Tree did no such thing",
    "He smiled to hear their whispering",
    "Come children all to bed he cried",
    "And ere the leaves could urge their prayer",
    "He shook his head and far and wide",
    "Fluttering and rustling everywhere",
    "Down sped the leaflets through the air",
    "I saw them on the ground they lay",
    "Golden and red a huddled swarm",
    "Waiting till one from far away",
    "White bedclothes heaped upon her arm",
    "Should come to wrap them safe and warm",
    "The great bare Tree looked down and smiled",
    "Good-night dear little leaves he said",
    "And from below each sleepy child",
    "Replied Good-night and murmured",
    "It is so nice to go to bed",
    "Wee Willie Winkie rins through the town",
    "Up-stairs and doon-stairs in his nicht-gown",
    "Tirlin’ at the window cryin’ at the lock",
    "Are the weans in their bed?for it’s now ten o’clock",
    "Hey Willie Winkie are ye comin’ ben?",
    "The cat’s singin’ gay thrums to the sleepin’ hen",
    "The doug’s speldered on the floor and disna gie a cheep",
    "But here’s a waukrife laddie that winna fa’ asleep",
    "Onything but sleep ye rogue glow’rin’ like the moon",
    "Rattlin’ in an airn jug wi’ an airn spoon",
    "Rumblin’ tumblin’ roun’ about crowin’ like a cock",
    "Skirlin’ like a kenna-what wauknin’ sleepin’ folk",
    "Hey Willie Winkie the wean’s in a creel",
    "Waumblin’ aff a body’s knee like a vera eel",
    "Ruggin’ at the cat’s lug and ravellin’ a’ her thrums",
    "Hey Willie WinkieSee there he comes",
    "Wearie is the mither that has a storie wean",
    "A wee stumpie stoussie that canna rin his lane",
    "That has a battle aye wi’ sleep before he’ll close an ee",
    "But a kiss frae aff his rosy lips gies strength anew to me",
    "The Owl and the Pussy-Cat went to sea",
    "In a beautiful pea-green boat",
    "They took some honey and plenty of money",
    "Wrapped up in a five-pound note",
    "The Owl looked up to the moon above",
    "And sang to a small guitar",
    "O lovely Pussy O Pussy my love",
    "What a beautiful Pussy you are",
    "You are",
    "What a beautiful Pussy you are",
    "Pussy said to the Owl You elegant fowl",
    "How wonderful sweet you sing",
    "Oh let us be marriedtoo long we have tarried",
    "But what shall we do for a ring?",
    "They sailed away for a year and a day",
    "To the land where the Bong-tree grows",
    "And there in a wood a piggy-wig stood",
    "With a ring in the end of his nose",
    "His nose",
    "With a ring in the end of his nose",
    "Dear Pig are you willing to sell for one shilling",
    "Your ring? Said the piggy I will",
    "So they took it away and were married next day",
    "By the turkey who lives on the hill",
    "They dined upon mince and slices of quince",
    "Which they ate with a runcible spoon",
    "And hand in hand on the edge of the sand",
    "They danced by the light of the moon—",
    "The moon",
    "They danced by the light of the moon",
    "Wynken Blynken and Nod one night",
    "Sailed off in a wooden shoe—",
    "Sailed on a river of crystal light",
    "Into a sea of dew",
    "Where are you going and what do you wish?",
    "The old moon asked the three",
    "We have come to fish for the herring-fish",
    "That live in this beautiful sea",
    "Nets of silver and gold have we",
    "Said Wynken",
    "Blynken",
    "And Nod",
    "The old moon laughed and sang a song",
    "As they rocked in the wooden shoe",
    "And the wind that sped them all night long",
    "Ruffled the waves of dew",
    "The little stars were the herring-fish",
    "That lived in the beautiful sea",
    "Now cast your nets wherever you wish—",
    "Never afeard are we",
    "So cried the stars to the fishermen three",
    "Wynken",
    "Blynken",
    "And Nod",
    "All night long their nets they threw",
    "To the stars in the twinkling foam—",
    "Then down from the skies came the wooden shoe",
    "Bringing the fishermen home",
    "Twas all so pretty a sail it seemed",
    "As if it could not be",
    "And some folk thought ’twas a dream they’d dreamed",
    "Of sailing that beautiful sea",
    "But I shall name you the fishermen three",
    "Wynken",
    "Blynken",
    "And Nod",
    "Wynken and Blynken are two little eyes",
    "And Nod is a little head",
    "And the wooden shoe that sailed the skies",
    "Is a wee one’s trundle-bed",
    "So shut your eyes while Mother sings",
    "Of wonderful sights that be",
    "And you shall see the beautiful things",
    "As you rock on the misty sea",
    "Where the old shoe rocked the fishermen three—",
    "Wynken",
    "Blynken",
    "And Nod",
    "The gingham dog and the calico cat",
    "Side by side on the table sat",
    "’Twas half-past twelve and what do you think",
    "Nor one nor t’other had slept a wink",
    "The old Dutch clock and the Chinese plate",
    "Appeared to know as sure as fate",
    "There was going to be a terrible spat",
    "I wasn’t there I simply state",
    "What was told to me by the Chinese plate",
    "The gingham dog went bow-wow-wow",
    "And the calico cat replied mee-ow",
    "The air was littered an hour or so",
    "With bits of gingham and calico",
    "While the old Dutch clock in the chimney-place",
    "Up with its hands before its face",
    "For it always dreaded a family row",
    "Now mind I’m only telling you",
    "What the old Dutch clock declares is true",
    "The Chinese plate looked very blue",
    "And wailed Oh dear what shall we do",
    "But the gingham dog and the calico cat",
    "Wallowed this way and tumbled that",
    "Employing every tooth and claw",
    "In the awfullest way you ever saw—",
    "And oh how the gingham and calico flew",
    "Don’t fancy I exaggerate",
    "I got my views from the Chinese plate",
    "Next morning where the two had sat",
    "They found no trace of the dog or cat",
    "And some folks think unto this day",
    "That burglars stole the pair away",
    "But the truth about the cat and the pup",
    "Is this They ate each other up",
    "Now what do you really think of that",
    "The old Dutch clock it told me so",
    "And that is how I came to know",
    "Once there was a little boy",
    "With curly hair and pleasant eye—",
    "A boy who always told the truth",
    "And never never told a lie",
    "And when he trotted off to school",
    "The children all about would cry",
    "There goes the curly-headed boy—",
    "The boy that never tells a lie",
    "And everybody loved him so",
    "Because he always told the truth",
    "That every day as he grew up",
    "’Twas said There goes the honest youth",
    "And when the people that stood near",
    "Would turn to ask the reason why",
    "The answer would be always this",
    "Because he never tells a lie",
    "Whatever brawls disturb the street",
    "There should be peace at home",
    "Where sisters dwell and brothers meet",
    "Quarrels should never come",
    "Birds in their little nests agree",
    "And ’tis a shameful sight",
    "When children of one family",
    "Fall out and chide and fight",
    "Oh where and oh where is your Highland laddie gone?",
    "He’s gone to fight the French for King George upon the throne",
    "And it’s oh in my heart how I wish him safe at home",
    "Oh where and oh where does your Highland laddie dwell?",
    "He dwells in merry Scotland at the sign of the Bluebell",
    "And it’s oh in my heart that I love my laddie well",
    "If I had but two little wings",
    "And were a little feathery bird",
    "To you I’d fly my dear",
    "But thoughts like these are idle things",
    "And I stay here",
    "But in my sleep to you I fly",
    "I’m always with you in my sleep",
    "The world is all one’s own",
    "And then one wakes and where am I?",
    "All all alone",
    "My fairest child I have no song to give you",
    "No lark could pipe to skies so dull and gray",
    "Yet ere we part one lesson I can leave you",
    "For every day",
    "Be good sweet maid and let who will be clever",
    "Do noble things not dream them all day long",
    "And so make life death and that vast forever",
    "One grand sweet song",
    "The boy stood on the burning deck",
    "Whence all but him had fled",
    "The flame that lit the battle’s wreck",
    "Shone round him o’er the dead",
    "Yet beautiful and bright he stood",
    "As born to rule the storm",
    "A creature of heroic blood",
    "A proud though childlike form",
    "The flames rolled on he would not go",
    "Without his father’s word",
    "That father faint in death below",
    "His voice no longer heard",
    "He called aloud Say father say",
    "If yet my task is done?",
    "He knew not that the chieftain lay",
    "Unconscious of his son",
    "Speak father once again he cried",
    "If I may yet be gone",
    "And but the booming shots replied",
    "And fast the flames rolled on",
    "Upon his brow he felt their breath",
    "And in his waving hair",
    "And looked from that lone post of death",
    "In still yet brave despair",
    "And shouted but once more aloud",
    "My father must I stay?",
    "While o’er him fast through sail and shroud",
    "The wreathing fires made way",
    "They wrapt the ship in splendour wild",
    "They caught the flag on high",
    "And streamed above the gallant child",
    "Like banners in the sky",
    "Then came a burst of thunder sound",
    "The boy oh where was he?",
    "Ask of the winds that far around",
    "With fragments strew the sea",
    "With mast and helm and pennon fair",
    "That well had borne their part",
    "But the noblest thing that perished there",
    "Was that young faithful heart",
    "We were crowded in the cabin",
    "Not a soul would dare to sleep",
    "It was midnight on the waters",
    "And a storm was on the deep",
    "Tis a fearful thing in winter",
    "To be shattered by the blast",
    "And to hear the rattling trumpet",
    "Thunder Cut away the mast",
    "So we shuddered there in silence",
    "For the stoutest held his breath",
    "While the hungry sea was roaring",
    "And the breakers talked with Death",
    "As thus we sat in darkness",
    "Each one busy with his prayers",
    "We are lost the captain shouted",
    "As he staggered down the stairs",
    "But his little daughter whispered",
    "As she took his icy hand",
    "Isn’t God upon the ocean",
    "Just the same as on the land?",
    "Then we kissed the little maiden",
    "And we spoke in better cheer",
    "And we anchored safe in harbour",
    "When the morn was shining clear",
    "Under a spreading chestnut-tree",
    "The village smithy stands",
    "The smith a mighty man is he",
    "With large and sinewy hands",
    "And the muscles of his brawny arms",
    "Are strong as iron bands",
    "His hair is crisp and black and long",
    "His face is like the tan",
    "His brow is wet with honest sweat",
    "He earns whate’er he can",
    "And looks the whole world in the face",
    "For he owes not any man",
    "Week in week out from morn till night",
    "You can hear his bellows blow",
    "You can hear him swing his heavy sledge",
    "With measured beat and slow",
    "Like a sexton ringing the village bell",
    "When the evening sun is low",
    "And children coming home from school",
    "Look in at the open door",
    "They love to see the flaming forge",
    "And hear the bellows roar",
    "And catch the burning sparks that fly",
    "Like chaff from a threshing-floor",
    "He goes on Sunday to the church",
    "And sits among his boys",
    "He hears the parson pray and preach",
    "He hears his daughter’s voice",
    "Singing in the village choir",
    "And it makes his heart rejoice",
    "It sounds to him like her mother’s voice",
    "Singing in Paradise",
    "He needs must think of her once more",
    "How in the grave she lies",
    "And with his hard rough hand he wipes",
    "A tear out of his eyes",
    "Toiling—rejoicing—sorrowing",
    "Onward through life he goes",
    "Each morning sees some task begin",
    "Each evening sees it close",
    "Something attempted something done",
    "Has earned a night’s repose",
    "Thanks thanks to thee my worthy friend",
    "For the lesson thou hast taught",
    "Thus at the flaming forge of life",
    "Our fortunes must be wrought",
    "Thus on its sounding anvil shaped",
    "Each burning deed and thought",
    "Sweet and low sweet and low",
    "Wind of the western sea",
    "Low low breathe and blow",
    "Wind of the western sea",
    "Over the rolling waters go",
    "Come from the dropping moon and blow",
    "Blow him again to me",
    "While my little one while my pretty one sleeps",
    "Sleep and rest sleep and rest",
    "Father will come to thee soon",
    "Rest rest on mother’s breast",
    "Father will come to thee soon",
    "Father will come to his babe in the nest",
    "Silver sails all out of the west",
    "Under the silver moon",
    "Sleep my little one sleep my pretty one sleep",
    "Down in a green and shady bed",
    "A modest violet grew",
    "Its stalk was bent it hung its head",
    "As if to hide from view",
    "And yet it was a lovely flower",
    "No colours bright and fair",
    "It might have graced a rosy bower",
    "Instead of hiding there",
    "Yet there it was content to bloom",
    "In modest tints arrayed",
    "And there diffused its sweet perfume",
    "Within the silent shade",
    "Then let me to the valley go",
    "This pretty flower to see",
    "That I may also learn to grow",
    "In sweet humility",
    "My heart leaps up when I behold",
    "A rainbow in the sky",
    "So was it when my life began",
    "So is it now I am a man",
    "So be it when I shall grow old",
    "Or let me die",
    "The child is father of the man",
    "And I could wish my days to be",
    "Bound each to each by natural piety",
    "Not a creature was stirring not even a mouse",
    "The stockings were hung by the chimney with care",
    "In hopes that St Nicholas soon would be there",
    "The children were nestled all snug in their beds",
    "While visions of sugar-plums danced in their heads",
    "And mamma in her ’kerchief and I in my cap",
    "Had just settled our brains for a long winter’s nap",
    "When out on the lawn there arose such a clatter",
    "I sprang from the bed to see what was the matter",
    "Away to the window I flew like a flash",
    "Tore open the shutters and threw up the sash",
    "The moon on the breast of the new-fallen snow",
    "Gave the luster of mid-day to objects below",
    "When what to my wondering eyes should appear",
    "But a miniature sleigh and eight tiny reindeer",
    "With a little old driver so lively and quick",
    "I knew in a moment it must be St Nick",
    "More rapid than eagles his coursers they came",
    "And he whistled and shouted and called them by name",
    "Now Dasher now Dancer now Prancer and Vixen",
    "On Comet on Cupid on Donder and Blitzen",
    "To the top of the porch to the top of the wall",
    "Now dash away dash away dash away all",
    "As dry leaves that before the wild hurricane fly",
    "When they meet with an obstacle mount to the sky",
    "So up to the house-top the coursers they flew",
    "With the sleigh full of toys and St Nicholas too",
    "And then in a twinkling I heard on the roof",
    "The prancing and pawing of each little hoof",
    "As I drew in my head and was turning around",
    "Down the chimney St Nicholas came with a bound",
    "He was dressed all in fur from his head to his foot",
    "And his clothes were all tarnished with ashes and soot",
    "A bundle of toys he had flung on his back",
    "And he looked like a peddler just opening his pack",
    "His eyes—how they twinkled his dimples how merry",
    "His cheeks were like roses his nose like a cherry",
    "His droll little mouth was drawn up like a bow",
    "And the beard of his chin was as white as the snow",
    "The stump of a pipe he held tight in his teeth",
    "And the smoke it encircled his head like a wreath",
    "He had a broad face and a little round belly",
    "That shook when he laughed like a bowlful of jelly",
    "He was chubby and plump a right jolly old elf",
    "And I laughed when I saw him in spite of myself",
    "A wink of his eye and a twist of his head",
    "Soon gave me to know I had nothing to dread",
    "He spoke not a word but went straight to his work",
    "And filled all the stockings then turned with a jerk",
    "And laying his finger aside of his nose",
    "And giving a nod up the chimney he rose",
    "He sprang to his sleigh to his team gave a whistle",
    "And away they all flew like the down on a thistle",
    "But I heard him exclaim ere he drove out of sight",
    "O say can you see by the dawn’s early light",
    "What so proudly we hailed at the twilight’s last",
    "And the rocket’s red glare the bombs bursting in air",
    "Gave proof through the night that our flag was still there",
    "O say does that star-spangled banner yet wave",
    "O’er the land of the free and the home of the brave?",
    "On that shore dimly seen through the mists of the deep",
    "Where the foe’s haughty host in dread silence reposes",
    "What is that which the breeze o’er the towering steep",
    "As it fitfully blows now conceals now discloses?",
    "Now it catches the gleam of the morning’s first beam",
    "In full glory reflected now shines on the stream",
    "Tis the star-spangled banner O long may it wave",
    "O’er the land of the free and the home of the brave",
    "And where is that band who so vauntingly swore",
    "That the havoc of war and the battle’s confusion",
    "A home and a country should leave us no more?",
    "Their blood has washed out their foul footsteps’",
    "No refuge could save the hireling and slave",
    "From the terror of flight or the gloom of the grave",
    "And the star-spangled banner in triumph doth wave",
    "O’er the land of the free and the home of the brave",
    "O thus be it ever when freemen shall stand",
    "Between their loved homes and the war’s desolation",
    "Blest with victory and peace may the heav’n-rescued land",
    "Praise the power that hath made and preserved us a nation",
    "Then conquer we must for our cause it is just",
    "And this be our motto—In God is our trust",
    "And the star spangled banner in triumph shall wave",
    "O’er the land of the free and the home of the brave",
    "You are old Father William the young man said",
    "And your hair has become very white",
    "And yet you incessantly stand on your head—",
    "Do you think at your age it is right?",
    "A nightingale that all day long",
    "Had cheered the village with his song",
    "Nor yet at eve his note suspended",
    "Nor yet when eventide was ended",
    "Began to feel as well he might",
    "The keen demands of appetite",
    "When looking eagerly around",
    "He spied far off upon the ground",
    "A something shining in the dark",
    "And knew the glow-worm by his spark",
    "So stooping down from hawthorn top",
    "He thought to put him in his crop",
    "The worm aware of his intent",
    "Harangued him thus right eloquent",
    "Did you admire my lamp quoth he",
    "As much as I your minstrelsy",
    "You would abhor to do me wrong",
    "As much as I to spoil your song",
    "For ’twas the self-same power divine",
    "Taught you to sing and me to shine",
    "That you with music I with light",
    "Might beautify and cheer the night",
    "The songster heard his short oration",
    "And warbling out his approbation",
    "Released him as my story tells",
    "And found a supper somewhere else",    
     "You've Got Mail"
];

var terminals = {};
var startwords = [];
var wordstats = {};

for (var i = 0; i < traindata.length; i++) {
    var words = traindata[i].split(' ');
    terminals[words[words.length-1]] = true;
    startwords.push(words[0]);
    for (var j = 0; j < words.length - 1; j++) {
        if (wordstats.hasOwnProperty(words[j])) {
            wordstats[words[j]].push(words[j+1]);
        } else {
            wordstats[words[j]] = [words[j+1]];
        }
    }
}

var choice = function (a) {
    var i = Math.floor(a.length * Math.random());
    return a[i];
};

var make_sentence = function (min_length) {
    phrase = choice(startwords);
    var autogensentence = [phrase];
    while (wordstats.hasOwnProperty(phrase)) {
        var next_words = wordstats[phrase];
        phrase = choice(next_words);
        autogensentence.push(phrase);
        if (autogensentence.length > min_length && terminals.hasOwnProperty(phrase)) break;
    }
    if (autogensentence.length < min_length) return make_sentence(min_length);
    return autogensentence.join(' ');
};

$('#generate').on('click', function () {
    var autogensentence = make_sentence(3 + Math.floor(3 * Math.random()));
    $('#generated_title').html(autogensentence);
});
}//]]> 

</script>
			<textarea id="generated_title" rows="4" cols="50" name="paratoread" readonly><%=actSession %></textarea>
			<input type="button" id="generate" value="Generate New Sentence !" />			
			<br>
			<table border="0">
            <tr>
				<th>Voice Frequency:</th>
				<th id="arrayIndex">0</th>
            </tr>			
			</table>
<!-- 			<p>Frequency:</p> -->
<!-- 			<p id="arrayIndex">0</p> -->
			<p><ins><strong>Graph:</strong></ins></p>
			<canvas id="canvas" width="500" height="220"></canvas>
			
<div class="si-wrapper">						
	<p><ins><strong>Speech Output :</strong></ins></p>
	<textarea name=speechoutput rows="4" cols="50" class="si-input" placeholder="Please read the text" ></textarea>

<a href="" class="si-btn ui-btn ui-icon-grid ui-btn-icon-left ui-corner-all ui-btn-b" onclick="myAnalyzer();"><span class="si-mic"></span> <span class="si-holder"></span></a>
</div>		
	
		<input type="Submit" value="Finished !" onclick="location.href='redirect.jsp'" />
</div>
		
		</form>
<script src="js/speech-input.js"></script>		
		</div>		
		
<%
String spIn = request.getParameter("paratoread");
String spOut = request.getParameter("speechoutput");

if (spOut == null) {
// myText is null when the page is first requested, 
// so do nothing
} else { 
if (spOut.length() == 0) {
// There was a querystring like ?myText=
// but no text, so myText is not null, but 
// a zero length string instead.
session.setAttribute(StaticReferences.ssnRedirectPage, "speechagl.jsp#dialog-nospeechinput");
response.sendRedirect("redirect.jsp");%>   
<% } else { 
   session.setAttribute(StaticReferences.ssnRedirectPage, "speechagl.jsp#page-2"); 
   session.setAttribute("spout", spOut); 
   session.setAttribute("spin", spIn);    
   response.setHeader("refresh", "1");
   response.sendRedirect("redirect.jsp");   

}
}
%>	
		
		<div data-role="footer" data-theme="b">
			<h4>-</h4>
		</div>
	</div>		



<div data-role="page" id="page-2" data-theme="a">
<!-- Left panel -->	
<%=StaticPanels.homePanelMember %>

<!-- Top bar -->	
		<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
  <ul class="title-area">
    <li class="name">
    <a href="#panel-userhome" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
        <a href="#"><img src="img/ssts_logo_150px.png" ></a>
    </li>
     <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
    <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
  </ul>
  
<section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
      <li class="active"><a href="#"><%=session.getAttribute(StaticReferences.ssnUserlogindisplay)%></a></li>
      <li class="has-dropdown not-click">
        <a href="#">Account</a>
        <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
          <li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>
        </ul>
      </li>
    </ul>
  </section></nav>
		</div>	

<!-- White Paragraph  -->					
		<div data-role="content">		


	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Speech Results</h4>		
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
			<p>Following are your results.</p>
		<form >					

		
	<%
	String paraToRead=null;   
	String speechOutput=null;  	
	String html = null;
	String score =null;
	HashMap<String , Integer> repeatedWordsAndCount = new HashMap<String , Integer>();
    if ((session.getAttribute("spout") == null) || (session.getAttribute("spout") == "")) {
	%>
No input is received. If you received this message while refreshing the page, please go back and retry.<br/>

<%} else {
	paraToRead = session.getAttribute("spin").toString().toLowerCase();   
    speechOutput = session.getAttribute("spout").toString().toLowerCase();   

	StutteredSpeechController ssc = new StutteredSpeechController();

	ssc = ssc.analyzeRecognizedVoiceInput(speechOutput);
	ssc.calculateSttuteredWordsAndCount(ssc.getRepeatedWordsArrayOut());

	repeatedWordsAndCount = ssc.calculateSttuteredWordsAndCount(ssc.getRepeatedWordsArrayOut());
	
	//Calculate Score
	int speechOutputLength = ssc.textTotArray(speechOutput).length;
	int totalRepeatedWords = ssc.totalRepeated(repeatedWordsAndCount);
	score = ssc.calculateScore(speechOutputLength, totalRepeatedWords);
	
	//Print HTML output
	html= ssc.hashmapToHtml(repeatedWordsAndCount);
%>	
	<p>Your score(beta) for the lesson is <b><%=score%>%</b>.</p>	
	
<!-- Test2 -->
  <style type="text/css">
    ins {
  background-color: #73c1db;
  text-decoration: none; }
  del {
    background-color: #ffc6c6; }
      table th {
        width: 30%; }
  </style>
<script type="text/javascript" src="http://google-diff-match-patch.googlecode.com/svn/trunk/javascript/diff_match_patch.js"></script>
      <script type="text/javascript" src="https://rawgithub.com/arnab/jQuery.PrettyTextDiff/master/jquery.pretty-text-diff.js"></script>  
<script type="text/javascript">//<![CDATA[
$(window).load(function(){

    $("#wrapper tr").prettyTextDiff({
        cleanup: $("#cleanup").is(":checked")
    });


});//]]> 
</script>	  
<!-- Test2 -->	
 <div id="wrapper">
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th>Original Sentence</th>
                <th>Voiced Sentence</th>
                <th>Result (<ins>Missed</ins> / <del>Not Expected</del>)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="changed"><%= paraToRead %></td>
                <td class="original"><%= speechOutput %></td>                
                <td class="diff" id="diffid"></td>
            </tr>
        </tbody>
    </table>
</div>		
	
	<%if(repeatedWordsAndCount.isEmpty()){
// If no words are repeated - Do not show repeated words lable.
	}else{
	%>
	<p>Following words are repeated,</p>
	<%= html %>
	
	<%
	}
%>


<%	
}	
%>			
		
		</form>
		
		<a href="#" data-role="button" data-rel="back" data-icon="back">Do it again</a>
		<a href="" onclick="setdifftexttodb();delayedclickadduph(1000);" data-role="button" data-icon="action">Submit Results</a>
		
		
		
<!--  html - result add form -->

    	<div data-role="content" hidden="hidden">	
		<form>

		<input name="addresultsdb" id="addresultsdb" type="text" placeholder="Results" value=""/>				

		<input type="submit" id="addresultsbutton" value="Add" onclick="location.href='redirect.jsp'">	
		</form>
		</div>		
		
		<%
		
		String addResultsDb = request.getParameter("addresultsdb");
		String addLessonIdDb = session.getAttribute(StaticReferences.ssnActivityID).toString();
		String addUserIdDb = session.getAttribute(StaticReferences.ssnUserid).toString();
		String lessonTypeDb = "MyTherapy";
		String lessonScoreDb = score;
		
		if (addResultsDb == null) {
			// myText is null when the page is first requested, 
			// so do nothing
		} else { 

		UPHistoryDAO uphDao = new UPHistoryDAO();
		UPHistory uph = new UPHistory();
		
// 		Add user profile history record to the uph table
		uph.setPhUserID(addUserIdDb);
		uph.setPhLessonID(addLessonIdDb);
		uph.setPhLessonType(lessonTypeDb);
		uph.setPhScore(lessonScoreDb);
		uph.setPhResults(addResultsDb);
		uphDao.addUPHistory(uph);
		
// 		Add user stuttered speech record to the stutteredspeech table
		if(!repeatedWordsAndCount.isEmpty()){
			StutteredSpeechDAO stspDao = new StutteredSpeechDAO();
			stspDao.insertStutteredSpeechHashMap(addUserIdDb, repeatedWordsAndCount);
		}
		
		session.setAttribute("uphObj", uph);  
		session.setAttribute(StaticReferences.ssnRedirectPage, "success.jsp"); 
// 		response.setHeader("refresh", "1");
		response.sendRedirect("redirect.jsp");   		
		}
		%>				
		
		
		
		
			</div>
		</div>	
<!-- footer -->
	<div data-role="footer" data-theme="b">
		<h4>-</h4>
	</div>			
			
	</div>





	<div data-role="page" data-dialog="true" id="dialog-nospeechinput" data-theme="b">
		<div data-role="header">
			<h1>No speech input</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Please speak first and then click "Finished!"</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		
	
	<div data-role="page" data-dialog="true" id="dialog-resultssaved" data-theme="b">
		<div data-role="header">
			<h1>Results Saved</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Results saved successfully. Do you want to perform another lesson?"</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>			
	
</body>
</html> 
<%
    }
%>