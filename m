Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SB4mR-0003Xv-Js
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:43:47 +0100
Received: by lbbgi4 with SMTP id gi4so2405896lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=4a/SF9MxzmIH0yDURpjm4jIzN2FSY/Au+Lqu0j17Iu8=;
	b=uY9QArHdq+WV+zxlJ/AB0f2/P5sUNzdJxqVqqxxYE71ojGoCoxkrxq9Odq5+Mf85f3
	J0ESENef+yrSJE1Zim7gZxdWG5nlSYzKHVTPP4kOOuueZljl4AdlDVjbFCblbzh9pYcf
	Kz+25tQA//kQGlzIAgL5ziBEdS00gFIuOWpScGY8s1A9036tEgm7ysNTVaagCvTeUGAJ
	e20ZHDr/d7HKTun0x/RzPFNL0jOg6CwpncsBIHM2KUf/VoS73muCC70oLWSROidO/AF7
	JrymGLHOcwQdWFTFDbSgedaWosrIjwTV9HmpZr2lLV0rX9ElUKtI9w7I9pXXJGEggE4b
	OMAQ==
Received: by 10.112.84.42 with SMTP id v10mr4491631lby.50.1332509691386; Fri,
	23 Mar 2012 06:34:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Fri, 23 Mar 2012 06:34:21 -0700 (PDT)
In-Reply-To: <20120323120841.GD3879@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332471418-31459-2-git-send-email-raj.khem@gmail.com>
	<1332504268.9740.394.camel@ted>
	<20120323120841.GD3879@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Mar 2012 06:34:21 -0700
Message-ID: <CAMKF1sqLDW0XwMFfjSrtv9az9n552s0dhzXVbr1nMKWzxpL3ag@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] pixman: disable iwmmxt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 13:43:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 23, 2012 at 5:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>
> khem, will you send patch for meta-oe .bbaappend so we don't have it
> twice in OECONF?
>

yes eventually although I am short on time. So unless someone beats me
to it I will
> Cheers,


