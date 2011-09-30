Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1R9jTZ-00038n-Ai
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 22:14:29 +0200
Received: by wyh5 with SMTP id 5so1557431wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 13:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=yIRAo2JhDbJ1Mzn3Em/7fZTEBaIqFDicv9mupGPblo0=;
	b=ahMO6hZZTLBp6/tir52zUNejyZ6yi9RDeavE61fYail9jrdgw/ldRC22QgrV3oOnRn
	kh37jbe2qmJ6Iu8q1BRO8mfFzL7Z3TGsyvbSYNa6Xgk6DVXNeV7OYm1Ija3BuqLapOjr
	xQmrpXghzTTVa5JLqYvPhwXfu6Tj7WuB1K7VI=
Received: by 10.216.72.72 with SMTP id s50mr3889176wed.39.1317413337155; Fri,
	30 Sep 2011 13:08:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Fri, 30 Sep 2011 13:08:37 -0700 (PDT)
In-Reply-To: <1317412759.11645.24.camel@scimitar>
References: <CA+YB3rZ0JEq2zY21kiQmUx3YFj6CYHoR0Pvg6O70UM=Mh1TN+Q@mail.gmail.com>
	<CABcZANk1DnADdN2F39QYOOM--KyJkxbguhQ0GPmv9BFeEPG_oA@mail.gmail.com>
	<1317412759.11645.24.camel@scimitar>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Sep 2011 13:08:37 -0700
X-Google-Sender-Auth: cR_E7B5JsQAv5R8l_-iEFguYTAQ
Message-ID: <CABcZANk3bjhA0mOzroWkx_M+YH1f01Pq9WjkgURah1yMNi_EdA@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Sep 2011 20:14:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 12:59 PM, Joshua Lock <josh@linux.intel.com> wrote:
> On Fri, 2011-09-30 at 11:16 -0700, Chris Larson wrote:
>> On Fri, Sep 30, 2011 at 11:14 AM, Jeff Osier-Mixon <jefro@jefro.net> wro=
te:
>> > 1. Jefro
>> > 2. a. some minutes not making it to mailing list, Jefro to post on wik=
i
>> > =C2=A0 =C2=A0b. yocto evaluating gerrit, possible patchwork replacemen=
t for OE, khem
>> > will research
>>
>> ReviewBoard may be worth looking at as an alternative to gerritt, as wel=
l.
>
> I think people like PatchWork and Gerrit because of their command line
> tools - do you know if ReviewBoard has cli tools too?

It does, yeah. I don't have a lot of personal experience with either
one, but I think we should evaluate both.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


