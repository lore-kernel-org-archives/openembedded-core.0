Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7C41760043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 17:09:13 +0000 (UTC)
Received: by qgj62 with SMTP id 62so14507274qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 10:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MZ2/GrfEvmngKOIbSa0fOSyY6+CE1Sz8WQb2wZfVP2A=;
	b=eD0/xSNAZmnHdHfODC/ANzkcVivI6DBg+finA6aoAHkjRpWZUbvMJzaXFlZn0GoJjO
	YZnAqILUTkAHFY+Lt7eaK2U92IyGOIUBM9uiKRjXLE957oLjoG5ueHD2xg8zhOzcRxv6
	wrX5gsPYduxlwXyE69IF8nMHDDvOKzSyzucORBjbLDmP32XlZxMMo3PldO+VIIt7e/a/
	chAqPI9UCKic0H9D0TwUResKCHNW+xmS0Dpn4qKxkvs1sopjHiBfJvYtabMZwIo5sypX
	2XKZaGToLb/9qVQJH+StKCfrI/kCF6Q+gKmNvI285TdeucERmtWjF0sT7Mg082xjqY74
	zqMg==
X-Gm-Message-State: ALoCoQlFCNkk9Mr7INMXvFdGSoR0aWoIuu0rEHZScrF2Y3Zg7tCyIZhyhmyxDhbVDlfcxQP6RRsg
X-Received: by 10.140.237.204 with SMTP id i195mr9016409qhc.93.1440695353729; 
	Thu, 27 Aug 2015 10:09:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Thu, 27 Aug 2015 10:08:54 -0700 (PDT)
In-Reply-To: <55DF3A71.1020204@linux.intel.com>
References: <1440600498-10313-1-git-send-email-anibal.limon@linux.intel.com>
	<55DF3A71.1020204@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Aug 2015 18:08:54 +0100
Message-ID: <CAJTo0La82wdfcDWRHF8AwoSjY0CL85k9HBaY=_Xz=4Ev33b9xA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-internal: Fixes unary operator expected in new TCPSERIAL_PORTNUM
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
X-List-Received-Date: Thu, 27 Aug 2015 17:09:17 -0000
Content-Type: multipart/alternative; boundary=001a1135a030ca12a3051e4e062b

--001a1135a030ca12a3051e4e062b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27 August 2015 at 17:27, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.inte=
l.com>
wrote:

> ping
>

It's in the queue - ross/mut is *giant* at this point but I just want to
see master pass once with all green...

Ross

--001a1135a030ca12a3051e4e062b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 August 2015 at 17:27, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limo=
n@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":1h6" class=3D"a3s" style=3D"overflow:hidden">ping</div></blockqu=
ote><div><br></div><div>It&#39;s in the queue - ross/mut is *giant* at this=
 point but I just want to see master pass once with all green...</div><div>=
<br></div><div>Ross=C2=A0</div></div></div></div>

--001a1135a030ca12a3051e4e062b--
