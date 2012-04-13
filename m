Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SIl0L-0007xf-Mw
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 20:13:53 +0200
Received: by lagw12 with SMTP id w12so2473129lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 11:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=U8AyHQ9jF1NUP0wtXugoRlAZ2FecNIyRx7tRYGsI2mI=;
	b=FQIofZ8TgTB7aLngMxytvb7qOxEUC/aPWcgw/MM1MvlqfT/43ZrlkUVeGIdEPqJcrU
	LZNKmyPSuKkqs7KrqVOpdr/xniJBDv1X9FrvYVPIAKm8SQj+sWNb99+ONVtsw0XMyxmn
	0C0Y0mn6HDk8UukYFhT7MJdSfQkRi+14+Qjd+KsrvPH4cSfDBR7pfQNpmpxn2xwSXygp
	Qa95SjSUcPdcwrvIJs+fz7eQ3KEBIWulXLx0W5yH7LyEOzvvjTjIC1qP+TNMpK1FtTyj
	gtu2A8rkdWk3P8oS4JE/mXNTG+7gErxfbZ0O1HNmDYdgCgmh8VYObnQ5CpgQHJml8lxf
	n0tg==
Received: by 10.112.83.105 with SMTP id p9mr1170409lby.43.1334340272158; Fri,
	13 Apr 2012 11:04:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 13 Apr 2012 11:04:01 -0700 (PDT)
In-Reply-To: <36ED13F3654AE54CA763E6821D93A5711043A0E3@szxeml534-mbs.china.huawei.com>
References: <36ED13F3654AE54CA763E6821D93A5711043A0E3@szxeml534-mbs.china.huawei.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2012 11:04:01 -0700
Message-ID: <CAMKF1srcrA62scMr2jMCm6LcF1z-2oXQgLPB=dVGX-H1TF8GfQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Sanil kumar <sanil.kumar@huawei.com>
Subject: Re: [PATCH] boost: fix re-execution of task
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
X-List-Received-Date: Fri, 13 Apr 2012 18:13:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2012 at 4:42 AM, Venkata ramana gollamudi
<ramana.gollamudi@huawei.com> wrote:
> + =C2=A0 =C2=A0 =C2=A0 # D2194:Fixing the failure of "error: duplicate in=
itialization of gcc with the following parameters" during compilation.

same here.


