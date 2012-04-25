Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SN2ux-0008AF-5l
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 16:10:03 +0200
Received: by dakh32 with SMTP id h32so148347dak.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=m9tGyH7QW8OsDr2m3Zx247JIvCkJ+ouoLsfDchB53AQ=;
	b=QWxzzIc3E02cZOFaTXa1Bk4qJpDtbkM2jVNKuympsv4/vRSJF/Yeh8t+hgXyZLhRFN
	YPf/k7pcrFWQU7Or456RD6/g1SxUY7CZ5FF2d5iy31/rZGrQJ+4lIKNIno9YmlL597E4
	31ZL6ywx95qFhaG0DsFBzMDyk7m8tsUwp1OhHdaD8LPr6uIhA19N5jJTQvZMJLp0lEda
	JTYMgA2PmoadrOe3y6ZML0pg3QEWn/mqnfthi5/tXSU+lTRnm0VGkap7p6Wq68Jp95nN
	z5L4n6Iw1IvTa/By0Ft3uR4zVAgziqz92eq/XLpKaHB1sic1A3x1KmHLsAGhxZtC//oJ
	3TGA==
MIME-Version: 1.0
Received: by 10.68.125.131 with SMTP id mq3mr7393749pbb.123.1335362426403;
	Wed, 25 Apr 2012 07:00:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.212.134 with HTTP; Wed, 25 Apr 2012 07:00:26 -0700 (PDT)
In-Reply-To: <20120425133031.DFEBD204AE2@gemini.denx.de>
References: <cover.1335118369.git.otavio@ossystems.com.br>
	<0d6637cfcd02587fe62c2c550aac5a33ce9cc72d.1335118370.git.otavio@ossystems.com.br>
	<20120425133031.DFEBD204AE2@gemini.denx.de>
Date: Wed, 25 Apr 2012 11:00:26 -0300
X-Google-Sender-Auth: t6UPpSZXvuBFsU7AVc456U1ualY
Message-ID: <CAP9ODKoNhvXWL80dWHJYS3zLWHJZh6pPTvOK1vN7bMOMgCv30w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Wolfgang Denk <wd@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] u-boot-fw-utils: add 2012.04 release
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
X-List-Received-Date: Wed, 25 Apr 2012 14:10:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 25, 2012 at 10:30, Wolfgang Denk <wd@denx.de> wrote:
> Please update and use v2012.04.01 instead. =A0This is a bug fix release
> which fixes a nasty bug in the command line processing, which can
> cause incorrect execution of commands and scripts.

Once I get back to office, I prepare a patchset to update it.

Thanks by warn us.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


