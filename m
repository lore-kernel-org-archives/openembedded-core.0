Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id E63A4606E8;
	Fri, 20 Feb 2015 23:46:44 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so11045711pdj.1;
	Fri, 20 Feb 2015 15:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cvbaA/19JKy2KeG8ZxE/aTgaD8pBNOGAtah5cZP4qKU=;
	b=tJK4zy7lVtsdmk+aJZLBkP1vKlDbpEclSbDp++T74mFNOnFsxymldMFdDhOsk/Gjdv
	6SZfNUcNc3FTosr51jGClCXseE6Smneh3uRw4LsCxSK7HCEmMawNwe5hv0m0hEPx2TR4
	sw+wn1DSQ08+sc34tJdSxo47NcAuBD2KjDEDd4gXUC7fKi+WulciE9Jk2RcmU1Ytgd++
	MS35NE69gT69XmHyJaaLdw/nvGcZNWjooLHgBnroqKA5Z6FZcHKQp9vzYzx/V6T9jhsH
	JpT9u/98udKgPkmmI+m7X4eaYpqY0mjiH8DcqMCS3/mk7s33sBwDYraTbxQzFH4KTFRj
	8f4g==
MIME-Version: 1.0
X-Received: by 10.66.221.227 with SMTP id qh3mr278541pac.1.1424476006249; Fri,
	20 Feb 2015 15:46:46 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Fri, 20 Feb 2015 15:46:46 -0800 (PST)
In-Reply-To: <20150220230920.GA2306@jama>
References: <20150220230920.GA2306@jama>
Date: Sat, 21 Feb 2015 00:46:46 +0100
Message-ID: <CALbNGRR8=eRtxemnvz7BBQ+fKbh8P8hDW6=ebogESjFJYXJFFQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-02-20
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
X-List-Received-Date: Fri, 20 Feb 2015 23:46:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 21, 2015 at 12:09 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> qt5-creator-3.3.0: qt5-creator rdepends on qt-creator, but it isn't a build dependency? [build-deps]
What can we do here?
> qt5-creator-3.3.0: qt5-creator rdepends on qtquick1, but it isn't a build dependency? [build-deps]
Seen this too will send a follow up once merged

Andreas

