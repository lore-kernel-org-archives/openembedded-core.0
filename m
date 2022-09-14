Return-Path: <razriel@coretigo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F4DECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 17:46:36 +0000 (UTC)
Subject: cockpit recipe
To: openembedded-core@lists.openembedded.org
From: razriel@coretigo.com
X-Originating-Location: Ness Ziona, Central District, IL (109.186.51.200)
X-Originating-Platform: Windows Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Sep 2022 10:46:27 -0700
Message-ID: <vudy.1663177587694108775.uhq1@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AicGPgB525y1ax4jVFy9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 17:46:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170667

--AicGPgB525y1ax4jVFy9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I am trying to integrate cockpit recipe in my image.
cockpit is a web based linux managment tool.
cockpit is supported mosly in well know distors.
the recipe i am using is based on tag 220.
main problems I am trying to overcome:
1. in first login after image was flashed to emmc. the user is requiered to=
 change password. will not display the change password screen.
2. account managment is not working.
3. work with user different from root.
I have tried to understand the origin of the problem. it seems the cockpit.=
spawn command in the javascript returnes with error when trying to set pass=
word for user.
anyone can guide me throuth this issue ?

--AicGPgB525y1ax4jVFy9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I am trying to integrate cockpit recipe in my image.<br />cockpit is a web =
based linux managment tool.<br />cockpit is supported mosly in well know di=
stors.<br />the recipe i am using is based on tag 220.<br />main problems I=
 am trying to overcome:<br />1. in first login after image was flashed to e=
mmc. the user is requiered to change password. will not display the change =
password screen.<br />2. account managment is not working.<br />3. work wit=
h user different from root.<br />I have tried to understand the origin of t=
he problem. it seems the cockpit.spawn command in the javascript returnes w=
ith error when trying to set password for user.<br />anyone can guide me th=
routh this issue ?<br /><br /><br />

--AicGPgB525y1ax4jVFy9--

