Return-Path: <mangodan2003@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6019C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 12:02:06 +0000 (UTC)
Subject: Wiki re submitting patches
To: openembedded-core@lists.openembedded.org
From: mangodan2003@gmail.com
X-Originating-Location: Letchworth Garden City, England, GB (86.16.192.236)
X-Originating-Platform: Linux Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 May 2022 05:01:57 -0700
Message-ID: <6ldv.1652875317100283313.cW0Y@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lAzUlDwMIs56bFaGQc2N"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 12:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165848

--lAzUlDwMIs56bFaGQc2N
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Is this page still relevant?

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

I have just tried to submit a patch via both the email and git methods and =
both fail. Google blocks the script when trying the email method saying it =
is not secure and when trying the git method I get a timeout from the scrip=
t for github, tho I can access github just fine in my browser.

dan@melon ~/workspace_ssd/kas/openembedded-core $./scripts/create-pull-requ=
est -u git@github.com:mangodan2003/openembedded-core.git
NOTE: Assuming remote branch 'gst-1.20.2', use -b to override.
NOTE: Assuming local branch HEAD, use -l to override.
fatal: unable to connect to github.com:
github.com[0: 140.82.121.4]: errno=3DConnection timed out

warn: No match for commit 38b9d17c45c15087d484559595b04c7b61fd8fbb found at=
 git://github.com/mangodan2003/openembedded-core
warn: Are you sure you pushed 'gst-1.20.2' there?
ERROR: git request-pull reported an error

--lAzUlDwMIs56bFaGQc2N
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Is this page still relevant?<br /><br /><a href=3D"https://www.openembedded=
.org/wiki/How_to_submit_a_patch_to_OpenEmbedded" target=3D"_blank" rel=3D"n=
oopener">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmb=
edded</a><br /><br />I have just tried to submit a patch via both the email=
 and git methods and both fail. Google blocks the script when trying the em=
ail method saying it is not secure and when trying the git method I get a t=
imeout from the script for github, tho I can access github just fine in my =
browser.<br /><span style=3D"font-family: monospace;"><span style=3D"font-w=
eight: bold; color: #54ff54;"><br />dan@melon</span><span style=3D"font-wei=
ght: bold; color: #5454ff;"> ~/workspace_ssd/kas/openembedded-core $</span>=
<span style=3D"color: #000000;"> ./scripts/create-pull-request -u git@githu=
b.com:mangodan2003/openembedded-core.git &nbsp;</span><br />NOTE: Assuming =
remote branch 'gst-1.20.2', use -b to override. <br />NOTE: Assuming local =
branch HEAD, use -l to override. <br />fatal: unable to connect to github.c=
om: <br />github.com[0: 140.82.121.4]: errno=3DConnection timed out <br /><=
br />warn: No match for commit 38b9d17c45c15087d484559595b04c7b61fd8fbb fou=
nd at git://github.com/mangodan2003/openembedded-core <br />warn: Are you s=
ure you pushed 'gst-1.20.2' there? <br />ERROR: git request-pull reported a=
n error<br /><br /></span>

--lAzUlDwMIs56bFaGQc2N--

