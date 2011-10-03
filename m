Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RAqat-0002vb-UM
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 00:02:40 +0200
Received: by wwf27 with SMTP id 27so5297653wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 14:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=yhvxXKKVXh8kP3KFoJItYn/YMNybgM5gmY7q4teykVg=;
	b=Yl23oORKmy4BE4nFttmy4311dBQy4P/ji+sThITUx4zLMn8S7vXpxetIuN8Tzwonv5
	k4aZxkY9T4sdpiyGjxNdLeJxnNMJXufOrh1I4CHpA5UilSaM6MTWjM/dydQ871gwxlcf
	ggTQIR4223oMLwKPx2FFQhxwfTGl1nS498k3w=
Received: by 10.216.136.3 with SMTP id v3mr1489690wei.39.1317679027255; Mon,
	03 Oct 2011 14:57:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Mon, 3 Oct 2011 14:56:47 -0700 (PDT)
In-Reply-To: <4E8A2EF4.2090906@linux.intel.com>
References: <CA+YB3rZ0JEq2zY21kiQmUx3YFj6CYHoR0Pvg6O70UM=Mh1TN+Q@mail.gmail.com>
	<CABcZANk1DnADdN2F39QYOOM--KyJkxbguhQ0GPmv9BFeEPG_oA@mail.gmail.com>
	<4E8A2EF4.2090906@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 3 Oct 2011 14:56:47 -0700
X-Google-Sender-Auth: QkY0xVKYsLVJ5IrXTSJq3gBwfRE
Message-ID: <CABcZAN=Wu6TdshL96r8_JRK2HkaEkzPZYK2WiUaz=u7bSSPYFg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: MINUTES: OE-TSC meeting 29-Sep-2011
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
X-List-Received-Date: Mon, 03 Oct 2011 22:02:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 2:53 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 09/30/2011 11:16 AM, Chris Larson wrote:
>>
>> On Fri, Sep 30, 2011 at 11:14 AM, Jeff Osier-Mixon<jefro@jefro.net>
>> =C2=A0wrote:
>>>
>>> 1. Jefro
>>> 2. a. some minutes not making it to mailing list, Jefro to post on wiki
>>> =C2=A0 =C2=A0b. yocto evaluating gerrit, possible patchwork replacement=
 for OE,
>>> khem
>>> will research
>>
>> ReviewBoard may be worth looking at as an alternative to gerritt, as wel=
l.
>
> Not sure what kind of support it has for GIT, gerrit has git support whic=
h
> is why we want to evaluate it.

They both support git. I wouldn't have suggested evaluating anything
that didn't.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


