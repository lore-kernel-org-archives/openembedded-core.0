Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RsvkI-0008Nr-JI
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 13:26:34 +0100
Received: by wgbdt11 with SMTP id dt11so8285637wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 04:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zO4BfZ3qsrw/Foig/qIhELdZcrehCJkjVafVLRJIH/M=;
	b=N3cjA/jkpkS1c0WhlUaUQY8Hax1SMCz9kBwVazKIEvGCHo5Ax/irKKn8Oo+5TAMToS
	BTPcX8SMCsRyzVtlbq2/G+Iy9Q+du2DJGMjk4LRWLp3r7m9ZLZ3dzRhtfkD/zGxH2OiC
	pV478hkEewP/jRljmeGf99DePimwhAKatLHBE=
MIME-Version: 1.0
Received: by 10.180.107.34 with SMTP id gz2mr4097976wib.21.1328185118611; Thu,
	02 Feb 2012 04:18:38 -0800 (PST)
Received: by 10.223.89.135 with HTTP; Thu, 2 Feb 2012 04:18:38 -0800 (PST)
In-Reply-To: <20120202115658.GH3697@jama.jama.net>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<20120202115658.GH3697@jama.jama.net>
Date: Thu, 2 Feb 2012 13:18:38 +0100
Message-ID: <CAGiJk9fa4b6ZABhmsWGxRu3MhC503WB-AYiJRdGPNc2cpezc4A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 02 Feb 2012 12:26:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/2/2 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Feb 02, 2012 at 12:50:16PM +0100, Samuel Stirtzel wrote:
>> Hi,
>>
>> for some time now I've been working on a port of Plasma Active, the
>> next generation touch user interface from KDE.
>> If you never heard about Plasma Active see [1].
>> For touch devices it is much more satisfying to use a GUI that is
>> designed for this input method, so I started porting it.
>> Someone already built Plasma Active for the Pandaboard [2] but it was
>> compiled native on the device, but somehow this inspired me to start
>> this project.
>
> Hi,
>
> are you "darkh" on IRC? Because he wrote me about his meta-kde layer few
> months ago, but haven't seen him since then.
>
> Cheers,
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
No, I am not.
However if there are already existent recipes it may be worth a look,
but I guess as you didn't post a link he had not provided more info?

This "project" started 2 week ago after I watched amazing videos about
Plasma Active two :)

--=20
Regards
Samuel


