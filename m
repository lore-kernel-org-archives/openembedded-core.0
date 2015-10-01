Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3E20577088
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 20:29:27 +0000 (UTC)
Received: by iofh134 with SMTP id h134so99442055iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=W2JsmjieL+RVFx3xOyUgqa33F50cFRq5mv5OcrEPUtg=;
	b=dy/p6noHpIOe5wYQO914HL0EZrZDdFxxeyQYTeCLkjxH7GJ9a8YMhXyacdtCmUUrXu
	HvElzsg8GR3JDsr9M+pv3Bdw0GXrkM1561iQKbU2WWF8TuAX6p3bOaDftpm0zHWWozsJ
	Li027b3EdlU/Omzovq+pgzDZjxixTAe2RLovxereycOOXPbuu32zQ/RXVFhdajMKJd9k
	OXvXigBbbvWawWzBmiCUlz4ZSgV4jNthFik3HQ6p9PcZwYFlvzuA5ElkidzallDqH87T
	+FKsT0fgClcD600df9l1yHC1HgXlGobG6asg4BjY7o2Nb9APlLBlcFtWdgfxBiLVrtjR
	IzZQ==
X-Received: by 10.107.137.106 with SMTP id l103mr10214554iod.112.1443731368001;
	Thu, 01 Oct 2015 13:29:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 13:28:58 -0700 (PDT)
In-Reply-To: <1443731146.14733.30.camel@linuxfoundation.org>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
	<1443713835.14733.13.camel@linuxfoundation.org>
	<3712B443-8857-41CB-87F9-DFFC12FE69E9@gmail.com>
	<1443731146.14733.30.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 13:28:58 -0700
Message-ID: <CAMKF1sr4yzn4AAYzjwD=sXUVSokKOmbwmjcjDW2nu2xUrYpg_g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 20:29:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 1:25 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> so when is the right time ? Do we have long enough pre-notice about
>> when we the branching is going to happen?
>
> We release approximately in April and October with a six month cadence.
>
> After the complaints about communication, there have been weekly status
> updates and the release dates were also *clearly* shown in there for
> when the release was planned. Incidentally, if those aren't useful,
> Stephen and I can stop doing them.
>
> Its not unreasonable to assume the branch for release happens sometime
> before the first rc build of the release.

treat this as discussion for next release, since enough water has
passed to make it for this one. I will open a bug in yocto tracker as
well as a  reminder

