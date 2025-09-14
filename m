Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86A0CA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 15:30:49 +0000 (UTC)
Subject: Patch pushed but don't see in the mailing list 
To: openembedded-core@lists.openembedded.org
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.222.203.90)
X-Originating-Platform: Linux Firefox 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 08:30:49 -0700
Message-ID: <7JR7.1757863849293272270.zxTQ@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="BgHLYKU6u2DQQM136A8n"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 15:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223359

--BgHLYKU6u2DQQM136A8n
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team ,

I have pushed an patch in meta-openembedded layer .
But don't see it in mailing list .
Can member please help me where should i look for the patch submitted and w=
hats the status

Thanks ,
Ashish

Below is the console log for the patch submitted:
~/yocto-upstream/layers/meta-openembedded (remove-raw-image) : *git send-em=
ail =C2=A0--to openembedded-devel@lists.openembedded.org =C2=A0 --cc raj.kh=
em@gmail.com =C2=A0 0001-meta-oe-image-optionally-remove-RAW-image-after-sp=
ar.patch*
*0001-meta-oe-image-optionally-remove-RAW-image-after-spar.patch*
(mbox) Adding cc: AshishKumar Mishra <emailaddress.ashish@gmail.com> from l=
ine 'From: AshishKumar Mishra <emailaddress.ashish@gmail.com>'
(body) Adding cc: AshishKumar Mishra <emailaddress.ashish@gmail.com> from l=
ine 'Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>'
From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [PATCH] meta-oe: image: optionally remove RAW image after sparse i=
mage creation
Date: Sun, 14 Sep 2025 20:49:50 +0530
Message-ID: <20250914151950.20216-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
The Cc list above has been expanded by additional
addresses found in the patch commit message. By default
send-email prompts before sending whenever this occurs.
This behavior is controlled by the sendemail.confirm
configuration setting.
For additional information, run 'git send-email --help'.
To retain the current behavior, but squelch this message,
run 'git config --global sendemail.confirm auto'.
Send this email? ([y]es|[n]o|[e]dit|[q]uit|[a]ll): yes
Password for 'smtp://emailaddress.ashish%40gmail.com@smtp.gmail.com:587':
OK. Log says:
Server: smtp.gmail.com
Use of uninitialized value $raw_from in concatenation (.) or string at /usr=
/lib/git-core/git-send-email line 1681.
MAIL FROM:<>
RCPT TO:<openembedded-devel@lists.openembedded.org>
RCPT TO:<raj.khem@gmail.com>
RCPT TO:<emailaddress.ashish@gmail.com>
From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [PATCH] meta-oe: image: optionally remove RAW image after sparse i=
mage creation
Date: Sun, 14 Sep 2025 20:49:50 +0530
Message-ID: <20250914151950.20216-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
*Content-Transfer-Encoding: 8bit*
*Result: 250*

--BgHLYKU6u2DQQM136A8n
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Team ,&nbsp;</div>
<div>&nbsp;</div>
<div>I have pushed an patch in meta-openembedded layer .</div>
<div>But don't see it in mailing list .&nbsp;</div>
<div>Can member please help me where should i look for the patch submitted =
and whats the status&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks ,<br />Ashish&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Below is the console log for the patch submitted:</div>
<div>
<div>&nbsp;~/yocto-upstream/layers/meta-openembedded (remove-raw-image) :<s=
trong> git send-email &nbsp;--to openembedded-devel@lists.openembedded.org =
&nbsp; --cc raj.khem@gmail.com &nbsp; 0001-meta-oe-image-optionally-remove-=
RAW-image-after-spar.patch</strong><br /><strong>0001-meta-oe-image-optiona=
lly-remove-RAW-image-after-spar.patch</strong><br />(mbox) Adding cc: Ashis=
hKumar Mishra &lt;emailaddress.ashish@gmail.com&gt; from line 'From: Ashish=
Kumar Mishra &lt;emailaddress.ashish@gmail.com&gt;'<br />(body) Adding cc: =
AshishKumar Mishra &lt;emailaddress.ashish@gmail.com&gt; from line 'Signed-=
off-by: AshishKumar Mishra &lt;emailaddress.ashish@gmail.com&gt;'</div>
<div>From: AshishKumar Mishra<br />To: openembedded-devel@lists.openembedde=
d.org<br />Cc: raj.khem@gmail.com,<br />&nbsp; &nbsp; AshishKumar Mishra &l=
t;emailaddress.ashish@gmail.com&gt;<br />Subject: [PATCH] meta-oe: image: o=
ptionally remove RAW image after sparse image creation<br />Date: Sun, 14 S=
ep 2025 20:49:50 +0530<br />Message-ID: &lt;20250914151950.20216-1-emailadd=
ress.ashish@gmail.com&gt;<br />X-Mailer: git-send-email 2.43.0<br />MIME-Ve=
rsion: 1.0<br />Content-Transfer-Encoding: 8bit</div>
<div>&nbsp; &nbsp; The Cc list above has been expanded by additional<br />&=
nbsp; &nbsp; addresses found in the patch commit message. By default<br />&=
nbsp; &nbsp; send-email prompts before sending whenever this occurs.<br />&=
nbsp; &nbsp; This behavior is controlled by the sendemail.confirm<br />&nbs=
p; &nbsp; configuration setting.</div>
<div>&nbsp; &nbsp; For additional information, run 'git send-email --help'.=
<br />&nbsp; &nbsp; To retain the current behavior, but squelch this messag=
e,<br />&nbsp; &nbsp; run 'git config --global sendemail.confirm auto'.</di=
v>
<div>Send this email? ([y]es|[n]o|[e]dit|[q]uit|[a]ll): yes<br />Password f=
or 'smtp://emailaddress.ashish%40gmail.com@smtp.gmail.com:587':&nbsp;<br />=
OK. Log says:<br />Server: smtp.gmail.com<br />Use of uninitialized value $=
raw_from in concatenation (.) or string at /usr/lib/git-core/git-send-email=
 line 1681.<br />MAIL FROM:&lt;&gt;<br />RCPT TO:&lt;openembedded-devel@lis=
ts.openembedded.org&gt;<br />RCPT TO:&lt;raj.khem@gmail.com&gt;<br />RCPT T=
O:&lt;emailaddress.ashish@gmail.com&gt;<br />From: AshishKumar Mishra<br />=
To: openembedded-devel@lists.openembedded.org<br />Cc: raj.khem@gmail.com,<=
br />&nbsp; &nbsp; AshishKumar Mishra &lt;emailaddress.ashish@gmail.com&gt;=
<br />Subject: [PATCH] meta-oe: image: optionally remove RAW image after sp=
arse image creation<br />Date: Sun, 14 Sep 2025 20:49:50 +0530<br />Message=
-ID: &lt;20250914151950.20216-1-emailaddress.ashish@gmail.com&gt;<br />X-Ma=
iler: git-send-email 2.43.0<br />MIME-Version: 1.0<br /><strong>Content-Tra=
nsfer-Encoding: 8bit</strong></div>
<div><strong>Result: 250&nbsp;</strong></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>

--BgHLYKU6u2DQQM136A8n--

