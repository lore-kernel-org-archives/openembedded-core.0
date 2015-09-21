Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8753C60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 16:35:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 21 Sep 2015 09:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,568,1437462000"; 
	d="scan'208,217";a="649260687"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.17.236])
	by orsmga003.jf.intel.com with ESMTP; 21 Sep 2015 09:27:05 -0700
Message-ID: <1442852840.3222.1.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>, 
	"Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <174AD7CFE5F468498ACCFE3FEE0EF1EB142C2921@IRSMSX102.ger.corp.intel.com>
References: <6871706.tbebiTIoD4@peggleto-mobl.ger.corp.intel.com>
	<1442565245-16632-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<174AD7CFE5F468498ACCFE3FEE0EF1EB142C089D@IRSMSX102.ger.corp.intel.com>
	<CAJTo0LaMfcabqJ9iLqq61eD=H+bfv4jpB5W=P_KBDZZS-4VK8Q@mail.gmail.com>
	<174AD7CFE5F468498ACCFE3FEE0EF1EB142C2921@IRSMSX102.ger.corp.intel.com>
Organization: Intel Corporation
Date: Mon, 21 Sep 2015 11:27:20 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] selftest/buildoptions: pexpect not a builtin module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Sep 2015 16:35:18 -0000
Content-Type: multipart/alternative; boundary="=-YmWJvZ2G2tW9xdaMQQe4"

--=-YmWJvZ2G2tW9xdaMQQe4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Great! thanks Daniel.
On Mon, 2015-09-21 at 10:49 +0000, Istrate, Daniel AlexandruX wrote:
> Hi Ross,
>  
> I sent the patch: http://lists.openembedded.org/pipermail/openembedde
> d-core/2015-September/110738.html
>  
> --Daniel
>  
> From: Burton, Ross [mailto:ross.burton@intel.com] 
> Sent: Monday, September 21, 2015 13:20
> To: Istrate, Daniel AlexandruX
> Cc: Benjamin Esquivel; openembedded-core@lists.openembedded.org; 
> paul.eggleton@linux.intel.com
> Subject: Re: [OE-core] [PATCH V2] selftest/buildoptions: pexpect not
> a builtin module
>  
>  
> On 21 September 2015 at 09:37, Istrate, Daniel AlexandruX <
> daniel.alexandrux.istrate@intel.com> wrote:
> Just want to point out that 'pexpect' is an unused import in
> buildoptions.py. Unused imports are also unittest and logging.
> Instead of try-catch an import that is not used I think it's best to
> get rid of them.
>  
> Totally agreed.  Can you send a quick patch?
>  
> Ross 

--=-YmWJvZ2G2tW9xdaMQQe4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns:m="http://schemas.microsoft.com/office/2004/12/omml" xmlns="http://www.w3.org/TR/REC-html40"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="Generator" content="Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang="EN-US"><div>Great! thanks Daniel.</div><div><br></div><div>On Mon, 2015-09-21 at 10:49 +0000, Istrate, Daniel AlexandruX wrote:</div><blockquote type="cite">
<div class="WordSection1">
<p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D">Hi Ross,<o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D">I sent the patch:
<a href="http://lists.openembedded.org/pipermail/openembedded-core/2015-September/110738.html">
http://lists.openembedded.org/pipermail/openembedded-core/2015-September/110738.html</a><o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D">--Daniel<o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> Burton, Ross [mailto:ross.burton@intel.com]
<br>
<b>Sent:</b> Monday, September 21, 2015 13:20<br>
<b>To:</b> Istrate, Daniel AlexandruX<br>
<b>Cc:</b> Benjamin Esquivel; openembedded-core@lists.openembedded.org; paul.eggleton@linux.intel.com<br>
<b>Subject:</b> Re: [OE-core] [PATCH V2] selftest/buildoptions: pexpect not a builtin module<o:p></o:p></span></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class="MsoNormal">On 21 September 2015 at 09:37, Istrate, Daniel AlexandruX &lt;<a href="mailto:daniel.alexandrux.istrate@intel.com" target="_blank">daniel.alexandrux.istrate@intel.com</a>&gt; wrote:<o:p></o:p></p>
<blockquote style="border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div id=":4a2">
<p class="MsoNormal">Just want to point out that 'pexpect' is an unused import in buildoptions.py. Unused imports are also unittest and logging.<br>
Instead of try-catch an import that is not used I think it's best to get rid of them.<o:p></o:p></p>
</div>
</blockquote>
<div>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class="MsoNormal">Totally agreed.&nbsp; Can you send a quick patch?<o:p></o:p></p>
</div>
<div>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class="MsoNormal">Ross&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>


</blockquote></body></html>

--=-YmWJvZ2G2tW9xdaMQQe4--
