Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SAlhC-0004cr-Ak
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:21:06 +0100
Received: by yhjj56 with SMTP id j56so1996516yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 10:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kSJtfI9r9dG/a2HTI1nMZDYuOiAYyR40DeGbjHcBDwg=;
	b=aNNnJyqKa3kFrzsxyEhgFQtCjXN8S4/u+HmDoWXqFk8gOlr/nT+tiwkoiTkMKf6yCa
	MmK3G/LJYLLzEHTXPHrB1gTSKudvDKciMHbUbQqtxAL6qe5+aMe2flwgipI7y5nyYAf5
	Txw0VwhDtqp6sanClLw9vK9NowMCQgu1P9Rj0SjOYoAibv0IAYghQP3ZVCyQH7LITkTi
	DOX+85sFndkrV5kVIP9TxgctPgXWKSdw++1D1a+dsTmIn58S0zKUbpgiY1U5rpOzZStS
	pqJ0/2Hf5DZSzUH7LYTbN/VTbolc/V62kx5nypTuqmiZIMt6zx/BsmQbdoyouqDeiHvS
	oogw==
MIME-Version: 1.0
Received: by 10.68.216.98 with SMTP id op2mr22113980pbc.93.1332436330095; Thu,
	22 Mar 2012 10:12:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.13.4 with HTTP; Thu, 22 Mar 2012 10:12:10 -0700 (PDT)
In-Reply-To: <1332348902.9740.175.camel@ted>
References: <CAP9ODKq3vD6u4TQnWw4Ux9c5L5fB3FVcstY_pCkmzp_HWddhRg@mail.gmail.com>
	<1332323639.9740.125.camel@ted> <1332348902.9740.175.camel@ted>
Date: Thu, 22 Mar 2012 14:12:10 -0300
X-Google-Sender-Auth: 6H97QlulA4_zqTywDobjOeeNZ5c
Message-ID: <CAP9ODKrL4RW8+5-MLPB3i0Y6Ke743gDHDPZG2fyiumwf5pE9Nw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build failures due zlib problem
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
X-List-Received-Date: Thu, 22 Mar 2012 17:21:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 13:55, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I've pushed a couple of fixes in this area which should help.

It fixed my issues.

Thanks a lot.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


