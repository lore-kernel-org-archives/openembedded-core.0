Return-Path: <twoerner@gmail.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id A82E86C1D5;
	Fri, 15 Mar 2019 14:32:55 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id j25so1711903lji.1;
	Fri, 15 Mar 2019 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Mt9XT371MDU8TXkoMQmgxyMrRbWLVKNV0HfNfkOHL9I=;
	b=bPUKYsB+Lo/hohgMXxMJMOeok/nDZa/Ne3Q7pNja99UqCKdoVXAHSJ9T5otxOkjy0d
	K7CM1PGM3nXzHJ5uxW0Ejun5dKSRNqabTEdrKvlSID8lm8xam24LuXykjb5jFQZxH1cY
	jt2yPRVQiUnyQktvHCXUWFIBfySmUhivlT7uClaC7EiavafKs2uNUa7QHR3yaO+4eNcf
	5TE5o2fGsOwl0lwQ+Ex9b7jYaqm9cqqAVcdfq1hFk8GDJ/szkHxwPgPprR61XJOhAQb+
	mKwiddRugu7QohWAktyNGMYst2U5s5eP8Q1ymcnZPQrLfXRxmEVfA39VeAaJ3Jt9jxHn
	Ribw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Mt9XT371MDU8TXkoMQmgxyMrRbWLVKNV0HfNfkOHL9I=;
	b=drc4pPHSEvhPXpSi16co4nIK97SJk4OGrKkdkzdJiTt1KV1c0SoWHQxFtywwD0ZJ2X
	gidYfhWRVqqLLk5KxGyf10ROgLfQVgd495swL0f1bYsaL+ABhkVukYu6vuTrgTOh0VD0
	EszrPpwXmx051of8XhhKPa9CceEVPEd9wVIzJLEChAUGkHno1qKTWH0Ot8yS0WDwQ9WD
	PwmT0NfGY3cvb+Sfd4047MKgNG97zKhttHfEZFhFUL8AJ2yVFeYIfZ5erh0j+F+vI7Ka
	Hm76yUDTsQsR36M2RYBUKwfZSNw+xMl2e9w6pybpZR1chMwCfJUdLBCMxufIZgr48TsG
	eI3Q==
X-Gm-Message-State: APjAAAXSjeE2rwF24MOyfOzaEOtcv/huuokUcVrM2Kh8zVhQl++yzKkn
	pQIn5tQtOH1cLtc/D3EplFNntzVoaidrHNEVSo8=
X-Google-Smtp-Source: APXvYqw2tFB62ExNJdsMYI9ImQu1AyIT/LMuJVDK9meUYoocDvN8cqXCEMNED56BfkMvwdaPeJzwNQNWn9ggtG3bj/8=
X-Received: by 2002:a2e:3810:: with SMTP id f16mr2329966lja.119.1552660376131; 
	Fri, 15 Mar 2019 07:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190315142753.GA10387@linux-uys3>
In-Reply-To: <20190315142753.GA10387@linux-uys3>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 15 Mar 2019 10:32:44 -0400
Message-ID: <CAHUNapStG=ZLWwJ9o1n4piceS3ffspW=9uyZBDxf19-=r_93Cw@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: OE Summit report from SCaLE17x
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
X-List-Received-Date: Fri, 15 Mar 2019 14:32:56 -0000
Content-Type: multipart/alternative; boundary="0000000000002d1b5e058422ea35"

--0000000000002d1b5e058422ea35
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 15, 2019 at 10:27 AM Trevor Woerner <twoerner@gmail.com> wrote:

> I'd like to thank the OE Board of Directors who
> gave me permission to create and run a mini-conference on their behalf.
>

... and provided funding!! (without which this event would never have been
able to happen) So thanks to the Board for the funding, and to everyone who
has contributed financially to OE who provide this funding.

--0000000000002d1b5e058422ea35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Mar 15, 2019 at 10:27 AM Trevor Woerner &lt;<a href=3D"mailt=
o:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">I&#39;d like to thank the OE Board =
of Directors who<br>
gave me permission to create and run a mini-conference on their behalf.<br>=
</blockquote><div><br></div><div>... and provided funding!! (without which =
this event would never have been able to happen) So thanks to the Board for=
 the funding, and to everyone who has contributed financially to OE who pro=
vide this funding. <br></div></div></div>

--0000000000002d1b5e058422ea35--
