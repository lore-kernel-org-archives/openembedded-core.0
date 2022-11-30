Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283E1C352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 17:03:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17159.1669827816293469635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 09:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C76F40AC9;
	Wed, 30 Nov 2022 17:03:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNDC2YHEgpB3; Wed, 30 Nov 2022 17:03:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E23A406B5;
	Wed, 30 Nov 2022 17:03:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 76EDF16368F; Wed, 30 Nov 2022 12:03:23 -0500 (EST)
Date: Wed, 30 Nov 2022 12:03:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@lists.yoctoproject.org>,
	openembedded-members@lists.openembedded.org
Subject: Re: [OE-core] OpenEmbedded Happy Hour November 30
Message-ID: <20221130170323.GS22689@denix.org>
References: <20221129131520.GP22689@denix.org>
 <CANNYZj__wodtcJzx3q7JTh15r9oF8RfSU_2XpgZ6aRvXVcTmvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj__wodtcJzx3q7JTh15r9oF8RfSU_2XpgZ6aRvXVcTmvQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 17:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174028

Well, historically we used to have the OpenEmbedded Happy Hour after the 
sessions on the second day of the Yocto Project Summit and ask people to 
re-join a different Zoom room to socialize. This time around there's a 
dedicated YP Summit social time reserved, so to avoid switchig Zooms, we 
decided to move the OpenEmbedded Happy Hour to Friday, December 2, after 
the virtual Developers Meeting. The public calendar has been updated 
accordingly. Thank you.

-- 
Denys


On Tue, Nov 29, 2022 at 07:57:57PM +0100, Alexander Kanavin wrote:
> Isn't that clashing with YPS social slot?
> https://summit.yoctoproject.org/yocto-project-summit-2022-11/talk/UBXLG8/
> 
> Alex
> 
> On Tue, 29 Nov 2022 at 14:15, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > All,
> >
> > This month OpenEmbedded Happy Hour coincides with the Yocto Project Summit
> > and will be held on Wednesday, November 30 after the sessions are over,
> > aroud 1800/6pm UTC (1pm ET / 10am PT). The usual Zoom link is in the Wiki:
> >
> > https://www.openembedded.org/wiki/Calendar
> > https://www.openembedded.org/wiki/Happy_Hours

