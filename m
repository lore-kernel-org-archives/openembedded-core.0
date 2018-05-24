Return-Path: <twoerner@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id B4805748CA;
	Thu, 24 May 2018 16:24:17 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id j1-v6so4229379wrm.1;
	Thu, 24 May 2018 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q+0TQectSiEifowTzI7Mm1peeROH9kCdhVzUXK3++d0=;
	b=dsPYdmItxbJDPKlOBEvlloZGfZY5fGAEXkITyG0IVqCxWbQMcuOVnr6RaP8UAY2BHX
	Phed2ef6H1unxll8YW06w7xbHDNFmyj5JqsYne6a3+nj1v2PO9ShcNDo15TUso4ge2cQ
	Quva/aAsAsGb88AETZGgG7WbzkWGSTrqMQUWtWY8kv7F+6UAB1LAUWOUzDfezMsb63+Z
	2AkFITeETPDnOGpmoZxN74skLuqHoByAmN4/IZNZy/NPZe/bNLtIop3CCavtYy/yc5E5
	GnSkp7si+YZ5GKtu5L/A9yORsxlw/VI9GhdInOaciHHL4tFiqJn5xykp60y3oBCk33ja
	sXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q+0TQectSiEifowTzI7Mm1peeROH9kCdhVzUXK3++d0=;
	b=VcjbrrwL0OmT7eyKvBNCRvdkfyzxhRdx56BQ6dlXDun53N2fvlhcMoEYHPCiW31cG6
	BNgDOTVe67U4ujxg3ZuPLzyCM1NzhMJgohZWcQXyr4L2etvp654F94xtr70J90M0sytc
	gA9D+VUkC4rg14BlK+YPU3G1OCiyxHfHycL6p7LJxexgpfPu0hphNooP3L6tbvEjr85l
	HgiJKP9LJ5A9eNAo/QHhzNcEz6caMcxArDY8wT0SkWAxdbtDe//eEL60ebury06/Fcmv
	hGyEveU3Z4PJP1ufPPJq9ZJIpyLsHWSTEj6AYpYPwUmdt0XctdbAjkejVKJbs3lBi+4s
	8qgA==
X-Gm-Message-State: ALKqPweLPBUsEzV3dYeQlrDJzIJ8uVW26ekZRj62kWTXnk7w7IyC/iYJ
	stc4RhUjfUJSPHfYS7NAF7DP1Ac34e7cOauEQMk=
X-Google-Smtp-Source: AB8JxZp3UkhfKO9MP+ersIJolVhHg1tuIi+0vEhgiqWcoKfF9ezv9XwUl61V2gX/Bl06sTTlUEQeHtjo6apEdcLZQIU=
X-Received: by 2002:a19:a70f:: with SMTP id
	q15-v6mr4812168lfe.39.1527179058347; 
	Thu, 24 May 2018 09:24:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Thu, 24 May 2018 09:24:17
	-0700 (PDT)
In-Reply-To: <CAMKF1so9=sE=QGD=Y7YysgTUxxUjvcvDJCHtQ5saVJY9Pn44XQ@mail.gmail.com>
References: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
	<CAMKF1so9=sE=QGD=Y7YysgTUxxUjvcvDJCHtQ5saVJY9Pn44XQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 24 May 2018 12:24:17 -0400
Message-ID: <CAHUNapTa4aPa2u0A7o6ZLSk+bhY02peNZ3Y7VOx++JrbSq7R7Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded maintainer ship change.
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
X-List-Received-Date: Thu, 24 May 2018 16:24:18 -0000
Content-Type: multipart/alternative; boundary="000000000000480326056cf61599"

--000000000000480326056cf61599
Content-Type: text/plain; charset="UTF-8"

Thanks to everyone for making this such a great community.
Thanks especially to Armin and Khem (and all past and future maintainers of
meta-openembedded!!) for allowing the project to keep moving forward.

--000000000000480326056cf61599
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Thanks to everyone for making this such a great community.<br></div>Thanks especially to Armin and Khem (and all past and future maintainers of meta-openembedded!!) for allowing the project to keep moving forward.<br></div>

--000000000000480326056cf61599--
