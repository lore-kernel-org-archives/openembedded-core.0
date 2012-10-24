Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1TR25Q-00078M-TZ; Wed, 24 Oct 2012 16:37:37 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so424389iac.6
	for <multiple recipients>; Wed, 24 Oct 2012 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=lE3eJOVkimMGliddr8jPs/vgfTQt5zn4lMqXZiTKiEA=;
	b=DhLyLTGcO/kj/J+uWc/sYUA6SRZbhLwYHxXGi5p5VnOe6sXWWLasoOKn+puH6rfWvQ
	/Ve7DI4cwSbZe/TS/OcAiTPacoryMB9MZ3HaAoWnLmGoTY1juHJlzz92wzj9lI5xHU5C
	YjP/uHikaDUMoaNcZzYaWxqtvZw3tB7qdke1f7PG2Pl9br/NyJ9DqJjKXRH4iog8VEi3
	60EFhfFE0+RRQDxM3mK21Dh9cvcQM8BM9mt3JP32s+2L2JsJtJqtjl/FRtaMblsOZQeY
	5ujNBRwoAMFiG+Lh7z5VC12r0a50rJUo50Miwh1ERzIvPogNzzXhXZDwlV0fq3nLoloo
	V5Mg==
MIME-Version: 1.0
Received: by 10.50.179.33 with SMTP id dd1mr2664232igc.31.1351088648802; Wed,
	24 Oct 2012 07:24:08 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Wed, 24 Oct 2012 07:24:08 -0700 (PDT)
In-Reply-To: <1351088462.3259.421.camel@phil-desktop>
References: <CALbNGRSX3AtHywq3RR3OryKbRWaqL=v2TE+xsuNsDQ3O2PY4hg@mail.gmail.com>
	<1351088462.3259.421.camel@phil-desktop>
Date: Wed, 24 Oct 2012 16:24:08 +0200
Message-ID: <CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Latest head causes challanges
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
X-List-Received-Date: Wed, 24 Oct 2012 14:37:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 4:21 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-10-24 at 16:19 +0200, Andreas M=C3=BCller wrote:
>> I updated my layers this morning. Since that I have huge fallout:
>> Poking around I found /usr/libexec is missing on my machine. Any idea
>> what might caused this?
>
> 406bd38b4232f9f399ef5ffe0b4fac72ed605a23?
>
> p.
>
Wow - I thought we are close to release...

Andreas


