Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8C4770B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 01:37:30 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so7868215igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 18:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tkJOVDG3xOnXQl2GsP55w+wWOVda3UJp4k7TOEE3fkQ=;
	b=udovUV7fpjd1IIEluxudBs1RFAkhgJC6yoWI38PHlFkf6txe4tqCfLTKRk9lUYOP1F
	EgkStcBm5zRsN/MTldPbjTfVcyCirkjwSnpH2uMU9fPU3FbGoSMzlIFZ/Mzav1rVA5bT
	NlAG7mEstZbHM1pGj7KZHDwsp8F1INK4uTsW6Vhe1EWPOzzq4PWQ6OnI99eORw0Ae5cP
	A0XZFi8KT2BydvN8T7HQ9LrAJJZ5aFyrCnebd7PzvFZWOWxDjTpECEV3QfQgo+PMRTeC
	kOelkIRv/RLSgvUZnsi0TZZ19Bq5Kdv9juWssaYFjuSnNuTaEz4f7QmmX6v0Ua3zOqN6
	9zlw==
X-Received: by 10.50.20.67 with SMTP id l3mr1650756ige.75.1443749850701; Thu,
	01 Oct 2015 18:37:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 1 Oct 2015 18:37:01 -0700 (PDT)
In-Reply-To: <CAMKF1sr4yzn4AAYzjwD=sXUVSokKOmbwmjcjDW2nu2xUrYpg_g@mail.gmail.com>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
	<1443713835.14733.13.camel@linuxfoundation.org>
	<3712B443-8857-41CB-87F9-DFFC12FE69E9@gmail.com>
	<1443731146.14733.30.camel@linuxfoundation.org>
	<CAMKF1sr4yzn4AAYzjwD=sXUVSokKOmbwmjcjDW2nu2xUrYpg_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Oct 2015 18:37:01 -0700
Message-ID: <CAMKF1sregTGd7qa0=u=G1p6HeyXb3sNmhyNqaPbov92heVeLdw@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 Oct 2015 01:37:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 1:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Oct 1, 2015 at 1:25 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>> so when is the right time ? Do we have long enough pre-notice about
>>> when we the branching is going to happen?
>>
>> We release approximately in April and October with a six month cadence.
>>
>> After the complaints about communication, there have been weekly status
>> updates and the release dates were also *clearly* shown in there for
>> when the release was planned. Incidentally, if those aren't useful,
>> Stephen and I can stop doing them.
>>
>> Its not unreasonable to assume the branch for release happens sometime
>> before the first rc build of the release.
>
> treat this as discussion for next release, since enough water has
> passed to make it for this one. I will open a bug in yocto tracker as
> well as a  reminder

I have opened a tracker for 2.1 in bugzilla for this
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8432
everyone please feel free to record your inputs to this ticket.

