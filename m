Return-Path: <jefro.net@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id D77C260248;
	Wed, 23 Mar 2016 22:04:11 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id bc4so19015838lbc.2;
	Wed, 23 Mar 2016 15:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=bvSrKB39i0yyIMzaSHtgwkON6owFCdmthwjRkqPiTHI=;
	b=0u8Uc+SyCXwQL+Ih/vFSKMO2YkhmawtE8HvJ+C7ZI46r4oxV4vuLvlEXvm1sWEHIYp
	Y5yDWXz5cCV7cv3TpJuxXw+yGUi3ouUQrVAVP7MNt9/u/tC+uVuyU4gG4FkRoqLstPYq
	GPsZWHv2qBOr0F3Vscw2ZeydB/O/C27MYuh8tSLX0sqah/dRHE7vhML3ZzEj9TcbvybR
	lMvUlZZoDMLt2HXtHpOxUFhF7THjOXuP46kizYSui7KADU7VncQDrHk2d0ODp7TDW4gw
	esbUZzUzjFTroMuW+VnHBe/TvTqzU4wvlNuQJCh3mpTCPhE0J/auas9zwAX5J5WNVKtG
	P+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=bvSrKB39i0yyIMzaSHtgwkON6owFCdmthwjRkqPiTHI=;
	b=hBy800o+wGriaq5V59Gj0+2dYSCHmrTOLBglKq1dEJQdqWFd9pkjTNKES7o6X0zYfM
	H1X3vG87qhMBhNP8RK2hTW181VezfgMcMyH+jcRj3+zXssQs6LWRX8o///rexWWj5fZ4
	gNqD76V95DwLiMZOEGCm0lPzlm9w84UCHbl0uAJAPxyWss1WGGbmK8clcpWkdTdxaa7u
	xLe1mumkdy6zLZeetNrc5UPZw0ItKih37j9zFJVGTrXIuXWGS+r56xpiUG8HRQwVk922
	hPSOtwXoiRRVVdOc2BN1PKNpfA+cPvqZOamUdGWWv+Xp5vROCe/cyT4js03j/EiL1NBM
	g3CA==
X-Gm-Message-State: AD7BkJI5RfiT9tWBYhNhfSM/IAhR/gD3ImPgOMvzyhGdTl8GGvfN+eaSaxGlt4LBP3K2b/a4RuCQq/3G2piZ9Q==
X-Received: by 10.112.130.74 with SMTP id oc10mr2175950lbb.14.1458770651846;
	Wed, 23 Mar 2016 15:04:11 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.55.101 with HTTP; Wed, 23 Mar 2016 15:03:52 -0700 (PDT)
In-Reply-To: <56F30D13.6030909@balister.org>
References: <56DEF97F.9070306@balister.org> <56F2C618.3050205@gmail.com>
	<20160323210850.GA5376@linux-yxv0> <1458767514382.89578@seescan.com>
	<56F30D13.6030909@balister.org>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Wed, 23 Mar 2016 15:03:52 -0700
X-Google-Sender-Auth: MtIiSnTYTTVhN51lcPGcjNX-nk4
Message-ID: <CA+YB3rYNxkjsFaRzAQVTvLtZLu_0sb=-nurdmQ8xixruGLAmOg@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Fred Ollinger <Fred.Ollinger@seescan.com>
Subject: Re: [yocto] [oe] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Wed, 23 Mar 2016 22:04:19 -0000
Content-Type: text/plain; charset=UTF-8

>>> There are only 10 people signed up.
>>> Is that enough people to justify the expense room or even meet?
>>
>> I have no idea what the budget might be or what a room might cost. I'll leave
>> it to those who do know to worry about the costs versus the benefits.

I would give an unequivocal "yes" to this (as the guy with the credit
card). We need reliable internet access to loop in those who can't be
there in person, plus this was actually a reasonable rate for the
immediate area. We can take up to 25 and these meetings usually gain 5
or 6 people who never sign up on the wiki, so I think we are in
excellent shape.

