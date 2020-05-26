Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.48569.1590493056567585981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 04:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=HmLt2OoH;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=gx82=7i=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49WX4r0pKTz4y;
	Tue, 26 May 2020 13:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590493053;
	bh=XH1CW1zaPJDiIEwp6tLOLo2ijLM4gHnR2Y0+KxD9JTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmLt2OoH92tIIK06GhLxT8ys4uGZH85kQWcwtmHNv+Gd5vBdgCaOW+VVasWQzyneq
	 wDCs3rV/UGK4xAxz/Lal2T519OJIjnUpYzMWmn0M2fexF3DFdLt5Q69owL14HgByUd
	 qXk8yNpFo1pJqy0kpPzIiIC7wT9k0fYm3uxf4k416Ek5lp9cuTTjD0vfdCWUJpzdfr
	 uYvvOumcL2QCwWEIH1J7E3GOQXJqLbDFFFKjX9oOSwWCprfTSegH1660PuswMVlQpk
	 KScVh93t2Ey0oPE3zFsde6s+rrD14XfAp5qrpH/60Jdj6VcsAK4jW26Oz6XwvQsfo5
	 B7KfBr2LJfGTybkVeRgiKpmFJ4Ur8C+swHtC0yFWmChxumljO1v90DSm82zVQstMMv
	 H97wNpAxou/7wgYMrlHfb224nLzKXRDJK/6Fgoq+L0ZmcLXAJU9iI7otKT5tsWqowo
	 5E9qKYedaiYw6LmERh9ZbWBl5IBvAJCvUVMWKsaVWd/82oSjAoCy+Q6CaRbVR/bbeP
	 dO5Lg60yoWx8UX2AX6qBQikBTPeXmgxajJ/IazazM0h7fkWncuSHPkN1aZEzyjC1Ag
	 W5OY7+yUQXIc/lKaQuFlVdOLJVb8Xfsu9AVYzAXPnnTYTCT3f4JmMqu6MK0a6hdVX4
	 w59i0k6Sa895BSnQE4VL/+SQ=
Date: Tue, 26 May 2020 14:37:29 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: matthias.schoepfer@googlemail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
Message-ID: <20200526113729.GA26509@localhost>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
 <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
 <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
 <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 26, 2020 at 01:20:50PM +0200, Matthias Schoepfer via lists.openembedded.org wrote:
>...
> The question here seems to be, is the GPLv3 License itself GPLv3 licensed.
>...

  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.


cu
Adrian
