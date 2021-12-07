Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2B0C433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:36:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.339.1638894982856611773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9C1B0C0005;
	Tue,  7 Dec 2021 16:36:20 +0000 (UTC)
Subject: Re: [yocto] Help with Inclusive Language in OpenEmbedded/Yocto
 Project
To: Jon Mason <jdmason@kudzu.us>, yocto@lists.yoctoproject.org,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <27a273bd-3e0e-35bd-5d9a-e6a1c7922e9c@bootlin.com>
Date: Tue, 7 Dec 2021 17:36:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 16:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159313

Hi Jon,

On 12/7/21 2:01 AM, Jon Mason wrote:
> This email is a follow-up from the session held on Friday at the
> OpenEmbedded Developer's Virtual Meeting (see
> https://www.openembedded.org/wiki/OEDVM_Nov_2021)
>
> The session was not recorded, but the slides can be found at
> https://docs.google.com/presentation/d/146ueVVTMeA8JI43wqv5kFmdYEygqqmfGH0z1VRL2bDA/edit?usp=sharing
>
> The outcome from the discussion was that inclusive language changes
> are something that we want to accomplish in the kirkstone release
> timeframe (with an exception for the "master" branch name, which will
> be handled at a future date).
>
> There has already been a pass at collecting the needed changes at
> https://wiki.yoctoproject.org/wiki/Inclusive_language
>
> This is not as simple as a find/replace of offending words.  There is
> a desire for backward compatibility or to provide some kind of "you
> want X, which is now Y" (which complicates things).
>
> The intention of this email is to see who is interested in helping
> out.  Once we know how many people are available and what time frames,
> we can plan out a roadmap.  So, please email me (or respond to this
> thread publicly) and I'll add you to the list.  There will then be a
> follow-up zoom call in the next week or so to plan out the roadmap.
>
> We will document the roadmap and everything else on the YP wiki page above.
>
> Questions and comments are welcome, but not interested in debating the
> necessity or timeframe of this task.  It has already been decided.


Definitely interested. I had already started contributing to
https://wiki.yoctoproject.org/wiki/Inclusive_language. Count me in.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


