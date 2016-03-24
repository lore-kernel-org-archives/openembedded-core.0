Return-Path: <rudolf.streif@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id E81B360110;
	Thu, 24 Mar 2016 18:36:41 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id tt10so28958581pab.3;
	Thu, 24 Mar 2016 11:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HTU98DcFcHyWfLS5J7113D72P8MRpKTOQYpsmj5imUg=;
	b=h8a6zgNN5vbkZ3C/EIVvAOY84smyVi/IXhvE8wmnh3qwwb/YI5ynIbLkqzsPWCI2pp
	SRHtFhsWvWcWc+PRxmA7U7fGVuIeUPfB9mPZA6wtd2fcE77/FxPcbawX1l528j403sPj
	6rqahGGoWmj9D//TTfLd0PD2UWejCruUSbKDZBgTls2WX+G7hNU7tvaxfbRYUuokwAIU
	svAuRjaN0nLDCyMykEyHnULLh6AsXw7hql6wXCS0Iw1Kdj/nSVPusuB1aTls6tEf7ByS
	RDQuR01Gt6+5U41W5ds68JUg24MabwvXM8VinD2shYJKOiZRGM+cu+1iFlSvpgwlV38H
	OVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HTU98DcFcHyWfLS5J7113D72P8MRpKTOQYpsmj5imUg=;
	b=MYOcdtW46/fx741imlPX+Q2g5IywE9el5IeMRHL7b1iAcRhmiySXBUYRzdaiLNM1Ev
	tM3jYyQ9rlWXfXCvLpi7ANwoyKBCREH4FHu7Tc3Lap3bNOHcJj/r+zuUi9my9PF2Mu+z
	AEljxnCHwWRda4xEw7G+Y664czo79t14c82SUtKxs/tDXROF34BkXvsd+y5kCZWj7TZ7
	sqw7hZUicZaYH6cimjEGmo4fF/6OIUjzDdL/tTKkkYR4gyeHbRKytFcjEb4rvNxTGNGg
	FE8+7Ct0cvC9sMKc54ZAB6mp0kp20V9SaVpLFzdBSiEc2uchNZmjx8tuuPUTZOkvnrcn
	NGYQ==
X-Gm-Message-State: AD7BkJLs/kDzdgmNq6qjWkDz02EzAFmIHEefjvn5zGbPRXQUrItJxfLeqAuEREW6d5oEQQ==
X-Received: by 10.66.191.225 with SMTP id hb1mr14851498pac.78.1458844602377;
	Thu, 24 Mar 2016 11:36:42 -0700 (PDT)
Received: from rjs-zotac.streifs.net (ip68-7-48-20.sd.sd.cox.net. [68.7.48.20])
	by smtp.gmail.com with ESMTPSA id
	qh8sm11674432pac.40.2016.03.24.11.36.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 11:36:41 -0700 (PDT)
From: Rudolf J Streif <rudolf.streif@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2016 11:36:40 -0700
Message-ID: <1604312.a7pP1GrPCb@rjs-zotac.streifs.net>
User-Agent: KMail/4.14.10 (Linux/4.4.5-200.fc22.x86_64+debug; KDE/4.14.17;
	x86_64; ; )
In-Reply-To: <56F42DA1.4090902@balister.org>
References: <56DEF97F.9070306@balister.org> <1458767514382.89578@seescan.com>
	<56F42DA1.4090902@balister.org>
MIME-Version: 1.0
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembedded-members@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [yocto] OEDAM, April 8 in San Diego after ELC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2016 18:36:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Since I happen to live in San Diego, I have been asking around for a potential meeting room (unfortunately, I don't have an office with a meeting room myself). I am currently working with the University of San Diego and the Catamaran/Bahia Hotel. Can't promise anything yet.

:rjs


On Thursday, March 24, 2016 11:10:41 AM Philip Balister wrote:
> We are up to fifteen now and as noted will have some off site attendees
> and late sign ups.
> 
> Philip
> 
> On 03/23/2016 02:11 PM, Fred Ollinger wrote:
> > I'm coming and I'm probably brining another person.
> > 
> > I still have to make the wiki account which failed for some reason before.
> > 
> > Frederick
> > ________________________________________
> > From: yocto-bounces@yoctoproject.org <yocto-bounces@yoctoproject.org> on behalf of Trevor Woerner <twoerner@gmail.com>
> > Sent: Wednesday, March 23, 2016 2:08 PM
> > To: akuster808; openembedded-devel@lists.openembedded.org; openembedded-core; Yocto Project; openembedded-members@lists.openembedded.org
> > Subject: Re: [yocto] [OE-core] [oe] OEDAM, April 8 in San Diego after ELC
> > 
> > On Wed 2016-03-23 @ 09:36:40 AM, akuster808 wrote:
> >> There are only 10 people signed up.
> >> Is that enough people to justify the expense room or even meet?
> > 
> > I have no idea what the budget might be or what a room might cost. I'll leave
> > it to those who do know to worry about the costs versus the benefits.
> > 
> > In any case I certainly think it's still worth meeting. A smaller, more
> > focused group can sometimes get more done than a larger group. Secondly, it's
> > my experience that more people always show up than sign up.
> > 
> > With a project like this there will always be things to discuss, and sometimes
> > a discussion goes better in person rather than online.
> > 
> > Best regards,
> >         Trevor
> > --
> > _______________________________________________
> > yocto mailing list
> > yocto@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/yocto
> > 
> 


