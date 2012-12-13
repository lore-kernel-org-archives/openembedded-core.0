Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1TjDcj-0000pC-ID; Thu, 13 Dec 2012 19:35:09 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so2232146iad.6
	for <multiple recipients>; Thu, 13 Dec 2012 10:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SYMkzgSiVb78douT7L9uuPK9J2FjpjN0dwAiL2QYYKY=;
	b=dvg76nnLnbioZWLGzaSlgL6nVtCXRJ36f4ZXicWwlUKnEjkz3F0AKQRs9zXSrihq9h
	PglZYfle/zPFqujDbp/NQn7R1/nah2ytdn0xsW0KO9aqcgfy39wllQJ7vJF1ixiH1vdV
	3K9pG202tNPsuANbe9Lfj7+SqESBJk2ocRpldFWU/Wu7vuEPJvPkCQZBUvujNC4KTBN/
	wSGX2cIkrXnyBt5A5Mk4RoRRr/wtr6b2Y0kqlk0XfTqlIYBnI/RaajgMJ7Xh6KGO7CIz
	jVPvt7XqMB/RqmH0dQHvep7dV3yBQNh5OftwN4d5vrlJhDuMbdHOJIe/rE2ZFJhAcb5J
	K+qQ==
MIME-Version: 1.0
Received: by 10.50.179.33 with SMTP id dd1mr2667409igc.31.1355422833448; Thu,
	13 Dec 2012 10:20:33 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Thu, 13 Dec 2012 10:20:33 -0800 (PST)
In-Reply-To: <20121213174202.GE3356@jama.jama.net>
References: <20121213174202.GE3356@jama.jama.net>
Date: Thu, 13 Dec 2012 19:20:33 +0100
Message-ID: <CALbNGRQJCHMxY403ZbzehuurM2jt2UnVbdETqh=PVm73JV4BvA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 18:35:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 13, 2012 at 6:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> ERROR: Task 8067 (/OE/jansa-test/shr-core/meta-openembedded/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb, do_compile) failed with exit code '1'
Feel a bit responsible for this one. Could you give some details?

Andreas


