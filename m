Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RLIvh-0000xL-Lf
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 19:19:21 +0100
Received: by bkbzv3 with SMTP id zv3so3329312bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 11:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AqMxtrxeeyqfq59xBuxAhNblCFRODxLNs3m9QyA5zz8=;
	b=NqOlOuMjw2mEK9i+xtrgE9OSyPLOkvW5cOFNLgDbrVNjWyU4wYk4BbhuYNBbKP20Vt
	9bK6I2+Vfrq8bxmYRddOvpJ3VJeDaVlzRCd6MO+ZUz2B6UArVw7Uwp97wykENgBrvZYb
	ErZJL+SPaSpudu+4txXsYOuShf0Jqf85FJ2FE=
MIME-Version: 1.0
Received: by 10.204.145.15 with SMTP id b15mr602203bkv.52.1320171194867; Tue,
	01 Nov 2011 11:13:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Tue, 1 Nov 2011 11:13:14 -0700 (PDT)
In-Reply-To: <1320169288.20107.0.camel@ted>
References: <cover.1319793342.git.xiaofeng.yan@windriver.com>
	<377fce979410d7c10e766353ea5e95ec62ddbaf7.1319793342.git.xiaofeng.yan@windriver.com>
	<1320169288.20107.0.camel@ted>
Date: Tue, 1 Nov 2011 16:13:14 -0200
X-Google-Sender-Auth: -MaqOfSmc0ld8A0jAY6EYl8YMrk
Message-ID: <CAP9ODKrD2oaC2wWnLMo7+5gdsQCS9mVgiU77MozWQ3xV04j3iA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libarchive update to 2.8.5
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
X-List-Received-Date: Tue, 01 Nov 2011 18:19:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 1, 2011 at 15:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> Why do we still need libarchive 2.8.4 ?

We don't.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


