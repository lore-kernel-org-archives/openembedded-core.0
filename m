Received: from mail-wi0-f181.google.com ([209.85.212.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UXX6d-0007sX-JS
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 15:30:19 +0200
Received: by mail-wi0-f181.google.com with SMTP id c10so1508904wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=uW6XZEdkScsO8LQqzXOmtJebvVDzPqG1D3+lZaSQcTI=;
	b=JIrT6uaNawqx9m6eTf6PtXAwAMC13ujXpIbKqA4DDK2LC1Ee068LJpvd4970heIzyo
	papi2uA+TYYMgqodyzUmBri6N9w45h6+PblBBiz8rzyfa953BSfrzQWaAUtBY14+u3Hx
	oX7HeyRatVKiLb1Fkg/RbVMh00ygJP+YZLzFDq4Wwbcg7KcGRFbYzUz/ZkqSF7mHXBwQ
	m5/vM2A7qjGrmjFaAEAgXiZJXKWDYfVJuowbBxoF6tJgFkkqrCF6ZHRgAPnIJC14/sN3
	UtVP53eRP6jQr/lFpwLAZoWD3BELbZzZz+HzbUbECxuqqVhciDBrL6c0qDm+D+GeEOrY
	5U1Q==
MIME-Version: 1.0
X-Received: by 10.180.20.37 with SMTP id k5mr29735777wie.27.1367413927458;
	Wed, 01 May 2013 06:12:07 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Wed, 1 May 2013 06:12:07 -0700 (PDT)
In-Reply-To: <CALbNGRTtwRSzpGtQuuKhSzST3dxALZObNPtVEXan-+-O5YV8dw@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
	<924E0E65-7A58-4F98-84F0-0A04BC9F2C23@gmail.com>
	<CALbNGRTtwRSzpGtQuuKhSzST3dxALZObNPtVEXan-+-O5YV8dw@mail.gmail.com>
Date: Wed, 1 May 2013 09:12:07 -0400
Message-ID: <CAHUNapTLCo5YU_=U9cgYqfcLR5amYtpD0UDe0T-Y_+=81Kt37w@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Wed, 01 May 2013 13:30:29 -0000
X-List-Received-Date: Wed, 01 May 2013 13:30:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Would contrib/jansa/test still be the most up-to-date choice for
building against meta-openembedded?

I just want to make sure I'm not duplicating existing effort.


