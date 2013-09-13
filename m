Return-Path: <joaohf@gmail.com>
Received: from mail-bk0-f54.google.com (mail-bk0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5330E60EE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 23:07:52 +0000 (UTC)
Received: by mail-bk0-f54.google.com with SMTP id mz12so705623bkb.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 16:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bYKHGwE73RnF/fMOR4fVwtr2NugazeG5Xn2qn1+jFqY=;
	b=D586eedF6cuyJ40TH4G5Qu1KQT121WqI1nI/cqcGA8fBNeNgkCcd9Z3BSRn79wxsk4
	F+Y25IZFG2EO+5+2oqd1yI/TCiqgjJ4jXFtunWcdYI3/QB6R0FD/B0NKYGlFTRrYjqq6
	0tphAVmYB+IXhGaVhJoQHsKem4t42t7nUoej9HFzgE6iYV5A7Utr7AtFd36cQkW3tUfb
	lRehgUwfRYuHqLkmkX80lrTo3u7S9tx2EUCSKKliCADqt/j7aVr88+sojSLt3qHFRiL6
	a7CNTg0gUcxfpHfu7fK5YOM6twd4bKMKCrvSgxNtWrphMJTWmz3h4lnnQcpnWy/4LZvv
	C2lA==
MIME-Version: 1.0
X-Received: by 10.204.69.12 with SMTP id x12mr13732582bki.14.1379113673179;
	Fri, 13 Sep 2013 16:07:53 -0700 (PDT)
Received: by 10.205.39.10 with HTTP; Fri, 13 Sep 2013 16:07:53 -0700 (PDT)
In-Reply-To: <1379105947.1285.115.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1379095958-15269-1-git-send-email-joaohf@gmail.com>
	<1379105947.1285.115.camel@dvhart-mobl4.amr.corp.intel.com>
Date: Fri, 13 Sep 2013 20:07:53 -0300
Message-ID: <CANFVK7-2YmdgeG9OHmh+ncURu+je+dKue+681ewTZuS83poAiw@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] boot-directdisk: Allow for EFI-only boot direct disk images
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
X-List-Received-Date: Fri, 13 Sep 2013 23:07:53 -0000
Content-Type: multipart/alternative; boundary=001a1132ec909872fa04e64bec8f

--001a1132ec909872fa04e64bec8f
Content-Type: text/plain; charset=UTF-8

Hi,

No changes between v1 and v2. I just tried to fix the line length. Now I
understood my mistake.

I'm going to send a v3 with the right line length.

Thanks

--001a1132ec909872fa04e64bec8f
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div><div>Hi,<br><br></div>No changes between v1 and v2. I just tried to fix the line length. Now I understood my mistake.<br><br>I&#39;m going to send a v3 with the right line length.<br><br></div><div>Thanks<br>
</div></div>

--001a1132ec909872fa04e64bec8f--
